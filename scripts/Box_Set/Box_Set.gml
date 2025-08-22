///@arg box_slot
///@arg item_slot
///@arg item_id
function Box_Set() {
	var SLOT_BOX=argument[0];
	var SLOT=argument[1];
	var ITEM=argument[2];

	if(Box_IsBoxSlotValid(SLOT_BOX) && Box_IsSlotValid(SLOT) && (Item_IsValid(ITEM) || ITEM==-1)){
		Flag_GetStorage(FLAG_STATIC).Get("box"+string(SLOT_BOX)).Set(SLOT,ITEM)
		Box_Update();
		return true;
	}else{
		return false;
	}
}