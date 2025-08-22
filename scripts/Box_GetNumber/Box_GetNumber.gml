///@arg box_slot
function Box_GetNumber() {
	var SLOT=argument[0];

	return Flag_GetStorage(FLAG_STATIC).Get("box"+string(SLOT)).GetNumber();
}