///@arg item_id
function Item_SetWeapon() {
	var ITEM=argument[0];

	if(Item_IsValid(ITEM)){
		Flag_Set(FLAG_STATIC,"item_weapon",ITEM);
		return true;
	}else{
		return false;
	}
}