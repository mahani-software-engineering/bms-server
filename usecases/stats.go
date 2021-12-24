package usecases


import (
    "fmt"
    "net/http"
    //"encoding/json"
    "github.com/mahani-software-engineering/bms-server/db"
)



func StatsCustomersThisWeek(w http.ResponseWriter, r *http.Request) {
    fmt.Println("Stats customers this week ...")
    var payments []db.Payment
    response := database.Find(&payments)
    numberOfRowsFound := response.RowsAffected
    msg := fmt.Sprintf("Found %d records", numberOfRowsFound)
    respondToClient(w, 200, numberOfRowsFound, msg)
}

func StatsRevenueThisWeek(w http.ResponseWriter, r *http.Request) {
    fmt.Println("Stats revenue this week ...")
    var payments []db.Payment
    response := database.Find(&payments)
    numberOfRowsFound := response.RowsAffected
    msg := fmt.Sprintf("Found %d records", numberOfRowsFound)
    respondToClient(w, 200, numberOfRowsFound, msg)
}

func StatsRevenueSrcThisWeek(w http.ResponseWriter, r *http.Request) {
    respondToClient(w, 200, 45, "sample")
}

func StatsRevenueSrcAnnual(w http.ResponseWriter, r *http.Request) {
    respondToClient(w, 200, 45, "sample")
}

func StatsAnnualRevenue(w http.ResponseWriter, r *http.Request) {
    respondToClient(w, 200, 45, "sample")
}










