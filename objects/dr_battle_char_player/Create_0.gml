/// @description 事件
live;
/*
	友军角色，用于绘制友军人物，
	通常用于储存角色的属性，同时执行各种动作事件
	
	如果你要生成一个新的队友对象，就必须继承这个物体，也必须继承
	那个创建事件
*/ 
_char_id = 0;
_char_name = "Kris";
_char_ico = spr_battle_ico_kris;
_char_heard = spr_dr_battle_headerName_kris;
_char_color = c_white;
_char_style_color = #00FFF6;		//给frriendClass调用

_char_mode = DR_PLAYER_INDEX.GLIDE;
_char_img[DR_PLAYER_INDEX.GLIDE] = spr_battleChar_kris_glide;
_char_img[DR_PLAYER_INDEX.INTRO] = spr_battleChar_kris_intro;
_char_img[DR_PLAYER_INDEX.IDLE] = spr_battleChar_kris_idle;
_char_img[DR_PLAYER_INDEX.FIGHT] = spr_battleChar_kris_fight;
_char_img[DR_PLAYER_INDEX.ACT] = spr_battleChar_kris_glide;
_char_img[DR_PLAYER_INDEX.MAGIC] = spr_battleChar_kris_glide;
_char_img[DR_PLAYER_INDEX.ITEM] = spr_battleChar_kris_glide;
_char_img[DR_PLAYER_INDEX.DEFEND] = spr_battleChar_kris_glide;
_char_img[DR_PLAYER_INDEX.WIN] = spr_battleChar_kris_glide;

_char_button[0] = spr_dr_battle_button_fight
_char_button[1] = spr_dr_battle_button_act
_char_button[2] = spr_dr_battle_button_item
_char_button[3] = spr_dr_battle_button_mercy
_char_button[4] = spr_dr_battle_button_defend

_char_index = [0,0,0,0,0,0,0,0,0,0];

_magic = false;
_magic_strc = [];


event_user(0)
