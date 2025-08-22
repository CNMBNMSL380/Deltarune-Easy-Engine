///@arg slot
function Item_Get() {
	var SLOT=argument[0];
	
	if(Item_IsSlotValid(SLOT)){
		return Flag_GetStorage(FLAG_STATIC).Get("item").Get(SLOT);
	}
	return noone;
}