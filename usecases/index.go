package usecases

import (
   "gorm.io/gorm"
   "github.com/mahani-software-engineering/bms-server/db"
)

var database *gorm.DB
func Init() {
    database, _ = db.Connect()
}

