///@arg box_slot
///@arg item_slot
function Box_Remove() {
	var SLOT_BOX=argument[0];
	var SLOT=argument[1];

	if(Box_IsBoxSlotValid(SLOT_BOX)&&Box_IsSlotValid(SLOT)){
		if(Item_IsValid(Box_Get(SLOT_BOX,SLOT))){
			Flag_GetStorage(FLAG_STATIC).Get("box"+string(SLOT_BOX)).Del(SLOT);
			return true;
		}else{
			return false;
		}
	}else{
		return false;
	}
}