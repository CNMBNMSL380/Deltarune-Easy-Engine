function Box_Update() {
	var box_slot=0;
	repeat(2){
		Flag_GetStorage(FLAG_STATIC).Get("box"+string(box_slot)).Sort();
		box_slot+=1;
	}
	return true;
}