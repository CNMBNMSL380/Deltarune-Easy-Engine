/// @description 使用攻击
live;
var Main_FightSlot = dr_battle_main._player_fight_slot;
show_debug_message(string( Main_FightSlot) + "  "+ string(fight_slot) + "  " + string(id))
if(Main_FightSlot == fight_slot){
	knife_is_done = true;
	Anim_Create(id,"knife_alp",0,0,1,-1,50);
	Anim_Create(id,"knife_sc",0,0,1,1,50);
	
	instance_create_depth(enemy_ins.x-70,enemy_ins.y-50,enemy_ins.depth-1,dr_battle_menu_damageNum)
	if(is_last_ins){
		Dr_Battle_SetStageTime(100)
	}
}
