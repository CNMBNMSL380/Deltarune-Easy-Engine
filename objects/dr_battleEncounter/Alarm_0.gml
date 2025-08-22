/// @description 初始化战斗事件
live;


//生成战斗对象
inst_mian=instance_create_depth(0,0,0,dr_battle_main);
inst_mian._enemy_obj = Dr_Battle_CreateEnemyData(targin_enemy , , enemy_x , enemy_y)
inst_mian._player_friend_obj = Create_Friend();

//最后隐藏并停用角色
with (all) {
	var battleMode = variable_instance_get(id,"battle_mod");
	if(battleMode != undefined){
		if(battleMode >=0){
			visible = false;
			instance_deactivate_object(id);
		}
	}  
}

instance_destroy()