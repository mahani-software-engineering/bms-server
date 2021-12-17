package usecases


import (
    "net/http"
    "encoding/json"
    "github.com/mahani-software-engineering/bms-server/db"
)

func CreateOrderOrBooking(w http.ResponseWriter, r *http.Request) {

}

type OrderNewStatus struct {
    OrderID uint     `json:"orderid"` 
    NewStatus string `json:"newstatus"`
}

func UpdateOrderOrBooking(w http.ResponseWriter, r *http.Request) {
    var updates OrderNewStatus
    _ = json.NewDecoder(r.Body).Decode(&updates)
    var order db.OrderOrBooking
    database.Model(&order).Where("id = ?", updates.OrderID).Update("status", updates.NewStatus)
    //balance stock
    if (order.Item == "product") && (order.Status == "served" || order.Status == "billed") && order.Paid {
        balanceStock(order.ItemID, "remove", order.Quantity)
    }
    //respond
    msg := fmt.Sprintf("Updated order status to %s", updates.NewStatus)
    respondToClient(w, 200, order, msg)
}

func orderExists (identifier string) (bool, db.OrderOrBooking, error) {
    //the identifier must be ID
    order := db.OrderOrBooking
    response := database.Where("id = ?", identifier).First(&order)                   
    numberOfRowsFound := response.RowsAffected
    exists := numberOfRowsFound > 0
    return exists, order, response.Error
}

func ReadOrderOrBooking(w http.ResponseWriter, r *http.Request) {
    readOne(w, r, orderExists)
}

func ReadAllOrderOrBookings(w http.ResponseWriter, r *http.Request) {
    orders := []db.OrderOrBooking
    response := database.Find(&orders)
    numberOfRowsFound := response.RowsAffected
    exists := numberOfRowsFound > 0
    fmt.Println(numberOfRowsFound, "orders exist =", exists)
    msg := fmt.Sprintf("Found %s records", numberOfRowsFound)
    respondToClient(w, 200, orders, msg)
}

func ReadOrdersByCustomer(w http.ResponseWriter, r *http.Request) {
    params := mux.Vars(r)
    customerPhone := params["id"]
    ok, custmr, err := userExists(pmt.Customer.Phone)
    if err != nil {
        fmt.Println("Customer is not registered.")
    }
    
    if !ok {
        msg := fmt.Sprintf("Customer phone %s is not registered.", customerPhone)
        respondToClient(w, 404, nil, msg)
    }
    
    orders := []db.OrderOrBooking
    response := database.Where("customer_id = ?", custmr.ID).Find(&orders)
    numberOfRowsFound := response.RowsAffected
    msg := fmt.Sprintf("Found %s records", numberOfRowsFound)
    respondToClient(w, 200, orders, msg)
}

func ReadOrdersByInvoice(w http.ResponseWriter, r *http.Request) {
    params := mux.Vars(r)
    invoiceId := params["id"]
    orders := []db.OrderOrBooking
    response := database.Where("invoice_id = ?", invoiceId).Find(&orders)
    numberOfRowsFound := response.RowsAffected
    msg := fmt.Sprintf("Found %s records", numberOfRowsFound)
    respondToClient(w, 200, orders, msg)
}

func ReadOrdersByBill(w http.ResponseWriter, r *http.Request) {
    params := mux.Vars(r)
    billId := params["id"]
    orders := []db.OrderOrBooking
    response := database.Where("bill_id = ?", billId).Find(&orders)
    numberOfRowsFound := response.RowsAffected
    msg := fmt.Sprintf("Found %s records", numberOfRowsFound)
    respondToClient(w, 200, orders, msg)
}




