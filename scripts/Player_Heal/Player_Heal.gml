///@arg heal
function Player_Heal(FRIEND = 0) {
	var HEAL=argument[0];
	if(FRIEND == 0){
		if(HEAL>=0){
			var HP=Flag_Get(FLAG_STATIC,"hp");
			var HP_MAX=Flag_Get(FLAG_STATIC,"hp_max");
			Player_SetHp(HP+HEAL<=HP_MAX ? HP+HEAL : HP_MAX);
			return true;
		}else{
			return Player_Hurt(-HEAL);
		}
	}
	else{
		
	}
}
