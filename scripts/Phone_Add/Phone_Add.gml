///@arg phone
function Phone_Add() {
	live;
	var PHONE=argument[0];
	return Flag_GetStorage(FLAG_STATIC).Get("phone").Add(PHONE);
}
