// Script assets have changed for v2.3.0 see
function Dr_Battle_NextEnemyAct(){
	var Main = dr_battle_main;
	var actEvent = Main._player_act_event;
	var actNum = Main._player_act_num;
	var instEvent = actEvent[actNum][0];
	Main._player_choice_enemy = actEvent[actNum][1];
	Main._player_choice_class = actEvent[actNum][2];
	
	instEvent();
	
}