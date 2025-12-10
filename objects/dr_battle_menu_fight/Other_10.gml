/// @description 使用攻击
live;
var Main = dr_battle_main
var Main_FightSlot = Main._player_fight_slot;
show_debug_message(string( Main_FightSlot) + "  "+ string(fight_slot) + "  " + string(id));
if(Main_FightSlot == fight_slot){
	Dr_Battle_PlaySpriteAnimOnce(friend_ins,DR_PLAYER_INDEX.FIGHT)
	knife_is_done = true;
	Anim_Create(id,"knife_alp",0,0,1,-1,50);
	Anim_Create(id,"knife_sc",0,0,1,1,50);
	Dr_Battle_EnemyFunc(enemy_ins._enemy_id,DR_BATTLE_ENEMY.HURT);
	
	instance_create_depth(enemy_ins.x-70,enemy_ins.y-50,enemy_ins.depth-1,dr_battle_menu_damageNum)
	if(is_last_ins){
		Dr_Battle_SetStageTime(100)
	}
}
