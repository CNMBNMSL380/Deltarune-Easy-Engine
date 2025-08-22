///@arg damage
function Player_Hurt() {
	var DAMAGE=argument[0];

	if(DAMAGE>=0){
		var HP=Flag_Get(FLAG_STATIC,"hp");
		Player_SetHp(HP-DAMAGE>=0 ? HP-DAMAGE : 0);
		return true;
	}else{
		return Player_Heal(-DAMAGE);
	}
}
