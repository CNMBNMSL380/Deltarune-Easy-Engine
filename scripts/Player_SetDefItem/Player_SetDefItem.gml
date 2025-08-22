///@arg def_item
function Player_SetDefItem() {
	var DEF=argument[0];

	var result=Flag_Set(FLAG_STATIC,"def_item",DEF);

	return result;


}
