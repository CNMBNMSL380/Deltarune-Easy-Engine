// Script assets have changed for v2.3.0 see
function Dr_Battle_SpareEnemy(ENEMY){
	if(is_real(ENEMY)){
		var emy = Dr_Battle_GetEnemyInstance(ENEMY)
		if(instance_exists(emy)){
			var spare_vla = emy.spare;
			var is_spare = emy.is_spare;
		
			if(spare_vla == 100 or is_spare){
				//启动饶恕事件
				return true
			}
		}
	}
	else if(instance_exists(ENEMY)){
		var spare_vla = ENEMY.spare;
		var is_spare = ENEMY.is_spare;
		
		if(spare_vla == 100 or is_spare){
			//启动饶恕事件
			return true
		}
		
	}
	else{
		show_debug_message("Dr_Battle_SpareEnemy: 未找到敌人")
	}
	return false	
}