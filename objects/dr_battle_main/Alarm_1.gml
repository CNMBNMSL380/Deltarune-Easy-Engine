/// @description 战斗开始
live;
Dr_Battle_SetStage(DR_BATTLE_STAGE.PLAYER);
//event_user(1)
with(dr_battle_char_player){
	event_user(1);
}
instance_deactivate_object(dr_battle_board);	
Dr_Battle_EnemyFunc(,DR_BATTLE_ENEMY.BATTLE_START);

Dr_Battle_CheckFriendHelth(,false);