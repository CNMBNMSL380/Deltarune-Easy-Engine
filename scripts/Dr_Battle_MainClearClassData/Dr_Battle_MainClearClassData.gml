// Script assets have changed for v2.3.0 see
function Dr_Battle_MainClearClassData(){
	with(dr_battle_main){
		_player_choice_friend = 0;								//选中队友
		_player_choice_enemy = 0;								//选择敌人					
		_player_choice_act = 0;								//ACT类，选择要执行的类
		_player_choice_magic = 0;								//魔法类，选择要执行的魔法
		_player_choice_item = 0;								//物品类，选择要使用的物品
	}
	return true;
}