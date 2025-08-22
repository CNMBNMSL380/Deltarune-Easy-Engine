///@arg menu_CHOICE_CHAR
function Battle_ConvertMenuChoiceEnemyToEnemySlot(CHOICE_CHAR) {
	if(CHOICE_CHAR<Battle_GetEnemyNumber()){
		var proc=0;
		var proc2=0;
		var result=-1;
		repeat(3){
			if(instance_exists(Battle_GetEnemy(proc))){
				if(proc2==CHOICE_CHAR){
					result=proc;
					break;
				}
				proc2+=1;
			}
			proc+=1;
		}
		return result;
	}else{
		return -1;
	}


}
