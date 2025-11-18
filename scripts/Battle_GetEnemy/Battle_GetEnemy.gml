///@arg enemy_slot
function Battle_GetEnemy(ENEMY) {
	if(Battle_IsEnemySlotValid(ENEMY)){
		var INST=battle._enemy[ENEMY];
		return INST;
	}else{
		return noone;
	}


}
