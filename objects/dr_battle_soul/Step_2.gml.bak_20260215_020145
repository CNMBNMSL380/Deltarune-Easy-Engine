live;
/*
	----------！注意事项！--------------
	如果阶段已经进入回合中(IN_TRUN)之后如果框的所有大小仍为0，
	那就会导致游戏卡死
*/

global.borderCount = ds_list_size(global.borders_list)
var STATE=Dr_Battle_GetStage();
if(STATE == DR_BATTLE_STAGE.IN_TRUN){
	if(instance_exists(dr_battle_soul)){
		var isInside1 = false;
		var isInside2 = false;
		var isInside3 = false;
		var isInside4 = false;
		for(var i = 0; i < global.borderCount; i++) {	//遍历所有框，判断是否出框
			bb = ds_list_find_value(global.borders_list,i);
			if(bb.contains(dr_battle_soul.x - sprite_width/2, dr_battle_soul.y)) {
				isInside1 = true;
				break;
			}
		}
		for(var i = 0; i < global.borderCount; i++) {	//遍历所有框，判断是否出框
			bb = ds_list_find_value(global.borders_list,i);
			if(bb.contains(dr_battle_soul.x + sprite_width/2, dr_battle_soul.y)) {
				isInside2 = true;
				break;
			}
		}
		for(var i = 0; i < global.borderCount; i++) {	//遍历所有框，判断是否出框
			bb = ds_list_find_value(global.borders_list,i);
			if(bb.contains(dr_battle_soul.x, dr_battle_soul.y - sprite_height/2)) {
				isInside3 = true;
				break;
			}
		}
		for(var i = 0; i < global.borderCount; i++) {	//遍历所有框，判断是否出框
			bb = ds_list_find_value(global.borders_list,i);
			if(bb.contains(dr_battle_soul.x, dr_battle_soul.y + sprite_height/2)) {
				isInside4 = true;
				break;
			}
		}
		if!(dr_battle_board.up <= 1 and dr_battle_board.down <= 1 and dr_battle_board.right <= 1 and dr_battle_board.left <= 1){
			if(!isInside1) {	//如果出框
				var nearestPos, nearestDis = -1;	//最近位置和最近距离
				for(var i = 0; i < global.borderCount; i++) {	//遍历所有框
					//得到限制位置和距离
					bb = ds_list_find_value(global.borders_list,i);
					var pos = bb.limit(dr_battle_soul.x - sprite_width/2, dr_battle_soul.y);
					var dis = point_distance(dr_battle_soul.x - sprite_width/2, dr_battle_soul.y, pos[0], pos[1]);
		
					if(dis < nearestDis || nearestDis == -1) {	//如果比其他更近
						nearestPos = pos;
						nearestDis = dis;
					}
				}
				dr_battle_soul.x = nearestPos[0] + sprite_width/2;
				dr_battle_soul.y = nearestPos[1];
			}
			if(!isInside2) {	//如果出框
				var nearestPos, nearestDis = -1;	//最近位置和最近距离
				for(var i = 0; i < global.borderCount; i++) {	//遍历所有框
					//得到限制位置和距离
					bb = ds_list_find_value(global.borders_list,i);
					var pos = bb.limit(dr_battle_soul.x + sprite_width/2, dr_battle_soul.y);
					var dis = point_distance(dr_battle_soul.x + sprite_width/2, dr_battle_soul.y, pos[0], pos[1]);
		
					if(dis < nearestDis || nearestDis == -1) {	//如果比其他更近
						nearestPos = pos;
						nearestDis = dis;
					}
				}
				dr_battle_soul.x = nearestPos[0] - sprite_width/2;
				dr_battle_soul.y = nearestPos[1];
			}
			if(!isInside3) {	//如果出框
				var nearestPos, nearestDis = -1;	//最近位置和最近距离
				for(var i = 0; i < global.borderCount; i++) {	//遍历所有框
					//得到限制位置和距离
					bb = ds_list_find_value(global.borders_list,i);
					var pos = bb.limit(dr_battle_soul.x, dr_battle_soul.y - sprite_height/2);
					var dis = point_distance(dr_battle_soul.x, dr_battle_soul.y - sprite_height/2, pos[0], pos[1]);
		
					if(dis < nearestDis || nearestDis == -1) {	//如果比其他更近
						nearestPos = pos;
						nearestDis = dis;
					}
				}
				dr_battle_soul.x = nearestPos[0];
				dr_battle_soul.y = nearestPos[1] + sprite_height/2;
			}
			if(!isInside4) {	//如果出框
				var nearestPos, nearestDis = -1;	//最近位置和最近距离
				for(var i = 0; i < global.borderCount; i++) {	//遍历所有框
					//得到限制位置和距离
					bb = ds_list_find_value(global.borders_list,i);
					var pos = bb.limit(dr_battle_soul.x,dr_battle_soul.y + sprite_height/2);
					var dis = point_distance(dr_battle_soul.x, dr_battle_soul.y + sprite_height/2, pos[0], pos[1]);
		
					if(dis < nearestDis || nearestDis == -1) {	//如果比其他更近
						nearestPos = pos;
						nearestDis = dis;
					}
				}
				dr_battle_soul.x = nearestPos[0];
				dr_battle_soul.y = nearestPos[1] - sprite_height/2;
			}
		}
	}
}