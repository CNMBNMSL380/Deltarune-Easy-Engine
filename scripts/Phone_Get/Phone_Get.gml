///@arg phone_slot
function Phone_Get() {
	var SLOT=argument[0];

	return Flag_GetStorage(FLAG_STATIC).Get("phone").Get(SLOT);


}
