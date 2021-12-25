package usecases


import (
    "fmt"
    "net/http"
    "encoding/json"
    "github.com/mahani-software-engineering/bms-server/db"
)

func CreateExpense(w http.ResponseWriter, r *http.Request) {
    var expense db.Expense
    _ = json.NewDecoder(r.Body).Decode(&expense)
    database.Create(&expense)
    msg := fmt.Sprintf("New expense recorded")
    respondToClient(w, 201, expense, msg)
}

func UpdateExpense(w http.ResponseWriter, r *http.Request) {
    //TODO: implement
}

func expenseExists (identifier string) (bool, db.Expense, error) {
    //the identifier must be ID
    var expense db.Expense
    response := database.Where("id = ?", identifier).First(&expense)                   
    numberOfRowsFound := response.RowsAffected
    exists := numberOfRowsFound > 0
    return exists, expense, response.Error
}

func ReadExpense(w http.ResponseWriter, r *http.Request) {
    //readOne(w, r, expenseExists)
}

func ReadAllExpenses(w http.ResponseWriter, r *http.Request) {
    var expenses []db.Expense
    response := database.Find(&expenses)
    numberOfRowsFound := response.RowsAffected
    exists := numberOfRowsFound > 0
    fmt.Println(numberOfRowsFound, "expenses exist =", exists)
    msg := fmt.Sprintf("Found %d records", numberOfRowsFound)
    respondToClient(w, 200, expenses, msg)
}

func ReadCountExpenses(w http.ResponseWriter, r *http.Request) {
    var expenses []db.Expense
    _ = database.Find(&expenses)
    var totalAmount uint
    for _, exp := range expenses {
        totalAmount = totalAmount + exp.Amount
    }
    respondToClient(w, 200, totalAmount, "")
}






