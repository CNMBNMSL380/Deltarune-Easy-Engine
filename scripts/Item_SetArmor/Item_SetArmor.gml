///@arg item_id
function Item_SetArmor() {
	var ITEM=argument[0];

	if(Item_IsValid(ITEM)){
		Flag_Set(FLAG_STATIC,"item_armor",ITEM);
		return true;
	}else{
		return false;
	}
}
