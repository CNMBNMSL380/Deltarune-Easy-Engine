///@arg slot
function Flag_SetSlot(){
	var SLOT = argument[0];
	
	Flag_GetStorage(FLAG_TEMP).Set("save_slot",SLOT);
}