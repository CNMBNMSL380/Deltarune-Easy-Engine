/// @description 事件
live;
surface_free(_surface_main);

//物体可见度开启
with (all) {
	var battleMode = variable_instance_get(id,"battle_mod");
	if(battleMode != undefined){
		if(battleMode >=-1 ){
			visible = true;
		}
	}  
}
for(var i = 0; i < ds_list_size(_enemy_event); i++){
	ds_map_destroy(ds_list_find_value(_enemy_event,i));
}
ds_list_destroy(_enemy_event);

Dr_Battle_SpriteUninit();