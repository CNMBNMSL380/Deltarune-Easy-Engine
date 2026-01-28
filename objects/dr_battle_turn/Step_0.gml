/// @description 事件
live;
if(start){
	time++
	if(time == 1){
		var bor = dr_battle_board;
		instance_create_depth(bor.x+20 ,bor.y,0,dr_battle_bullet);
	}
}