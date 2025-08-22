// Script assets have changed for v2.3.0 see
function Font_Init(){
	global.static_font = ds_map_create();
	#macro STATIC_FONT_PATH working_directory+"/img/Static/font/"
}
function Font_AddFont(FONT_ID,FONT_NAME,SIZE = 12,BOLD = 0,AA = false){
	font_add_enable_aa(AA)
	var font = font_add(STATIC_FONT_PATH + FONT_NAME,SIZE,BOLD,0,32,128)
	var map_id = global.static_font;
	ds_map_add(map_id,FONT_ID,font);
}


function Font_Get(FONT_ID){
	var map_id = global.static_font;
	return ds_map_find_value(map_id,FONT_ID);
}
