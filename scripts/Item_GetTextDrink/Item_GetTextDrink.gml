///@arg item_name
function Item_GetTextDrink() {
	var NAME=argument[0];

	var result="";
	result+="{define `ITEM` `"+NAME+"`}";
	result+=Lang_GetString("item.drink");

	return result;


}
