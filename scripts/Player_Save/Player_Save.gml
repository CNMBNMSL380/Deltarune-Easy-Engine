///@arg slot
function Player_Save() {
	var SLOT=argument[0];

	Flag_SetSlot(SLOT);

	Flag_Save(FLAG_STATIC);
	Flag_Set(FLAG_INFO,"lv",Player_GetLv());
	Flag_Set(FLAG_INFO,"time",Flag_Get(FLAG_STATIC,"time"));
	Flag_Set(FLAG_INFO,"room",Flag_Get(FLAG_STATIC,"room"));
	Flag_Set(FLAG_INFO,"name",Player_GetName());
	Flag_Save(FLAG_INFO);
	Flag_Save(FLAG_PLOT);

	return true;
}