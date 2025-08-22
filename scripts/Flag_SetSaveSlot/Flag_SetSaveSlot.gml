///@arg slot
function Flag_SetSaveSlot() {
	var SLOT=argument[0];

	Flag_Set(FLAG_TEMP,"saveSlot",SLOT);
	return true;


}
