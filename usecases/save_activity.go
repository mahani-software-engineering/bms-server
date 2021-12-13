package usecases


import (
	"github.com/mahani-software-engineering/bms-server/db"
  )
	
func newActionRecord(uid uint, an, descr, entity, option string) {
    var action db.UserAction
    action.ActionNumber = an
    action.OnEntity = entity
    action.SpecificEntity = option
    action.Description = descr
    action.UserID = uid
    database.Create(&action)
}



