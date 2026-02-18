function Encounter_Start(ID,TARGIN,ANIM=false,EXCLAM=true){
	if(Encounter_IsExists(ID)){
		if(!instance_exists(char_player)){
			ANIM=false;
		}
		else{
			char_player.moveable = false	
		}
		var base = Encounter_GetBase(ID)
		switch(base.e_battle_mod){
			case "DR":
				var friendPos = base.e_friend_position;
				var enemyPos = base.e_enemy_position;
				var enemySeek = base.e_enemy_seek;
				
				
				
				//-------------准备处理队友信息
					//---准备好初始变量					
					var friendTeam = [];
					//---开始判定
					//如果是默认设置
					if(array_length(base.e_friend) == 0){
						var instances = [];
						var btlInstances = [];
						//
						for(var i = 0 ; i < Char_GetTeamLenght(); i++){		
							instances[i] = (i == 0 ? char_player : Char_GetTeamObj(i))
							btlInstances[i] = Char_GetTeamBattleObj(i)
						}	
						//show_message(btlInstances)
						//show_message(instances)
						for(var i = 0; i < array_length(instances) ; i++){
							//获取坐标，并设置好准备生成对象的数值
							var insX = ((instances[i].x) *camera.scale_x) - ((camera.x) * camera.scale_x );
							var insY = ((instances[i].y) *camera.scale_y) - ((camera.y) * camera.scale_y );
							var arr = [insX,insY]	
							friendTeam[i]= {
								//最初的x坐标和y坐标
								cX: insX,
								cY: insY,
								//位移坐标
								posX: friendPos[i][0],
								posY: friendPos[i][1],
								//深度
								depth: DEPTH_DR_BTL.CHAR - (2*i),
								//战斗实例
								btlInst: btlInstances[i]							
							}
			
						}
					}
					else {
						for(var i = 0; i < array_length(base.e_friend) ; i++){
							//获取坐标，并设置好准备生成对象的数值
							var insX = ((instances[i].x) *camera.scale_x) - ((camera.x) * camera.scale_x );
							var insY = ((instances[i].y) *camera.scale_y) - ((camera.y) * camera.scale_y );
							var arr = [insX,insY]
							//准备打包数据，并传给_player_friend_ow_obj
							friendTeam[i]= {	
								//最初的x坐标和y坐标
								cX: insX,
								cY: insY,
								//位移坐标
								posX: friendPos[i][0],
								posY: friendPos[i][1],
								//深度
								depth: DEPTH_DR_BTL.CHAR - (2*i),
								//战斗实例
								btlInst: btlInstances[i]							
							}				
						}
					}
				// 创建战斗系统	
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
							battleEnemy[i]={	
								//最初的x坐标和y坐标
								cX: insX,
								cY: insY,
								//位移坐标
								posX: enemyPos[i][0],
								posY: enemyPos[i][1],
								//深度
								depth: DEPTH_DR_BTL.CHAR - (2*i),
								//战斗实例
								btlInst: instances[i].battle_charObj				
							}					 
						}
					}
				}
				// 准备创建战斗系统
				var inst = instance_create_depth(0,0,0,dr_battle_main);
				inst._player_friend_ow_obj = friendTeam;
				inst._enemy_ow_obj = battleEnemy;
				inst.alarm[0] = 50; //开始战斗
				
			break;
			case "UT":
			
			break;
			default:
			
			return false;
		}
	}
}
function Encounter_Old_Start(ENCOUNTER,ANIM=true,EXCLAM=true) {
	///@arg encounter_id
	///@arg anim*
	///@arg exclamation*
	if(Encounter_IsExists(ENCOUNTER)){
		if(!instance_exists(char_player)){
			ANIM=false;
		}
		if(!ANIM){
			if(Encounter_IsPauseBGM(ENCOUNTER)){
				BGM_Pause(0);
			}
			Flag_Set(FLAG_TEMP,"encounter",ENCOUNTER);
			if(!Player_IsInBattle()){
				Flag_Set(FLAG_TEMP,"battle_room_return",room);
				room_persistent=true;
			}
			room_goto(room_battle);
		}else{
			var inst=instance_create_depth(0,0,0,encounter_anim);
			inst._encounter=ENCOUNTER;
			inst._exclam=EXCLAM;
			inst._quick=Encounter_IsQuick(ENCOUNTER);
			inst._soul_x=Encounter_GetSoulX(ENCOUNTER);
			inst._soul_y=Encounter_GetSoulY(ENCOUNTER);
		}
		return true;
	}else{
		show_debug_message("Encounter ID "+string(ENCOUNTER)+" doesn't exists!");
		return false;
	}


}
