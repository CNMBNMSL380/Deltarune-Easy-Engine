// Script assets have changed for v2.3.0 see
function Dr_Battle_SetTurnBoardSize(UP,DOWN,LEFT,RIGHT){
	//这个脚本必须在战斗框启动前使用才能生效
	var Main = dr_battle_main;
	Main._battle_board_up_max = UP;
	Main._battle_board_down_max = DOWN;
	Main._battle_board_left_max = LEFT;
	Main._battle_board_right_max = RIGHT;
	
	return true;
	
}