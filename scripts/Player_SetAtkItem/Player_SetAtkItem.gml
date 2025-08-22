///@arg atk_item
function Player_SetAtkItem() {
	var ATK=argument[0];

	var result=Flag_Set(FLAG_STATIC,"atk_item",ATK);

	return result;


}
