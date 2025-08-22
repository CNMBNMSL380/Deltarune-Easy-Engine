///@arg gold
function Player_SetGold() {
	var GOLD=argument[0];

	var result=Flag_Set(FLAG_STATIC,"gold",GOLD);

	return result;


}
