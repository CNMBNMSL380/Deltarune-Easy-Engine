///@arg slot
function Item_IsUseToEnemy(ITEM) {
	
	if(Item_IsValid(ITEM)){
		var INST=instance_create_depth(0,0,0,ITEM);
		var IS_USE_TO_ENEMY=INST._use_to_enemy;
		instance_destroy(INST);
		return IS_USE_TO_ENEMY;
	}else{
		return false;
	}

	return noone;
}