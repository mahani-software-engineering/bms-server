package main


import (
    "fmt"
    "log"
	"flag"
	"embed"
	"io/fs"
	"strings"
	"net/http"
	"encoding/json"
	"github.com/gorilla/mux"
	"github.com/mahani-software-engineering/bms-server/db"
	uc "github.com/mahani-software-engineering/bms-server/usecases"
)

//go:embed client/web/*
var static embed.FS

func htmlWebsite(w http.ResponseWriter, r *http.Request) {
	website, _ := fs.Sub(static, "client")
    handler := http.FileServer(http.FS(website))
    handler.ServeHTTP(w, r)
}

func index(w http.ResponseWriter, r *http.Request) {
    json.NewEncoder(w).Encode(struct{Success string}{Success: "API home"})
}

func resourceNotFound(w http.ResponseWriter, r *http.Request) {
    json.NewEncoder(w).Encode(struct{Success string}{Success: "The API doesn't have what you are looking for !"})
}

func getRouter() *mux.Router {
	website, _ := fs.Sub(static, "client/web")
	router := mux.NewRouter()
	router.HandleFunc("/user/login", uc.UserLogin).Methods("POST")
	router.HandleFunc("/user/register", uc.RegisteringUser).Methods("POST")
	router.HandleFunc("/user/rights/{id}", uc.AssignUserRights).Methods("PUT")
	router.HandleFunc("/user/read/{id}", uc.ReadUser).Methods("GET")
	router.HandleFunc("/user/read", uc.ReadAllUsers).Methods("GET")
	//router.Path("/user/read").Queries("skip", "{skip}").HandlerFunc(uc.ReadAllUsers).Name("pagenation").Methods("GET")
	//Product
	router.HandleFunc("/product", uc.CreateProduct).Methods("POST")
	router.HandleFunc("/product/{id}", uc.UpdateProduct).Methods("PUT")
	router.HandleFunc("/product/{id}", uc.ReadProduct).Methods("GET")
	router.HandleFunc("/product", uc.ReadAllProducts).Methods("GET")
	//Service
	router.HandleFunc("/service", uc.CreateService).Methods("POST")
	router.HandleFunc("/service/{id}", uc.UpdateProduct).Methods("PUT")
	router.HandleFunc("/service/{id}", uc.ReadService).Methods("GET")
	router.HandleFunc("/service", uc.ReadAllServices).Methods("GET")
	//Package
	router.HandleFunc("/package", uc.CreatePackage).Methods("POST")
	router.HandleFunc("/package/{id}", uc.UpdatePackage).Methods("PUT")
	router.HandleFunc("/package/{id}", readPackage).Methods("GET")
	router.HandleFunc("/package", uc.ReadAllPackages).Methods("GET")
	//Visit
	router.HandleFunc("/visit", uc.CreateVisit).Methods("POST")
	router.HandleFunc("/visit/{id}", uc.UpdateVisit).Methods("PUT")
	router.HandleFunc("/visit/{id}", uc.ReadVisit).Methods("GET")
	router.HandleFunc("/visit", uc.ReadAllVisits).Methods("GET")
	//Order or Booking
	router.HandleFunc("/order", uc.CreateOrderOrBooking).Methods("POST")
	router.HandleFunc("/booking", uc.CreateOrderOrBooking).Methods("POST")
	router.HandleFunc("/order/{id}", uc.UpdateOrderOrBooking).Methods("PUT")
	router.HandleFunc("/booking/{id}", uc.UpdateOrderOrBooking).Methods("PUT")
	router.HandleFunc("/order/{id}", uc.ReadOrderOrBooking).Methods("GET")
	router.HandleFunc("/booking/{id}", uc.ReadOrderOrBooking).Methods("GET")
	router.HandleFunc("/order", uc.ReadAllOrdersOrBookings).Methods("GET")
	router.HandleFunc("/booking", uc.ReadAllOrdersOrBookings).Methods("GET")
	router.HandleFunc("/order/bycusomer/{id}", uc.ReadOrdersByCustomer).Methods("GET")
	router.HandleFunc("/booking/bycusomer/{id}", uc.ReadOrdersByCustomer).Methods("GET")
	router.HandleFunc("/order/byinvoice/{id}", uc.ReadOrdersByInvoice).Methods("GET")
	router.HandleFunc("/booking/byinvoice/{id}", uc.ReadOrdersByInvoice).Methods("GET")
	router.HandleFunc("/order/bybill/{id}", uc.ReadOrdersByBill).Methods("GET")
	router.HandleFunc("/booking/bybill/{id}", uc.ReadOrdersByBill).Methods("GET")
	//Payment
	router.HandleFunc("/payment/{id:[5,6,7,9,13,14,15,17,18,19,21,22,23]}", uc.CreatePayment).Methods("POST")
	router.HandleFunc("/payment/{id}", uc.UpdatePayment).Methods("PUT")
	router.HandleFunc("/payment/{id}", uc.ReadPayment).Methods("GET")
	router.HandleFunc("/payment", uc.ReadAllPayments).Methods("GET")
	//Invoice
	router.HandleFunc("/invoice/{id}", uc.CreateInvoice).Methods("POST")
	router.HandleFunc("/invoice/{id}", uc.ReadInvoice).Methods("GET")
	router.HandleFunc("/invoice", uc.ReadAllInvoices).Methods("GET")
	//Bill
	router.HandleFunc("/bill/{id}", uc.CreateBill).Methods("POST")
	router.HandleFunc("/bill/{id}", uc.ReadBill).Methods("GET")
	router.HandleFunc("/bill", uc.ReadAllBills).Methods("GET")
	//StockTransaction
	router.HandleFunc("/stock/add", uc.CreateStockTransaction).Methods("POST")
	router.HandleFunc("/stock/remove", uc.CreateStockTransaction).Methods("POST")
	router.HandleFunc("/stock/update/{id}", uc.UpdateStockTransaction).Methods("PUT")
	router.HandleFunc("/stock/read/{id}", uc.ReadStockTransaction).Methods("GET")
	router.HandleFunc("/stock/browse", uc.ReadAllStockTransactions).Methods("GET")
	//Expense
	router.HandleFunc("/expense", uc.CreateExpense).Methods("POST")
	router.HandleFunc("/expense/{id}", uc.UpdateExpense).Methods("PUT")
	router.HandleFunc("/expense/{id}", uc.ReadExpense).Methods("GET")
	router.HandleFunc("/expense", uc.ReadAllExpenses).Methods("GET")
	//UserAction
	router.HandleFunc("/activity/{id}", uc.ReadUserAction).Methods("GET")
	router.HandleFunc("/activity", uc.ReadAllUserActions).Methods("GET")
	//Message
	router.HandleFunc("/message", uc.CreateMessage).Methods("POST")
	router.HandleFunc("/message/{id}", uc.UpdateMessage).Methods("PUT")
	router.HandleFunc("/message/{id}", uc.ReadMessage).Methods("GET")
	router.HandleFunc("/message", uc.ReadAllMessages).Methods("GET")
	//Notification
	router.HandleFunc("/notification", uc.CreateNotification).Methods("POST")
	router.HandleFunc("/notification/{id}", uc.UpdateNotification).Methods("PUT")
	router.HandleFunc("/notification/{id}", uc.ReadNotification).Methods("GET")
	router.HandleFunc("/notification", uc.ReadAllNotifications).Methods("GET")
	//Home
	router.PathPrefix("/").Handler( http.FileServer(http.FS(website)) ).Methods("GET")
	router.PathPrefix("/").Handler( index ).Methods("POST")
	//Not found
	router.NotFoundHandler = http.HandlerFunc(resourceNotFound)
	
	return router
}

func main() {
    //++++| os.Args |+++++
    wsEndPoint := ":5500" 
    addr := flag.String("addr", wsEndPoint, "AFENET API service address") 
    flag.Parse()
    //++++++++++++++++++++
    db.Init()
    
    fmt.Println("Server listening on port: "+(strings.Split(wsEndPoint,":")[1])) 
    log.Fatal(http.ListenAndServe(*addr, getRouter()))
}








