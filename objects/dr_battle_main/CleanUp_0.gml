/// @description 事件
live;
surface_free(_surface_main);


with (all) {
	var battleMode = variable_instance_get(id,"battle_mod");
	if(battleMode != undefined){
		if(battleMode >=-1 ){
			visible = true;
		}
	}  
}

char_player.moveable = true;