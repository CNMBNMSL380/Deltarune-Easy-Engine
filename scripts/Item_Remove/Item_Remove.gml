///@arg slot
function Item_Remove(){
	var SLOT = argument[0];
	if(Item_IsSlotValid(SLOT)&&Item_IsValid(Item_Get(SLOT))){
		Flag_GetStorage(FLAG_STATIC).Get("item").Del(SLOT);
	}
}