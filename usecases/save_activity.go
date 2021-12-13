package usecases


import (
	"strconv"
	"net/http"
	"encoding/json"
	"github.com/bms/bms-server/db"
  )
	
func newActionRecord(uid uint, an, descr, entity, option string) {
    var action db.UserAction
    action.ActionNumber = an
    action.OnEntity = entity
    action.EntityOption = option
    action.Description = descr
    action.UserID = uid
    database.Create(&action)
}



