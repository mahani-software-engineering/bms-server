package usecases


import (
    "fmt"
    "errors"
    "strconv"
    "net/http"
    "encoding/json"
    "github.com/gorilla/mux"
    "github.com/mahani-software-engineering/bms-server/db"
)

func RegisteringUser(w http.ResponseWriter, r *http.Request) {
	var user db.User
	_ = json.NewDecoder(r.Body).Decode(&user)
	user.Save()
	newActionRecord(user.ID, "ACN0001", "Registered a new user", "user", (user.Firstname+" "+user.Lastname))
	respondToClient(w, 201, user, "User registered succeffully.") 
}

type Guest struct {
    db.User                   
    Package db.OrderOrBooking `json:"package"`
}

func RegisterNewGuest(w http.ResponseWriter, r *http.Request) {
	var user db.User
	var order db.OrderOrBooking
	var guest Guest
	_ = json.NewDecoder(r.Body).Decode(&guest)
	order.Item        = guest.Package.Item
    order.ItemID      = guest.Package.ItemID
    order.Quantity    = 1
    order.Status      = guest.Package.Status
    order.Paid        = guest.Package.Paid
    order.Customer.Firstname           = guest.Firstname
    order.Customer.Lastname            = guest.Lastname
    order.Customer.Phone               = guest.Phone
    order.Customer.Email               = guest.Email
    order.Customer.Address             = guest.Address
    order.Customer.IdentityCardNumber  = guest.IdentityCardNumber
    order.Customer.IdentityCardType    = guest.IdentityCardType
    order.Customer.Nationality         = guest.Nationality
    order.Customer.Username            = guest.Username
    order.Customer.Password            = guest.Password
    order.Customer.AccessRights        = guest.AccessRights
    order.Customer.UserType            = guest.UserType
	database.Omit("Visit","VisitID","InvoiceID","BillID").Create(&order)
	//newActionRecord(user.ID, "ACN0001", "Registered a new user", "user", (user.Firstname+" "+user.Lastname))
	respondToClient(w, 201, user, "Guest registered succeffully.")
}

type UserRights struct {
    Username string  `json:"username"`
    Rights uint `json:"rights"`
}

func AssignUserRights(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	var rights UserRights
	_ = json.NewDecoder(r.Body).Decode(&rights)
	
    var user db.User
    database.First(&user, "username = ?", rights.Username)
    user.AccessRights = rights.Rights
    database.Save(&user)
    newActionRecord(user.ID, "ACN0002", "Assigned access rights", "user", (user.Firstname+" "+user.Lastname))
    respondToClient(w, 200, user, "Rights updated succeffully.") 
}

type Credentials struct {
    Username string `json:"username"`
    Password string `json:"pxwd"`
}

func UserLogin(w http.ResponseWriter, r *http.Request) {
	var credentials Credentials
	_ = json.NewDecoder(r.Body).Decode(&credentials)
	
    var user db.User
    
    result := database.Where("(username = ? OR phone = ? OR email = ?) AND password = ?", credentials.Username, credentials.Username, credentials.Username, credentials.Password).First(&user)
    rows := result.RowsAffected
    if rows > 0 {
        fmt.Println("Signed in succeffully.")
        //newActionRecord(r, "ACN0003", "Signed in", "user", credentials.Username)
        respondToClient(w, 200, user, "Sign in succeffully.")    
    }else{
        fmt.Println("Signed in failed.")
        //newActionRecord(r, "ACN03", "Attempted (failed) signing in", "user", "N/A", "")
        respondToClient(w, 403, nil, "Access denied.")
    }
}

func userExists (identifier string) (bool, db.User, error) {
    //the identifier can be ID, phone, email, username
    var user db.User
    response := database.Where("id = ? OR phone = ? OR email = ? OR username = ?", identifier, identifier, identifier, identifier).First(&user)                   
    numberOfRowsFound := response.RowsAffected
    userExists := numberOfRowsFound > 0
    
    if !userExists {
        if id, err := strconv.Atoi(identifier); err == nil {
            resp := database.Where("id = ?", uint(id)).First(&user)
            rowsFound := resp.RowsAffected
            exists := rowsFound > 0
            return exists, user, response.Error
        }else{
            return false, user, errors.New("user id must be a number")
        } 
    }else{
        return userExists, user, response.Error
    }
}

func ReadUser(w http.ResponseWriter, r *http.Request) {
    params := mux.Vars(r)
    identifier := params["id"]
    
    ok, user, err := userExists(identifier)
    if err != nil {
        respondToClient(w, 400, nil, err.Error())
    }
    
    if !ok {
        respondToClient(w, 404, nil, "Specified User not found")
    }
    
    respondToClient(w, 200, user, "")
}

func ReadAllUsers(w http.ResponseWriter, r *http.Request) {
    var users []db.User
    response := database.Find(&users)
    numberOfRowsFound := response.RowsAffected
    msg := fmt.Sprintf("Found %d users", numberOfRowsFound)
    respondToClient(w, 200, users, msg)
}

func ReadAllCustomers(w http.ResponseWriter, r *http.Request) {
    var customers []db.User
    response := database.Where("user_type = ?", "customer").Find(&customers)
    numberOfRowsFound := response.RowsAffected
    msg := fmt.Sprintf("Found %d customers", numberOfRowsFound)
    respondToClient(w, 200, customers, msg)
}

func ReadCountCustomers(w http.ResponseWriter, r *http.Request) {
    var users []db.User
    response := database.Where("user_type = ?", "customer").Find(&users)
    numberOfRowsFound := response.RowsAffected
    msg := fmt.Sprintf("Found %d customers", numberOfRowsFound)
    respondToClient(w, 200, numberOfRowsFound, msg)
}

func ReadAllGuests(w http.ResponseWriter, r *http.Request) {
    var guests []db.User
    
    subTable1 := database.Model(&db.Package{}).Where("category = ?", "guests").Select("id as packageid")     
    subTable2 := database.Model(&db.OrderOrBooking{}).Where("item = ?", "package").Select("item_id as packageid, customer_id")
    joinedTable := database.Table("(?) as p",subTable1).Joins("JOIN (?) as o on p.packageid=o.packageid",subTable2).Select("o.customer_id").Group("o.customer_id")
    response := database.Table("users").Joins("JOIN (?) as csm on csm.customer_id=users.id", joinedTable).Select("users.*").Find(&guests)
    
    numberOfRowsFound := response.RowsAffected
    msg := fmt.Sprintf("Found %d guests", numberOfRowsFound)
    respondToClient(w, 200, guests, msg)
}

func ReadCountGuests(w http.ResponseWriter, r *http.Request) {
    var guests []db.User
    
    subTable1 := database.Model(&db.Package{}).Where("category = ?", "guests").Select("id as packageid")     
    subTable2 := database.Model(&db.OrderOrBooking{}).Where("item = ?", "package").Select("item_id as packageid, customer_id")
    joinedTable := database.Table("(?) as p",subTable1).Joins("JOIN (?) as o on p.packageid=o.packageid",subTable2).Select("o.customer_id").Group("o.customer_id")
    response := database.Table("users").Joins("JOIN (?) as csm on csm.customer_id=users.id", joinedTable).Select("users.*").Find(&guests)
    
    numberOfRowsFound := response.RowsAffected
    msg := fmt.Sprintf("Found %d guests", numberOfRowsFound)
    respondToClient(w, 200, numberOfRowsFound, msg)
}

    




