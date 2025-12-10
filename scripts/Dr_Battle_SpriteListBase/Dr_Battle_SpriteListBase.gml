// Script assets have changed for v2.3.0 see
function Dr_Battle_SpriteListBase(ID,INST,MODE = 0) constructor {
	Main = dr_battle_main;
	_id = ID;
	_instance = INST;
	_mode = MODE;
	_sprite_map = ds_map_create();
	function toString(){
		return string("id={0}\ninstance={1}\nmode={2}\nsprite_map={3}\nmap_size{4}",_id,_instance,_mode,_sprite_map,ds_map_size(_sprite_map));	
	}
	
}