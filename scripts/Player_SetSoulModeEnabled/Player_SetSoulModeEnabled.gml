///@arg enabled
function Player_SetSoulModeEnabled(){
	var ENABLED = argument[0];
	
	if(ENABLED = 1){
		instance_create_depth(char_player.x,char_player.y,0,char_player_soul);
		if(instance_exists(ui_menu))instance_destroy(ui_menu);
	}
	else{
		char_player_soul.destroy = 1;
	}
	char_player.soul_mode = ENABLED;
}