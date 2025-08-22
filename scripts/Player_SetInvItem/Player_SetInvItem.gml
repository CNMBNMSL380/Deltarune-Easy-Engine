///@arg inv_item
function Player_SetInvItem() {
	var INV=argument[0];

	var result=Flag_Set(FLAG_STATIC,"inv_item",INV);

	return result;


}
