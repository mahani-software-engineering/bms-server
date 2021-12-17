package usecases


import (
    "net/http"
    "encoding/json"
    "github.com/mahani-software-engineering/bms-server/db"
)

func CreatePayment(w http.ResponseWriter, r *http.Request) {
    params := mux.Vars(r)
    dcase := params["id"]
    
    type ReceivedOrder struct {
        Item     string  `json:"item" gorm:"size:8"`
        Itemid:  uint    `json:"itemid"`
        Quantity uint    `json:"quantity"`
        Status   string  `json:"status"`
    }
    type ReceivedInvoice struct {
        Orders []db.OrderOrBooking `json:"orders"`
    }
    type ReceivedBill struct {
        Invoices string              `json:"invoices"`
        Orders   []db.OrderOrBooking `json:"orders"`
    }
    type ReceivedPayment struct {
        Order   ReceivedOrder   `json:"order"`
        Invoice ReceivedInvoice `json:"invoice"`
        Bill    ReceivedBill    `json:"bill"`
    }
    switch(dcase){
        case 5:
            //customer does not exist, no new customer info given, an order in the request, item=order
            var recvdPmt ReceivedPayment
            var pmt db.Payment
	        _ = json.NewDecoder(r.Body).Decode(&recvdPmt)
	        _ = json.NewDecoder(r.Body).Decode(&pmt)
	        
	        //create an order first
	        orderNew := db.OrderOrBooking{
	            Item:      recvdPmt.Order.Item,
	            ItemID:    recvdPmt.Order.ItemID,
	            Quantity:  recvdPmt.Order.Quantity,
	            Status:    recvdPmt.Order.Status,
	            Paid:      true,
	            Createdby: pmt.createdby,
	            //Customer: {}, //ignored on creation
	        }
	        database.Omit("Customer").Create(&orderNew)
	        //ID of the newly created order = orderNew.ID
	        pmt.Itemid = orderNew.ID
	        database.Omit("Customer").Create(&pmt)
	        if recvdPmt.Order.Item == "product" && orderNew.Status == "served" {
	            balanceStock(recvdPmt.Order.ItemID, "remove", recvdPmt.Order.Quantity)
	        }
	        //finished.
	        
	        specificActionDetails := fmt.Printf("Unregistered customer oredered and paid: %s", orderNew.Item)
	        newActionRecord(pmt.createdby, "ACN0002/5", "Payment received, customer not registered, new customer info not given, customer ordered for an item, item=order ", specificActionDetails)     
	        respondToClient(w, 201, pmt, "Payment recorded successfully")
	        //done.
        case 6:
            //customer does not exist, no new customer info given, an order in the request, item=invoice
            var recvdPmt ReceivedPayment
            var pmt db.Payment
	        _ = json.NewDecoder(r.Body).Decode(&recvdPmt)
	        _ = json.NewDecoder(r.Body).Decode(&pmt)
	        
	        //create an order first
	        invoiceNew := db.Invoice{
	            Amount:    pmt.Amount,
	            Status:    "paid",
	            Createdby: pmt.createdby,
	            Orders:    recvdPmt.Invoice.Orders,
	            //Customer: {}, //ignored on creation
	        }
	        invoiceOrders := &invoiceNew.Orders
            for _, order := range invoiceOrders {
                order.Paid = true
                order.Createdby = pmt.Createdby
                if order.Item == "product" && orderNew.Status == "served" {
	                balanceStock(order.ItemID, "remove", order.Quantity)
	            }
            }
	        database.Omit("Customer").Omit("Orders.Customer").Create(&invoiceNew)
	        //ID of the newly created invoice = invoiceNew.ID
	        pmt.Itemid = invoiceNew.ID
	        database.Omit("Customer").Create(&pmt)
	        //finished.
	        
	        specificActionDetails := fmt.Printf("Unregistered customer oredered and paid: %s", invoiceNew.Item)
	        newActionRecord(pmt.createdby, "ACN0002/6", "Payment received, customer not registered, new customer info not given, customer ordered for an item, item=invoice ", specificActionDetails)     
	        respondToClient(w, 201, pmt, "Payment recorded successfully")
	        //done.
        case 7:
            //customer does not exist, no new customer info given, an order in the request, item=bill
            var recvdPmt ReceivedPayment
            var pmt db.Payment
	        _ = json.NewDecoder(r.Body).Decode(&recvdPmt)
	        _ = json.NewDecoder(r.Body).Decode(&pmt)
	        
	        //create an order first
	        billNew := db.Bill{
	            Amount:    pmt.Amount,
	            Status:    "paid",
	            Createdby: pmt.createdby,
	            Invoices:  recvdPmt.Bill.Invoices,
	            Orders:    recvdPmt.Bill.Orders,
	            //Customer: {}, //ignored on creation
	        }
	        billOrders := &billNew.Orders
            for _, order := range billOrders {
                order.Status = "billed"
                order.Paid = true
                order.Createdby = pmt.Createdby
                if order.Item == "product" {
	                balanceStock(order.ItemID, "remove", order.Quantity)
	            }
            }
	        database.Omit("Customer").Omit("Orders.Customer").Create(&billNew)
	        //ID of the newly created bill = billNew.ID
	        pmt.Itemid = billNew.ID
	        database.Omit("Customer").Create(&pmt)
	        //finished.
	        
	        specificActionDetails := fmt.Printf("Unregistered customer oredered and paid: %s", billNew.Item)
	        newActionRecord(pmt.createdby, "ACN0002/7", "Payment received, customer not registered, new customer info not given, customer ordered for an item, item=bill ", specificActionDetails)     
	        respondToClient(w, 201, pmt, "Payment recorded successfully")
	        //done.
        case 9:
            //customer does not exist, new customer info given, no an order in the request, item=none
            var pmt db.Payment
	        _ = json.NewDecoder(r.Body).Decode(&pmt)
	        
	        database.Create(&pmt)
	        //finished.
	        
	        specificActionDetails := fmt.Printf("New customer registered and paid advance for future orders: payment ID = %s", pmt.ID)
	        newActionRecord(pmt.createdby, "ACN0002/9", "Payment received, customer was not registered, new customer info given, no new order by customer", specificActionDetails)     
	        respondToClient(w, 201, pmt, "Payment recorded successfully")
	        //done.
        case 13:
            //customer does not exist, new customer info given, an order in the request, item=order
            var recvdPmt ReceivedPayment
            var pmt db.Payment
	        _ = json.NewDecoder(r.Body).Decode(&recvdPmt)
	        _ = json.NewDecoder(r.Body).Decode(&pmt)
	        
	        //create an order first
	        orderNew := db.OrderOrBooking{
	            Item:      recvdPmt.Order.Item,
	            ItemID:    recvdPmt.Order.ItemID,
	            Quantity:  recvdPmt.Order.Quantity,
	            Status:    recvdPmt.Order.Status,
	            Paid:      true,
	            Createdby: pmt.createdby,
	            //Customer: {}, //ignored on creation
	        }
	        database.Omit("Customer").Create(&orderNew)
	        //ID of the newly created order = orderNew.ID
	        pmt.Itemid = orderNew.ID
	        database.Create(&pmt)
	        //find the ID of the newly auto created customer, and use it to update orderNew's "customerid" field
	        ok, custmr, err := userExists(pmt.Customer.Phone)
	        if err != nil {
	            fmt.Println("Error occured while trying to get the ID of the customer that was auto-created by creating payment.")
	        }
	        
	        if ok {
	            orderNew.CustomerID = custmr.ID
	        }
	        //now ready to update the orderNew in the database
	        database.Save(&orderNew)
	        if orderNew.Item == "product" && orderNew.Status == "served" {
                balanceStock(orderNew.ItemID, "remove", orderNew.Quantity)
            }
	        //finished.
	        
	        specificActionDetails := fmt.Printf("Customer: %s phone: %s",custmr.ID,custmr.Phone)
	        newActionRecord(pmt.createdby, "ACN0002/13", "Payment received, customer not registered, new customer info given, customer ordered for an item, item=order ", specificActionDetails)     
	        respondToClient(w, 201, pmt, "Payment recorded successfully")
	        //done.
        case 14:
            //customer does not exist, new customer info given, an order in the request, item=invoice
            var recvdPmt ReceivedPayment
            var pmt db.Payment
	        _ = json.NewDecoder(r.Body).Decode(&recvdPmt)
	        _ = json.NewDecoder(r.Body).Decode(&pmt)
	        
	        //create an order first
	        invoiceNew := db.Invoice{
	            Amount:    pmt.Amount,
	            Status:    "paid",
	            Createdby: pmt.createdby,
	            Orders:    recvdPmt.Invoice.Orders,
	            //Customer: {}, //ignored on creation
	        }
	        invoiceOrders := &invoiceNew.Orders
            for _, order := range invoiceOrders {
                order.Paid = true
                order.Createdby = pmt.Createdby
                if order.Item == "product" && orderNew.Status == "served" {
                    balanceStock(order.ItemID, "remove", order.Quantity)
                }
            }
	        database.Omit("Customer").Omit("Orders.Customer").Create(&invoiceNew)
	        //ID of the newly created invoice = invoiceNew.ID
	        pmt.Itemid = invoiceNew.ID
	        database.Create(&pmt)
	        //find the ID of the newly auto created customer, and use it to update invoiceNew's "customerid" field
	        ok, custmr, err := userExists(pmt.Customer.Phone)
	        if err != nil {
	            fmt.Println("Error occured while trying to get the ID of the customer that was auto-created by creating payment.")
	        }
	        
	        if ok {
	            invoiceNew.CustomerID = custmr.ID
	        }
	        for _, order := range invoiceOrders {
                order.CustomerID = custmr.ID
                order.InvoiceID = invoiceNew.ID
            }
	        //now ready to update the invoiceNew in the database
	        database.Save(&invoiceNew)
            //finished.
	        
	        specificActionDetails := fmt.Printf("Customer: %s phone: %s",custmr.ID,custmr.Phone)
	        newActionRecord(pmt.createdby, "ACN0002/14", "Payment received, customer not registered, new customer info given, customer ordered for an item, item=invoice ", specificActionDetails)     
	        respondToClient(w, 201, pmt, "Payment recorded successfully")
	        //done.
        case 15:
            //customer does not exist, new customer info given, an order in the request, item=bill
            var recvdPmt ReceivedPayment
            var pmt db.Payment
	        _ = json.NewDecoder(r.Body).Decode(&recvdPmt)
	        _ = json.NewDecoder(r.Body).Decode(&pmt)
	        
	        //create an order first
	        billNew := db.Bill{
	            Amount:    pmt.Amount,
	            Status:    "paid",
	            Createdby: pmt.createdby,
	            Invoices:  recvdPmt.Bill.Invoices,
	            Orders:    recvdPmt.Bill.Orders,
	            //Customer: {}, //ignored on creation
	        }
	        billOrders := &billNew.Orders
            for _, order := range billOrders {
                order.Status = "billed"
                order.Paid = true
                order.Createdby = pmt.Createdby
                if order.Item == "product" {
                    balanceStock(order.ItemID, "remove", order.Quantity)
                }
            }
	        database.Omit("Customer").Omit("Orders.Customer").Create(&billNew)
	        //ID of the newly created bill = billNew.ID
	        pmt.Itemid = billNew.ID
	        database.Create(&pmt)
	        //find the ID of the newly auto created customer, and use it to update billNew's "customerid" field
	        ok, custmr, err := userExists(pmt.Customer.Phone)
	        if err != nil {
	            fmt.Println("Error occured while trying to get the ID of the customer that was auto-created by creating payment.")
	        }
	        
	        if ok {
	            billNew.Customerid = custmr.ID
	        }
	        for _, order := range billOrders {
                order.BillID = billNew.ID
                order.CustomerID = custmr.ID
            }
	        //now ready to update the billNew in the database
	        database.Save(&billNew)
            //finished.
	        
	        specificActionDetails := fmt.Printf("Customer: %s phone: %s",custmr.ID,custmr.Phone)
	        newActionRecord(pmt.createdby, "ACN0002/15", "Payment received, customer not registered, new customer info given, customer ordered for an item, item=bill ", specificActionDetails)     
	        respondToClient(w, 201, pmt, "Payment recorded successfully")
	        //done.
        case 17:
            //customer exists, no new customer info given, no order in the request, item=order
            var pmt db.Payment
	        _ = json.NewDecoder(r.Body).Decode(&pmt)
	        
	        ok, custmr, err := userExists(pmt.CustomerID)
	        if err != nil {
	            fmt.Println("Error occured while trying to confirm existace of specified custmer on receiving payment.")
	        }
	        
	        if !ok {
	            respondToClient(w, 428, pmt, "Specified customer not found. Please register first")
	        }
	        
	        ook, order, errr := orderExists(pmt.ItemID)
	        if errr != nil {
	            fmt.Printf("Can't find the specified %s item.\n",pmt.Item)
	        }
	        
	        if !ook {
	            msge := fmt.Sprintf("Can't find the specified %s item.", pmt.Item)
	            respondToClient(w, 428, pmt, msge)
	        }
	        
	        order.paid = true
	        order.CustomerID = pmt.CustomerID
	        database.Save(&order)
	        if order.Item == "product" && orderNew.Status == "served" {
                balanceStock(order.ItemID, "remove", order.Quantity)
            }
	        
	        database.Omit("Customer").Create(&pmt)
	        //finished.
	        
	        specificActionDetails := fmt.Printf("Registered customer (id: %s) paid for earlier order: %s payment ID = %s", custmr.ID, order.ItemID, pmt.ID)
	        newActionRecord(pmt.createdby, "ACN0002/17", "Payment received, from registered customer, no new order by customer", specificActionDetails)     
	        respondToClient(w, 201, pmt, "Payment recorded successfully")
	        //done.
        case 21:
            //customer exists, no new customer info given, an order in the request, item=order
            var recvdPmt ReceivedPayment
            var pmt db.Payment
	        _ = json.NewDecoder(r.Body).Decode(&recvdPmt)
	        _ = json.NewDecoder(r.Body).Decode(&pmt)
	        
	        //create an order first
	        orderNew := db.OrderOrBooking{
	            Item:      recvdPmt.Order.Item,
	            ItemID:    recvdPmt.Order.ItemID,
	            Quantity:  recvdPmt.Order.Quantity,
	            Status:    recvdPmt.Order.Status,
	            Paid:      true,
	            Createdby: pmt.createdby,
	            CustomerID: pmt.CustomerID,
	            //Customer: {}, //ignored on creation
	        }
	        database.Omit("Customer").Create(&orderNew)
	        //ID of the newly created order = orderNew.ID
	        pmt.Itemid = orderNew.ID
	        database.Omit("Customer").Create(&pmt)
	        if orderNew.Item == "product" && orderNew.Status == "served" {
                balanceStock(orderNew.ItemID, "remove", orderNew.Quantity)
            }
	        //finished.
	        
	        specificActionDetails := fmt.Printf("Customer: %s, Ordered: %s",pmt.CustomerID, orderNew.Item)
	        newActionRecord(pmt.createdby, "ACN0002/21", "Payment received, customer is registered, new customer info not needed, customer ordered for an item, item=order", specificActionDetails)     
	        respondToClient(w, 201, pmt, "Payment recorded successfully")
	        //done.
        case 22:
            //customer exists, no new customer info given, an order in the request, item=invoice
            var recvdPmt ReceivedPayment
            var pmt db.Payment
	        _ = json.NewDecoder(r.Body).Decode(&recvdPmt)
	        _ = json.NewDecoder(r.Body).Decode(&pmt)
	        
	        //create an order first
	        invoiceNew := db.Invoice{
	            Amount:    pmt.Amount,
	            Status:    "paid",
	            Createdby: pmt.createdby,
	            Orders:    recvdPmt.Invoice.Orders,
	            CustomerID: pmt.CustomerID,
	            //Customer: {}, //ignored on creation
	        }
	        invoiceOrders := &invoiceNew.Orders
            for _, order := range invoiceOrders {
                order.Paid = true
                order.CustomerID = pmt.CustomerID
                order.Createdby = pmt.Createdby
                if order.Item == "product" && orderNew.Status == "served" {
                    balanceStock(order.ItemID, "remove", order.Quantity)
                }
            }
	        database.Omit("Customer").Omit("Orders.Customer").Create(&invoiceNew)
	        //ID of the newly created invoice = invoiceNew.ID
	        pmt.Itemid = invoiceNew.ID
	        database.Omit("Customer").Create(&pmt)
	        //finished.
	        
	        specificActionDetails := fmt.Printf("Customer: %s, Ordered: %s",pmt.CustomerID, orderNew.Item)
	        newActionRecord(pmt.createdby, "ACN0002/22", "Payment received, customer is registered, new customer info not needed, customer ordered for an item, item=invoice", specificActionDetails)     
	        respondToClient(w, 201, pmt, "Payment recorded successfully")
	        //done.
        case 23:
            //customer exists, no new customer info given, an order in the request, item=bill
            var recvdPmt ReceivedPayment
            var pmt db.Payment
	        _ = json.NewDecoder(r.Body).Decode(&recvdPmt)
	        _ = json.NewDecoder(r.Body).Decode(&pmt)
	        
	        //create an order first
	        billNew := db.Invoice{
	            Amount:    pmt.Amount,
	            Status:    "paid",
	            Createdby: pmt.createdby,
	            Orders:    recvdPmt.Invoice.Orders,
	            Invoices:  recvdPmt.Bill.Invoices,
	            CustomerID: pmt.CustomerID,
	            //Customer: {}, //ignored on creation
	        }
	        invoiceOrders := &billNew.Orders
            for _, order := range invoiceOrders {
                order.Status = "billed"
                order.Paid = true
                order.CustomerID = pmt.CustomerID
                order.Createdby = pmt.Createdby
                if order.Item == "product" {
                    balanceStock(order.ItemID, "remove", order.Quantity)
                }
            }
	        database.Omit("Customer").Omit("Orders.Customer").Create(&billNew)
	        //ID of the newly created invoice = billNew.ID
	        pmt.Itemid = billNew.ID
	        database.Omit("Customer").Create(&pmt)
	        //finished.
	        
	        specificActionDetails := fmt.Printf("Customer: %s, Ordered: %s",pmt.CustomerID, billNew.Item)
	        newActionRecord(pmt.createdby, "ACN0002/23", "Payment received, customer is registered, new customer info not needed, customer ordered for an item, item=bill", specificActionDetails)     
	        respondToClient(w, 201, pmt, "Payment recorded successfully")
	        //done.
        default:
            respondToClient(w, 400, pmt, "Bad Request (the service request is not well specified)")
    }
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
    response := database.Find(&payments)
    numberOfRowsFound := response.RowsAffected
    msg := fmt.Sprintf("Found %s records", numberOfRowsFound)
    respondToClient(w, 200, payments, msg)
}


