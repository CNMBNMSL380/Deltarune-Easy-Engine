// Script assets have changed for v2.3.0 see

function Dr_Battle_CreateSpriteList(ID,INST,MODE = 0){
	var Main = dr_battle_main;
	var base = new Dr_Battle_SpriteListBase(ID,INST,MODE)
	ds_list_add(Main._sprite_list,base)
	return base;
}
function Dr_Battle_GetSpriteListBase(TARGET){
	var Main = dr_battle_main;
	if(instance_exists(TARGET)){
		//如果是实例对象，则直接获取对象的char_spr
		if(variable_instance_exists(TARGET,"_char_spr")){
			if(is_struct(TARGET._char_spr)){
				return TARGET._char_spr
			}
			else{
				show_debug_message(string("Dr_Battle_GetSpriteBase:getInst"+TARGET + " : 未创建或不是精灵列表"));
			}
		}	
	}
	else if(is_real(TARGET) or is_string(TARGET)){
		//如果是数字或字符串，则获取main的精灵库
		var sprList = Main._sprite_list;
		for(var i = 0; i< array_length(sprList); i++){
			var map = ds_list_find_value(sprList,i);
			if(map._id == TARGET){
				return map;
			}
		}
		show_debug_message(string("Dr_Battle_GetSpriteBase:getString / getInt"+TARGET + " : 未找到精灵表"));		
	}
	else if(is_struct(TARGET)){
		
		return TARGET
	}
	return undefined;
}
function Dr_Battle_ExistsSprite(BASE,MODE){
	var base = Dr_Battle_GetSpriteBase(BASE);
	return ds_map_exists(base,MODE);
	
}
function Dr_Battle_AddSprite(BASE,MODE,SPRITE,SPRINDEX = 0,SPEED = 0){
	var base = Dr_Battle_GetSprite(BASE);
	if(base != undefined){
		var strc = {
			sprite : SPRITE,
			spr_mode: MODE,
			spr_index : SPRINDEX,				
			spr_speed : SPEED,
			spr_speed_continuous : false 
			// ↑如果为true,则即便不在此模式也会进行增值，但这样会消耗性能
		}
		ds_map_add(base,MODE,strc);
		return true
	}
}
function Dr_Battle_GetSprite(BASE,MODE = ""){
	if(MODE == ""){
		return Dr_Battle_GetSpriteListBase(BASE)._sprite_map;
	}
	else {
		return ds_map_find_value(Dr_Battle_GetSpriteListBase(BASE)._sprite_map,MODE);
	};
	return undefined;
	
}
function Dr_Battle_GetSpriteImage(BASE,MODE){
	var base = Dr_Battle_GetSprite(BASE,MODE);
	return base.sprite;
}
function Dr_Battle_GetSpriteIndex(BASE,MODE){
	var base = Dr_Battle_GetSprite(BASE,MODE);
	return base.spr_index;
}
function Dr_Battle_GetSpriteMode(BASE){
	var base = Dr_Battle_GetSpriteListBase(BASE);
	return base._mode;
}
function Dr_Battle_SetSpriteImage(BASE,MODE,SPRITE){
	var base = Dr_Battle_GetSpriteListBase(BASE);	
	ds_map_replace(base,MODE,SPRITE);
}
function Dr_Battle_SetSpriteMode(BASE = "",MODE){
	if(BASE != ""){
		var base = Dr_Battle_GetSpriteListBase(BASE);
		base._mode = MODE;
	}
	else{
		var Main = dr_battle_main;
		for(var i = 0; i < ds_list_size(Main._sprite_list) ; i++){
			
		}
	}
	return true;
}
function Dr_Battle_PlaySpriteAnimOnce(BASE,MODE,EXTIME = 0,IS_SETMODE = true,DELAY = 0,MIN = 0,MAX = 0){
	// 用于播放动画，但只能播放一次
	var base = Dr_Battle_GetSprite(BASE,MODE);
	if(base !=undefined){
		if(IS_SETMODE){ Dr_Battle_SetSpriteMode(BASE,MODE); }
		
		var sprite = base.sprite;
		var indMax = sprite_get_number(sprite) - MAX - 1;
		var fixedSpeed = 15;
		var game_fps = room_speed;

		// 计算完整播放一次动画所需的总帧数
		var totalFrames = (indMax * game_fps) / fixedSpeed;
		
		Anim_Create(base,"spr_index",0,0,MIN,indMax-0,totalFrames+EXTIME,DELAY);	
		return true
	}
	return false
}
function Dr_Battle_PlaySpriteAnimLoop(BASE,MODE,LOOP = -1){
	// 用于播放动画，可以播放数次或者无限制播放
	
}
function Dr_Battle_SpriteAnimStep(){
	live_ext;
	var Main = dr_battle_main;
	var sprList = Main._sprite_list;
	for(var i = 0 ; i < ds_list_size(sprList); i++){
		var dsList = ds_list_find_value(sprList,i);
		var mode = dsList._mode;
		var map = dsList._sprite_map;
		var sprMapKey = ds_map_find_first(map);
		var size = ds_map_size(map)
		for (var j = 0; j < size; j++) {
			var sprMap = ds_map_find_value(map,sprMapKey)			
			if(sprMap.spr_mode == dsList._mode or  sprMap.spr_speed_continuous){
				sprMap.spr_index += sprMap.spr_speed;
			}
			sprMapKey = ds_map_find_next(map,sprMapKey);
		}
	}
}
function Dr_Battle_ClearSpriteMap(){
	//清除list里所有的map
	var Main = dr_battle_main;
	var sprList = Main._sprite_list;
	for(var i = 0 ; i < ds_list_size(sprList); i++){
		var dsList = ds_list_find_value(sprList,i);
		var map = dsList._sprite_map;
		ds_map_destroy(map);
	}
	return true;
}
function Dr_Battle_SpriteUninit(){
	Dr_Battle_ClearSpriteMap()
	var Main = dr_battle_main;
	ds_list_destroy(Main._sprite_list)
	ds_list_destroy(Main._sprite_index_list_step);
	
	return true;
}









//function Dr_Battle_CreateSpriteList(ID,INST,MODE = 0){
//	var Main = dr_battle_main;
//	if(Dr_Battle_GetSpriteListById(ID) == undefined){
//		var listSpr = {
//			spr_id: ID,
//			inst : INST,
//			mode : MODE,
//			list: ds_map_create(),
//			toString : function(){
//				var strList = ""
//				var dsMap = ds_map_values_to_array(list);
//				for(var i =0; i<array_length(dsMap); i++){
//					strList += string(dsMap[i].sprite)  + "\n";	
//				}
//				return string("sprid : {0} \ninst : {1} \nmode : {2} \nlist : {3} ",spr_id,inst,mode,strList);
//			}
//		}	
//		ds_list_add(Main._sprite_list,listSpr);
//		return listSpr;
//}
//	else{
//		show_debug_message("Dr_Battle_CreateSpriteList:重复的ID")	
//		return false;
//	}
//}
//function Dr_Battle_GetSpriteListByInstance(INST){
//	var Main = dr_battle_main;
//	var ds = Main._sprite_list
//	var size = ds_list_size(ds);
//	for(var i = 0 ; i < size ; i++){
//		var val = ds_list_find_value(ds,i);
//		if(val.inst == INST){
//			return val;
//		}
//	}
//	show_debug_message("Dr_Battle_GetListByInstance: 未找到实例")
//	return undefined;
//}
//function Dr_Battle_GetSpriteListById(ID){
//	var Main = dr_battle_main;
//	var ds = Main._sprite_list
//	var size = ds_list_size(ds);
//	for(var i = 0 ; i < size ; i++){
//		var val = ds_list_find_value(ds,i);
//		if(val.spr_id == ID){
//			return val;
//		}
//	}
//	show_debug_message("Dr_Battle_GetListByInstance: 未找到实例")
//	return undefined;
//}
//function Dr_Battle_AddSpriteListById(ID,SPR_MODE,SPR,INDEX = 0){
//	var list = Dr_Battle_GetSpriteListById(ID);
//	if(list != undefined){
//		var mapList = list.list
//		var sprStrc = {
//				spr_mode : SPR_MODE,
//				sprite : SPR,
//				index : INDEX
//			}			
//		if(!ds_map_exists(mapList,SPR_MODE)){		
//			ds_map_add(mapList,SPR_MODE,sprStrc);
//			return true
//		}
//		else{
//			ds_map_replace(mapList,SPR_MODE,sprStrc);
//			return true
//		}
//	}
//	return false;
//}
//function Dr_Battle_AddSpriteListByInstance(INST,SPR_MODE,SPR,INDEX = 0){
//	var list = Dr_Battle_GetSpriteListByInstance(INST);
//	if(list != undefined){
//		var mapList = list.list
//		if(!ds_map_exists(mapList ,SPR_MODE)){
//			var sprStrc = {
//				spr_mode : SPR_MODE,
//				sprite : SPR,
//				index : INDEX
//			}
//			ds_map_add(mapList ,SPR_MODE,sprStrc);
//			return true
//		}
//		else{
//			var sprStrc = {
//				spr_mode : SPR_MODE,
//				sprite : SPR,
//				index : INDEX
//			}
//			ds_map_replace(mapList ,SPR_MODE,sprStrc);
//			return true
//		}
//	}
//	return false;
	
//}
//function Dr_Battle_GetSprite(ID,MODE){
//	if(instance_exists(ID)){
//		var list = Dr_Battle_GetSpriteListByInstance(ID);
//		if(list != undefined){
//			var mapList = list.list
//			if(ds_map_exists(mapList ,MODE)){
//				return ds_map_find_value(mapList,MODE).sprite;
//			}
//		}
//	}
//	else {
//		var list = Dr_Battle_GetSpriteListById(ID);
//		if(list != undefined){
//			var mapList = list.list
//			if(ds_map_exists(mapList,MODE)){
//				return ds_map_find_value(mapList ,MODE).sprite;
//			}
//		}
//	}
//	return -1
	
//}
//function Dr_Battle_GetMode(){

//}
