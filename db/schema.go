package db

import (
  "gorm.io/gorm"
)

type Department struct {
    gorm.Model
    Name               string  `json:"name" gorm:"size:200"`
}

type Service struct {
  gorm.Model
  Name               string  `json:"name" gorm:"size:200"`
  Category           string  `json:"category" gorm:"size:40"`
  Availability       bool    `json:"availability" gorm:"default:true"`
  Price              uint    `json:"price"`
  Department         uint    `json:"department" gorm:"size:20"`
  ServiceProviderID  uint    `json:"provider"`
  CreatedBy          uint    `json:"createdby"`
}

type Product struct {
  gorm.Model
  Name             string  `json:"name" gorm:"size:150"`
  Category         string  `json:"category" gorm:"size:40"`      //soda
  Brand            string  `json:"brand" gorm:"size:20"`         //fanta, crest, etc
  Type             string  `json:"type" gorm:"size:20"`          //plastic, bottled, etc
  Price            uint    `json:"price"`                        //4000
  Department       uint    `json:"department" gorm:"size:20"`
  Quantity         uint    `json:"quantity"`                     //450
  QuantityUnits    string  `json:"quantityUnits" gorm:"size:20"` //crates
  SupplierID       uint    `json:"supplierid"`
  CreatedBy        uint    `json:"createdby"`
}

type Package struct {
  gorm.Model
  Name          string            `json:"name" gorm:"size:100"`
  Category      string            `json:"category" gorm:"size:20;default:guests"`
  Availability  bool              `json:"availability" gorm:"default:true"`
  Price         uint              `json:"price"`
  Department    uint              `json:"department" gorm:"size:20"`
  Products      []PackageProduct  `json:"products"`
  Services      []PackageService  `json:"services"`
  CreatedBy     uint              `json:"createdby"`
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

type Visit struct {
  gorm.Model
  Customer    User     `json:"customer" gorm:"foreignKey:CustomerID;references:id"`
  CustomerID  uint     `json:"customerid"`
  CreatedBy   uint     `json:"createdby"`
}

type OrderOrBooking struct {
  gorm.Model
  Item       string   `json:"item" gorm:"size:8"`           //product, service, package
  ItemID     uint     `json:"itemid"`
  Quantity   uint     `json:"quantity"`
  Status     string   `json:"status" gorm:"size:20"`        //pending, invoiced, served, billed, cancelled
  Paid       bool     `json:"paid" gorm:"default:false"`    //true/false
  Customer   User     `json:"customer" gorm:"foreignKey:CustomerID;references:id"`
  Visit      Visit    `json:"visit"`
  CustomerID uint     `json:"customerid"`
  VisitID    uint     `json:"visitid"`
  InvoiceID  uint     `json:"invoiceid"`
  BillID     uint     `json:"billid"`
  CreatedBy  uint     `json:"createdby"`                    //id of the user who created a record
}

type Invoice struct {
  gorm.Model
  Amount     uint             `json:"amount"`
  Status     string           `json:"status" gorm:"size:20;default:pending"` //pending, billed, paid, cancelled
  Customer   User             `json:"customer" gorm:"foreignKey:CustomerID;references:id"`
  CustomerID uint             `json:"customerid"`
  BillID     uint             `json:"billid"`
  CreatedBy  uint     `json:"createdby"`                                     //id of the user who created a record
  Orders     []OrderOrBooking `json:"orders"`
}

type Bill struct {
  gorm.Model
  Amount     uint             `json:"amount"`
  Status     string           `json:"status" gorm:"size:20;default:pending"` //pending, paid, cancelled
  Customer   User             `json:"customer" gorm:"foreignKey:CustomerID;references:id"`
  CustomerID uint             `json:"customerid"`
  Invoices   string           `json:"invoices" gorm:"size:200;default:none"` //list of comma-separated, stringified invoice IDs 
  CreatedBy  uint             `json:"createdby"`                             //id of the user who created a record
  Orders     []OrderOrBooking `json:"orders"`   
}

type Payment struct {
  gorm.Model
  Amount     uint     `json:"amount"`
  Item       string   `json:"item" gorm:"size:8"`              //order, booking, invoice, bill
  ItemID     uint     `json:"itemid"`
  Instalment bool     `json:"instalment" gorm:"default:false"` //true/false
  Customer   User     `json:"customer" gorm:"foreignKey:CustomerID;references:id"`
  CustomerID uint     `json:"customerid"`
  CreatedBy  uint     `json:"createdby"`                       //id of the user who created a record
}

type StockTransaction struct {
  gorm.Model
  Transaction      string   `json:"transaction" gorm:"size:8;default:add"`  //add, remove,
  ProductCategory   string  `json:"productCategory" gorm:"size:150"`        //
  ProductID         uint    `json:"productid"`
  OldQuantity       uint    `json:"oldQuantity"`
  Quantity          uint    `json:"quantity"`
  NewQuantity       uint    `json:"newQuantity"`
  Returned          bool    `json:"returned" gorm:"default:false"`     //true/false
  Amount            uint    `json:"amount"`
  CreatedBy         uint    `json:"createdby"`
}

type Expense struct {
  gorm.Model
  Amount        uint    `json:"amount"`
  SpentOn       string  `json:"spenton"`     //stock, petty-cash, regular, ...
  Description   string  `json:"description"`
  CreatedBy     uint    `json:"createdby"`
}

type User struct {
  gorm.Model
  Username           string         `json:"username" gorm:"size:20"`
  Password           string         `json:"pxwd" gorm:"size:150"`
  Firstname          string         `json:"firstname" gorm:"size:20"`
  Lastname           string         `json:"lastname" gorm:"size:20"`
  Phone              string         `json:"phone" gorm:"size:20"`
  Email              string         `json:"email" gorm:"size:100"`
  Address            string         `json:"address" gorm:"size:60"`
  UserType           string         `json:"userType" gorm:"default:customer;size:20"` //staff, customer, guest, partner, service_provider, supplier...
  StaffTitle         string         `json:"stafftitle" gorm:"size:20"`
  IdentityCardNumber string         `json:"idcardnumber" gorm:"size:20"`
  IdentityCardType   string         `json:"idtype" gorm:"default:EMPLOYEE_ID" gorm:"size:20"`
  Nationality        string         `json:"nationality" gorm:"size:50"`
  AccessRights       uint           `json:"accessRights"`
  CreatedBy          uint     `json:"createdby"`
  Invoices           []Invoice      `json:"invoices" gorm:"foreignKey:CustomerID;references:id;->"`
  Bills              []Bill         `json:"bills" gorm:"foreignKey:CustomerID;references:id;->"`
  Messages           []Message      `json:"messages" gorm:"foreignKey:UserID;references:id;->"`
  Notifications      []Notification `json:"notifications" gorm:"foreignKey:UserID;references:id;->"`
  UserActions        []UserAction   `json:"userActions" gorm:"foreignKey:UserID;references:id;->"`
}

type UserAction struct {
  gorm.Model
  ActionNumber   string  `json:"actionNumber" gorm:"size:16"`
  UserID         uint    `json:"userid"`
  Description    string  `json:"description" gorm:"size:100"`
  OnEntity       string  `json:"onEntity" gorm:"size:20"`
  SpecificEntity string  `json:"specificEntity" gorm:"size:100"`
}

type Message struct {
  gorm.Model
  Text       string
  Read       bool
  UserID     uint
  CreatedBy   uint     `json:"createdby"`
}

type Notification struct {
  gorm.Model
  Message    string
  Read       bool
  UserID     uint
  CreatedBy  uint     `json:"createdby"`
}


/*
Ref: https://gorm.io/docs/models.html
NOTE ignored fields won’t be created when using GORM Migrator to create table

type User struct {
  Name string `gorm:"<-:create"` // allow read and create
  Name string `gorm:"<-:update"` // allow read and update
  Name string `gorm:"<-"`        // allow read and write (create and update)
  Name string `gorm:"<-:false"`  // allow read, disable write permission
  Name string `gorm:"->"`        // readonly (disable write permission unless it configured )
  Name string `gorm:"->;<-:create"` // allow read and create
  Name string `gorm:"->:false;<-:create"` // createonly (disabled read from db)
  Name string `gorm:"-"`  // ignore this field when write and read with struct
}
*/ 
  
  
  





