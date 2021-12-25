package usecases


import (
    "fmt"
    "errors"
    "strconv"
    "net/http"
    "encoding/json"
    "github.com/mahani-software-engineering/bms-server/db"
)

func RegisteringUser(w http.ResponseWriter, r *http.Request) {
	var user db.User
	_ = json.NewDecoder(r.Body).Decode(&user)
	user.Save()
	newActionRecord(user.ID, "ACN0001", "Registered a new user", "user", (user.Firstname+" "+user.Lastname))
	respondToClient(w, 201, user, "User registered succeffully.") 
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
    
    result := database.Where("username = ? AND password = ?", credentials.Username, credentials.Password).First(&user)
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
    //readOne(w, r, userExists)
}

func ReadAllUsers(w http.ResponseWriter, r *http.Request) {
    var users []db.User
    response := database.Find(&users)
    numberOfRowsFound := response.RowsAffected
    msg := fmt.Sprintf("Found %s records", numberOfRowsFound)
    respondToClient(w, 200, users, msg)
}




