package usecases


import (
    "strconv"
    "net/http"
    "encoding/json"
    "github.com/mahani-software-engineering/bms-server/db"
)

func RegisteringUser(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type","application/json")
	var user db.User
	_ = json.NewDecoder(r.Body).Decode(&user)
	user.Save()
	newActionRecord(user.ID, "ACN0001", "Registered a new user", "user", (user.Firstname+" "+user.Lastname))
	json.NewEncoder(w).Encode(user)
}

type UserRights struct {
    Username string  `json:"username"`
    Rights uint `json:"rights"`
}

func AssignUserRights(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type","application/json")
	var rights UserRights
	_ = json.NewDecoder(r.Body).Decode(&rights)
	
    var user db.User
    database.First(&user, "username = ?", rights.Username)
    user.AccessRights = rights.Rights
    database.Save(&user)
    newActionRecord(user.ID, "ACN0002", "Assigned access rights", "user", (user.Firstname+" "+user.Lastname))
    json.NewEncoder(w).Encode(user)
}

type Credentials struct {
    Username string `json:"username"`
    Password string `json:"pxwd"`
}

func UserLogin(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type","application/json")
	var credentials Credentials
	_ = json.NewDecoder(r.Body).Decode(&credentials)
	
    var user db.User
    
    result := database.First(&user, "username = ?", credentials.Username)
    rows := result.RowsAffected
    if rows > 0 {
        r.Header.Add("User-Id", strconv.FormatUint(uint64(user.ID), 10))
        //newActionRecord(r, "ACN0003", "Signed in", "user", credentials.Username)
        json.NewEncoder(w).Encode(struct{ID uint; Success string}{ ID:user.ID, Success:"Signed in succeffully." })    
    }else{
        //r.Header.Add("User-Id", strconv.FormatUint(uint64(1), 10))
        //newActionRecord(r, "ACN03", "Attempted (failed) signing in", "user", "N/A", "")
        json.NewEncoder(w).Encode(struct{Err string}{ Err: "Access denied." })
    }
}

func userExists (identifier string) (bool, db.User, error) {
    //the identifier can be ID, phone, email, username
    user := db.User
    response := database.Where("id = ? OR phone = ? OR email = ? OR username = ?", identifier, identifier, identifier, identifier).First(&user)                   
    numberOfRowsFound := response.RowsAffected
    userExists := numberOfRowsFound > 0
    return userExists, user, response.Error
}

func ReadUser(w http.ResponseWriter, r *http.Request) {
    params := mux.Vars(r)
    identf := params["id"]
    //ensure that the identifier is converted to string if it's not one
    identifier = fmt.Sprintf("%s", identf)
    ok, user, err := userExists(identifier)
    if err != nil {
        //set error code
        //respond to client with "Server error! Please try again"
    }
    
    if !ok {
        //set error code for record not found error
        //respond with record not found error
    }
    
    //set error code 200 OK
    //respond with user data
}

func ReadAllUsers(w http.ResponseWriter, r *http.Request) {

}




