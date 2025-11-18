/// @description 事件
live;

// Inherit the parent event
event_inherited();

_char_can_set_menu = false

_char_id = 0;
_char_name = "Ralsei";
_char_ico = spr_battle_ico_ralsei;
_char_ico_index = [0,1,2,4,5,6,7,8];

_char_intro_sound = -1;
_char_glide_anim_mod= 0;

_char_heard = spr_dr_battle_headerName_ralsei;
_char_color = c_white;
_char_style_color = #B5E61D;	

_magic = true;

_char_mode = DR_PLAYER_INDEX.GLIDE;
_char_img[DR_PLAYER_INDEX.GLIDE] = spr_char_ralsei_right;
_char_img[DR_PLAYER_INDEX.INTRO] = spr_battleChar_ralsei_intro;
_char_img[DR_PLAYER_INDEX.IDLE] = spr_battleChar_ralsei_idle;
_char_img[DR_PLAYER_INDEX.FIGHT] = spr_battleChar_ralsei_fight;
_char_img[DR_PLAYER_INDEX.ACT] = [spr_battleChar_ralsei_act_0,spr_battleChar_ralsei_act_1];
_char_img[DR_PLAYER_INDEX.MAGIC] = [spr_battleChar_ralsei_magic_0];
_char_img[DR_PLAYER_INDEX.ITEM] = spr_battleChar_kris_glide;
_char_img[DR_PLAYER_INDEX.DEFEND] = spr_battleChar_kris_glide;
_char_img[DR_PLAYER_INDEX.WIN] = spr_battleChar_kris_glide;
