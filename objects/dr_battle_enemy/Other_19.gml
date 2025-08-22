/// @description 回合生成 / Create Turn
live;

if(dr_battle_main._enemy[0].getIns() == id){
	instance_create_depth(0,0,0,dr_battle_turn)
}