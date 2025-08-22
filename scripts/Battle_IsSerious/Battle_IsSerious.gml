function Battle_IsSerious(){
	if(instance_exists(battle)){
		if(Battle_IsEnemySerious(0)||Battle_IsEnemySerious(1)||Battle_IsEnemySerious(2)){
			return true;
		}
		else{
			return false;
		}
	}
}