/*	
	如果battle_mod = 0,则会召唤这个房间里对多3个敌人
	如果敌人的battle_mod不等于3，意味着他会需要队友支援，
	否则他只会一个人战斗，不过你可以在目标敌人那手动添加敌人
	适合boss战
*/
function Dr_Battle_CreateEnemyData(TARGIN,ENEMY = [],ANIM_X = [],ANIM_Y = []){
	live;
		//---------添加BTL敌人，同时隐藏ow敌人，玩家和被确定隐藏的NPC
	///@arg 目标敌人
	///@arg 多个敌人
	///@arg 动画X
	///@arg 动画Y
	var instances = [];
	var battleEnemy = [];
	if(TARGIN.battle_mod != 3 ){
		//检测所在房间的敌人并添加敌人
		array_push(instances,TARGIN);
		TAR = TARGIN
		with (all) {
			var battleMode = variable_instance_get(id,"battle_mod");
			if(battleMode != undefined){
				if(id != other.TAR){
					if(battleMode = 0){						
						array_push(instances,id);
					}
				}
			}  
		}
		//准备添加敌人生成数据 
		for(var i = 0; i<array_length(instances) ; i++){
			//获取是否带有battle_charObj变量，以防止找不到对象
			var battleObje = variable_instance_get(id,"battle_charObj");
			if(battleObje !=undefined or battleObje != noone){
				//获取坐标，并设置好准备生成对象的数值
				var insX = ((instances[i].x) *camera.scale_x) - ((camera.x) * camera.scale_x )
				var insY = ((instances[i].y) *camera.scale_y) - ((camera.y) * camera.scale_y )
				battleEnemy[i]=[insX , insY , DEPTH_DR_BTL.CHAR - (10 * i) , instances[i].battle_charObj,ANIM_X[i] , ANIM_Y[i]];
			}
		}
	}
	
	return battleEnemy;
}