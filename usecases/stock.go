package usecases


import (
    "fmt"
    "net/http"
    "encoding/json"
    "github.com/mahani-software-engineering/bms-server/db"
)

func balanceStock(productId, op, qnty){
    var product db.Product
    switch op {
        case "add":
            database.Model(&product).Where("id = ?", productId).UpdateColumn("quantity", gorm.Expr("quantity + ?", qnty))
        case "remove":
            database.Model(&product).Where("id = ?", productId).UpdateColumn("quantity", gorm.Expr("quantity - ?", qnty))
        default: 
          fmt.Printf("Unknwn operation %s product\n", op)
    }
}

func CreateStockTransaction(w http.ResponseWriter, r *http.Request) {
    transcn := db.StockTransaction
    _ = json.NewDecoder(r.Body).Decode(&transcn)
    
    database.Create(&transcn)
    balanceStock(transcn.ProductID, transcn.Transaction, transcn.Quantity)
    
    specificActionDetails := fmt.Printf("Transation ID = %s, by: %s, %s %s", transcn.ID, transcn.CreatedBy, transcn.Transaction, transcn.ProductCategory)
    newActionRecord(pmt.createdby, "ACN0003", "Stock transaction recorded", specificActionDetails)     
    respondToClient(w, 201, pmt, "Stock transaction recorded successfully")
    //done.
}

func UpdateStockTransaction(w http.ResponseWriter, r *http.Request) {
    //TODO: implement
}

func stockTransactionExists (identifier string) (bool, db.StockTransaction, error) {
    //the identifier can be ID, phone, email, username
    transcn := db.StockTransaction
    response := database.Where("id = ?", identifier).First(&transcn)                   
    numberOfRowsFound := response.RowsAffected
    exists := numberOfRowsFound > 0
    return exists, transcn, response.Error
}

func ReadStockTransaction(w http.ResponseWriter, r *http.Request) {
    readOne(w, r, stockTransactionExists)
}

func ReadAllStockTransactions(w http.ResponseWriter, r *http.Request) {
    transcns := []db.StockTransaction
    response := database.Find(&transcns)
    numberOfRowsFound := response.RowsAffected
    msg := fmt.Sprintf("Found %s records", numberOfRowsFound)
    respondToClient(w, 200, transcns, msg)
}



