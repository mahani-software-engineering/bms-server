package usecases


import (
    "net/http"
    "encoding/json"
    "github.com/mahani-software-engineering/bms-server/db"
)



func CreatePayment(w http.ResponseWriter, r *http.Request) {
    params := mux.Vars(r)
    customerId := params["id"]
    //if customer exists {
        //if (item with the specified ID does not exists){
            //if (there are no arders sent in the request){
                 //create a new payment, dont auto customer
                 //respond with "Specified item not found. Payment saved as advance, will be considered in future"
            //}esle if (user has made orders within this request sent ) {
                //create the item, get new ID of the created item 
                //create a new payment, don't auto create customer
                //ensure the new item's "status" fields are set to "paid"
                //if the created item is an invoice or bill, ensure all orders in it have status "paid" 
                //respond to client
            }
        //}esle {
            //if (user has made orders within this request sent ) {
                //TODO: consider this case later than MVP
                //respond to client
            //}else{
               //create a fresh instance of the payment entity, get the new ID
               //modify the item's "status" field to "paid"
               //if the specified item is an invoice or bill, modify the status of all orders in it to "paid" 
               //respond to client
         //}
       //}
    //}else{
          //if (info for new customer provided){
                //if (user has made orders within this request sent ) {
                    //create a new order as sent in the request, get the new order item ID
                    //create a new payment, auto create customer,
                    //ensure the new order's "paid" field is set to true
                    //ensure the new order's "CustomerID" field is set to this new customer's ID
                    //respond to client
               //}else{
                    //create a new customer profile instead
                    //respond with "New customer registered, Payment advance saved" 
               //}
         //}else{
              //if (user has made orders within this request sent ) {
                    //create a new order as sent in the request, get the new order item ID
                    //create a new payment, don't auto create customer,
                    //ensure the new order's "paid" field is set to true
                    //respond to client
               //}else{
                    //respond with "Payment received from unspecified customer for unspecified product / service"
               //}
         //}
  //}
}

func UpdatePayment(w http.ResponseWriter, r *http.Request) {
    //TODO: implement
}

func paymentExists (identifier string) (bool, db.Bill, error) {
    //the identifier must be ID
    payment := db.Payment
    response := database.Where("id = ?", identifier).First(&payment)                   
    numberOfRowsFound := response.RowsAffected
    exists := numberOfRowsFound > 0
    fmt.Println(numberOfRowsFound, "payments exist =", exists)
    return exists, bill, response.Error
}

func ReadPayment(w http.ResponseWriter, r *http.Request) {
    readOne(w, r, paymentExists)
}

func ReadAllPayments(w http.ResponseWriter, r *http.Request) {
    payments := []db.Payment
    response := database.Find(&bilpaymentsls)
    numberOfRowsFound := response.RowsAffected
    json.NewEncoder(w).Encode(payments)
}


