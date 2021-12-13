package usecases


import (
    "strconv"
    "net/http"
    "encoding/json"
    "github.com/bms/bms-server/db"
)


func RegisteringUser(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type","application/json")
	var user db.User
	_ = json.NewDecoder(r.Body).Decode(&user)
	user.Save()
	uid := fmt.Sprintf("%s",user.ID)
	newActionRecord(uid, "ACN0001", "Registered a new user", "user", (user.Firstname+" "+user.Lastname))
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
    uid := fmt.Sprintf("%s",user.ID)
    newActionRecord(uid, "ACN0002", "Assigned access rights", "user", (user.Firstname+" "+user.Lastname))
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
        json.NewEncoder(w).Encode(struct{ID uint; Country string; Success string}{ ID:user.ID, Country:user.Country, Success:"Signed in succeffully." })    
    }else{
        //r.Header.Add("User-Id", strconv.FormatUint(uint64(1), 10))
        //newActionRecord(r, "ACN03", "Attempted (failed) signing in", "user", "N/A", "")
        json.NewEncoder(w).Encode(struct{Err string}{ Err: "Access denied." })
    }
}






