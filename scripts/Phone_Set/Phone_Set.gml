///@arg phone_slot
///@arg phone_id
function Phone_Set() {
	var SLOT = argument[0];
	var PHONE = argument[1];
	
	if(Phone_IsSlotValid(SLOT)&&Phone_IsValid(PHONE )){
		Flag_GetStorage(FLAG_STATIC).Get("phone").Set(SLOT,PHONE );
	}

}
