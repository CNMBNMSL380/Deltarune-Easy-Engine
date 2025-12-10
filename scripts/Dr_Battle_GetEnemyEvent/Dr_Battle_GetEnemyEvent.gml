// Script assets have changed for v2.3.0 see
function Dr_Battle_GetEnemyEvent(SLOT,KEY){
	var Main = dr_battle_main._enemy_event;
	
	var map = ds_list_find_value(Main,SLOT);
	if(ds_map_exists(map,KEY)){
		var _event = ds_map_find_value(map,KEY);
		return _event
	}
	//return function(){show_debug_message("Dr_Battle_Enemy_GetEvent:未找到脚本")}	
	return function(){}	
	
}