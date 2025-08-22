///@arg item_id
function Item_Add(){
	var ITEM = argument[0];
	return Flag_GetStorage(FLAG_STATIC).Get("item").Add(ITEM);
}