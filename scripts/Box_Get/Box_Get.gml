///@arg box_slot
///@arg item_slot
function Box_Get() {
	var SLOT_BOX=argument[0];
	var SLOT=argument[1];

	return (Box_IsBoxSlotValid(SLOT_BOX) && Box_IsSlotValid(SLOT)) ? Flag_GetStorage(FLAG_STATIC).Get("box"+string(SLOT_BOX)).Get(SLOT) : -1;
}