///@arg item_slot
///@arg item_id
function Item_Set(){
	var SLOT = argument[0];
	var ITEM = argument[1];
	if(Item_IsSlotValid(SLOT)&&Item_IsValid(ITEM)){
		if(ITEM!=item_empty){
			Flag_GetStorage(FLAG_STATIC).Get("item").Set(SLOT,ITEM);
		}
		else{
			Flag_GetStorage(FLAG_STATIC).Get("item").Set(SLOT,0);
		}
	}
}