/// @description 事件
live;
/*
	获取队友与敌人的信息
	
*/

inst_mian = noone;

create_team = [dr_battle_char_player];	//由于UTE与DRE的关系组合，此数组必须留下dr_battle_char_player
team_x = [120,120,120];
team_y = [120,220,300];

targin_enemy = noone;
create_enemy = [];		/* 注意！如果对方的battle_mod不是3，这个变量必须空的，
	否则，你需要往里面塞敌人对象，后面会自行处理为可以生成对象的数据
*/
enemy_x = [560,500,560];
enemy_y = [120,220,320];

event_user(0)

alarm[0]=1;

function Create_Friend(add_frend = []){
	var instances = [];
	var btlInstances = [];
	var friendTeam = [];
	if(array_length(add_frend) <= 0){
		for(var i = 0 ; i < Char_GetTeamLenght(); i++){		
			////instances[i] = Char_GetTeamByID(i -1).Get("obj");
			instances[i] = (i == 0 ? char_player : Char_GetTeamObj(i))
			//show_message(string(i)+ " : "+ string (instances[i]))
			//btlInstances[i] = Char_GetTeamByID(i -1).Get("btlObj");
			btlInstances[i] = Char_GetTeamBattleObj(i)
			//show_message(string(i)+ " : "+ string (btlInstances[i]))
		}	
		//show_message(btlInstances)
		//show_message(instances)
		for(var i = 0; i < array_length(instances) ; i++){
			//获取坐标，并设置好准备生成对象的数值
			var insX = ((instances[i].x) *camera.scale_x) - ((camera.x) * camera.scale_x );
			var insY = ((instances[i].y) *camera.scale_y) - ((camera.y) * camera.scale_y );
			var arr = [insX,insY]
			//准备打包数据，并传给_player_friend_ow_obj
			friendTeam[i] = [insX,insY,DEPTH_DR_BTL.CHAR - (2*i) , btlInstances[i] , team_x[i] , team_y[i]]; 
			
		}
	}
	else{
		for(var i = 0; i < array_length(btlInstances) ; i++){
			//获取坐标，并设置好准备生成对象的数值
			var insX = ((instances[i].x) *camera.scale_x) - ((camera.x) * camera.scale_x );
			var insY = ((instances[i].y) *camera.scale_y) - ((camera.y) * camera.scale_y );
			var arr = [insX,insY]
			//show_message(arr)
			
			/// ----------- 上传数据
			friendTeam[i] = [
				insX,								// --------- 实列X
				insY,								// --------- 实列Y
				DEPTH_DR_BTL.CHAR - (2*i),			// --------- 深度
				btlInstances[i],					// --------- 战斗实例
				team_x[i],							// --------- 记录位置X
				team_y[i]							// --------- 记录位置Y
			]; 
			
		}
	}
	return friendTeam 
}



