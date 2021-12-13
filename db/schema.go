package db

import (
  "gorm.io/gorm"
)

type Service struct {
  gorm.Model
  Name             string  `json:"name" gorm:"size:200"`
  Category         string  `json:"category" gorm:"size:40"`
  Availability     bool    `json:"availability" gorm:"default:true"`
  Price            uint    `json:"price"`
}

type Product struct {
  gorm.Model
  Name             string  `json:"name" gorm:"size:150"`
  Category         string  `json:"category" gorm:"size:40"`      //cocacola
  Brand            string  `json:"brand" gorm:"size:20"`         //fanta, crest, etc
  Type             string  `json:"type" gorm:"size:20"`          //plastic, bittled, etc
  Price            uint    `json:"price"`                        //4000
  QuantityInStock  uint    `json:"quantityInStock"`              //450
  QuantityUnits    string  `json:"quantityUnits" gorm:"size:20"` //crates
}  

type PackageProduct struct {
  gorm.Model
  ProductID   uint  `json:"productid"`
  PackageID   uint  `json:"packageid"`
  Quantity    uint  `json:"quantity"`
}

type PackageService struct {
  gorm.Model
  ServiceID   uint  `json:"serviceid"`
  PackageID   uint  `json:"packageid"`
  Quantity    uint  `json:"quantity"`
}

type Package struct {
  gorm.Model
  Name          string            `json:"name" gorm:"size:100"`
  Category      string            `json:"category" gorm:"size:20"`
  Availability  bool              `json:"availability" gorm:"default:true"`
  Price         uint              `json:"price"`
  Products      []PackageProduct  `json:"products"`
  Services      []PackageService  `json:"services"`
}

type Visit struct {
  gorm.Model
  Customer    User     `json:"customer" gorm:"foreignKey:CustomerID;references:id"`
  CustomerID  uint     `json:"customerid"`
}

type OrderOrBooking struct {
  gorm.Model
  Item       string   `json:"item" gorm:"size:8"`           //product, service, package
  ItemID     uint     `json:"itemid"`
  Qauntity   uint     `json:"qauntity"`
  Status     string   `json:"status" gorm:"size:20"`        //pending, invoiced, served, billed, cancelled
  Paid       bool     `json:"paid" gorm:"default:false"`    //true/false
  Customer   User     `json:"customer" gorm:"foreignKey:CustomerID;references:id"`
  Visit      Visit    `json:"visit"`
  CustomerID uint     `json:"customerid"`
  VisitID    uint     `json:"visitid"`
  InvoiceID  uint     `json:"invoiceid"`
  BillID     uint     `json:"billid"`
}

type Payment struct {
  gorm.Model
  Amount     uint     `json:"amount"`
  Item       string   `json:"item" gorm:"size:8"`              //product, service, package, invoice, bill
  ItemID     uint     `json:"itemid"`
  Instalment bool     `json:"instalment" gorm:"default:false"` //true/false
  Customer   User     `json:"customer" gorm:"foreignKey:CustomerID;references:id"`
  CustomerID uint     `json:"customerid"`
}

type Invoice struct {
  gorm.Model
  Amount     uint             `json:"amount"`
  Status     string           `json:"status" gorm:"size:20"` //pending, billed, paid, cancelled
  Customer   User             `json:"customer" gorm:"foreignKey:CustomerID;references:id"`
  CustomerID uint             `json:"customerid"`
  BillID     uint     `json:"billid"`
  Orders     []OrderOrBooking `json:"orders"`
}

type Bill struct {
  gorm.Model
  Amount     uint             `json:"amount"`
  Status     string           `json:"status" gorm:"size:20"` //pending, paid, cancelled
  Customer   User             `json:"customer" gorm:"foreignKey:CustomerID;references:id"`
  CustomerID uint             `json:"customerid"`
  Orders     []OrderOrBooking `json:"orders"`
  Invoices   []Invoice        `json:"invoices"`
}

type StockTransaction struct {
  gorm.Model
  Transasction  string  `json:"transasction" gorm:"size:8"` //add, remove,
  Product       Product `json:"product"`
  OldQuantity   uint    `json:"oldQuantity"`
  Quantity      uint     `json:"quantity"`
  NewQuantity   uint    `json:"newQuantity"`
  Returned      bool    `json:"returned" gorm:"default:false"` //true/false
  Staff         User    `json:"staff"`
  UserID        uint    `json:"userid"`
}

type Expense struct {
  gorm.Model
  Amount        uint    `json:"amount"`
  SpentOn       string  `json:"spenton"`
  Description   string  `json:"description"`
  Staff         User    `json:"staff" gorm:"foreignKey:StaffID;references:id"`
  StaffID       uint    `json:"staffid"`
}

type User struct {
  gorm.Model
  Username string `json:"username" gorm:"size:20"`
  Password string `json:"pxwd" gorm:"size:150"`
  Firstname  string  `json:"firstname" gorm:"size:20"`
  Lastname string  `json:"lastname" gorm:"size:20"`
  Phone string `json:"phone" gorm:"size:20"`
  Email string `json:"email" gorm:"size:100"`
  Address string `json:"address" gorm:"size:60"`
  UserType string `json:"userType" gorm:"default:customer;size:20"` //staff, customer, guest, partner, service_provider, supplier...
  StaffTitle string `json:"stafftitle"`
  IdentityCardNumber string `json:"idcardnumber"`
  IdentityCardType string `json:"idtype" gorm:"default:EMPLOYEE_ID"`
  Nationality string `json:"nationality"`
  AccessRights uint  `json:"accessRights"`
  Messages []Message `json:"messages" gorm:"foreignKey:UserID;references:id"`
  Notifications []Notification `json:"notifications" gorm:"foreignKey:UserID;references:id"`
  UserActions []UserAction `json:"userActions" gorm:"foreignKey:UserID;references:id"`
}

type UserAction struct {
  gorm.Model
  ActionNumber string `json:"actionNumber"`
  UserID uint `json:"userid"`
  Description string `json:"description"`
  OnEntity string `json:"onEntity"`
  SpecificEntity string `json:"specificEntity"`
}

type Message struct {
  gorm.Model
  Text string
  Read bool
  UserID uint
}

type Notification struct {
  gorm.Model
  Message string
  Read bool
  UserID uint
}


/*
NOTE: 1. an invoice added to the "invoices []" list in the bill must 
         be one whose "orders []" ALL have status "served" and paid=true
      2. Auto create (on request) an invoice with all orders made by the 
         specified customer, have status="pending" and paid=false.
         Consider any instalment payments
      3. Auto create (on request) a Bill with all orders made by the 
         specified customer, have status="served" and paid=false.
         Consider any instalment payments
*/ 
  
  
  





