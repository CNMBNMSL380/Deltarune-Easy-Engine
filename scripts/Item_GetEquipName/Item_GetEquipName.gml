///@arg item_id
function Item_GetEquipName() {
	var ITEM=Item_GetArmor();

	if(Item_IsValid(ITEM)){
		var INST=instance_create_depth(0,0,0,ITEM);
		var NAME=INST._equip_name;
		instance_destroy(INST);
		return NAME;
	}else{
		return "";
	}


}
