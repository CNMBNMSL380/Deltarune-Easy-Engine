// Script assets have changed for v2.3.0 see
function Dr_Battle_AddEnemyEvent(SLOT,KEY,EVENT){
	var Main = dr_battle_main._enemy_event;
	
	var list = ds_list_find_value(Main,SLOT);
	if(is_callable(EVENT)){
		ds_map_add(list,KEY,EVENT)
		return true
	}
	else{
		show_debug_message("!Dr_Battle_Enemy_AddEvent: "+ string(KEY)+": 添加失败 : 非调用函数或没有设置")	
		return false
	}
}