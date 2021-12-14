package usecases

import (
   "net/http"
   "gorm.io/gorm"
   "github.com/gorilla/mux"
   "github.com/mahani-software-engineering/bms-server/db"
)

var database *gorm.DB

func Init() {
    database, _ = db.Connect()
}

func readOne(w http.ResponseWriter, r *http.Request, existsFunc func(string)(bool, interface{}, error)) {
    w.Header().Set("Content-Type","application/json")
    params := mux.Vars(r)
    identf := params["id"]
    //ensure that the identifier is converted to string if it's not one
    identifier = fmt.Sprintf("%s", identf)
    
    ok, data, err := existsFunc(indentifier)
    if err != nil {
        //set error code
        //respond to client with "Server error! Please try again"
    }
    
    if !ok {
        //set error code for record not found error
        //respond with record not found error
    }
    
    //set error code 200 OK
    //respond with data
}








