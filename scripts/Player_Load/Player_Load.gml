///@arg slot
function Player_Load() {
	var SLOT=argument[0];

	Flag_SetSlot(SLOT);

	Flag_Load(FLAG_STATIC);
	Flag_Load(FLAG_DYNAMIC);
	Flag_Load(FLAG_INFO);
	Flag_Load(FLAG_PLOT);

	return true;
}