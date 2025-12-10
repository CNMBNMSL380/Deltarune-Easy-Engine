/// @description Don't forget to place this object in the first room!
// this is a simple safeguard against making multiple obj_gmlive instances
if (instance_number(obj_gmlive) > 1) {
	var first = instance_find(obj_gmlive, 0);
	if (id != first) { instance_destroy(); exit; }
}

// flip this value to 0 to disable GMLive!
#macro live_enabled 0

if (asset_get_index("live_init") == -1) show_error("live_init is missing!\nEither GMLive is not imported in the project, or the 'GMLive' script got corrupted (try re-importing)\nIf you don't have GMLive, you can safely remove obj_gmlive and any remaining live_* function calls.\n\n", 1);

// change the IP/port here if gmlive-server isn't running on the same device as the game
// (e.g. when running on mobile platforms):
live_init(1, "http://localhost:5100", "");

// if you need to add any overrides because of 

#macro live if  ( live_call ( ) )  return  live_result 
#macro live_ext { var argument_arr = array_create ( argument_count ) ; for  ( var i = 0 ; i < argument_count ; i++ ){ argument_arr [i]  =  argument [i] ; } if (live_call_ext( argument_arr )) return live_result ;}


live_code_updated = function(name,display_name){
	show_debug_message (string_hash_to_newline( "事件更新！ #物体： "  +  display_name  +  "#代码： "  +  name  +  "#祝你好运！" )) ; 
}