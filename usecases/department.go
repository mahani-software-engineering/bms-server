package usecases


import (
    "fmt"
    "strconv"
    "net/http"
    "encoding/json"
    "github.com/gorilla/mux"
    "github.com/mahani-software-engineering/bms-server/db"
)

func CreateDepartment(w http.ResponseWriter, r *http.Request) {
    var department db.Department
    _ = json.NewDecoder(r.Body).Decode(&department)
    database.Create(&department)
    msg := fmt.Sprintf("New department recorded")
    respondToClient(w, 201, department, msg)
}

func UpdateDepartment(w http.ResponseWriter, r *http.Request) {
    //TODO: implement
}

func departmentExists (identifier uint) (bool, db.Department, error) {
    //the identifier can be ID, phone, email, username
    var department db.Department
    response := database.Where("id = ?", identifier).First(&department)                   
    numberOfRowsFound := response.RowsAffected
    exists := numberOfRowsFound > 0
    return exists, department, response.Error
}

func ReadDepartment(w http.ResponseWriter, r *http.Request) {
    w.Header().Set("Content-Type","application/json")
    params := mux.Vars(r)
    identf := params["id"]
    if identifier, err := strconv.Atoi(identf); err == nil {
        ok, department, err := departmentExists(uint(identifier))
        if err != nil {
            respondToClient(w, 400, nil, err.Error())
        }
        
        if !ok {
            respondToClient(w, 404, nil, "Specified department record not found")
        }
        
        respondToClient(w, 200, department, "")
    }else{
        respondToClient(w, 403, nil, "Invalid department identifier")
    }
}

func ReadAllDepartments(w http.ResponseWriter, r *http.Request) {
    var departments []db.Department
    response := database.Find(&departments)
    numberOfRowsFound := response.RowsAffected
    msg := fmt.Sprintf("Found %d departments", numberOfRowsFound)
    respondToClient(w, 200, departments, msg)
}



