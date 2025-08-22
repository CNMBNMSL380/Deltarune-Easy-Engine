/// @description 事件
live;

// Inherit the parent event
event_inherited();

_char_name = "Susie";
_char_style_color = #EA79C8;
_char_img[DR_PLAYER_INDEX.GLIDE] = spr_char_susie_light_right;
_char_img[DR_PLAYER_INDEX.INTRO] = spr_battleChar_susie_intro;
_char_img[DR_PLAYER_INDEX.IDLE] = spr_battleChar_susie_idle;
_char_img[DR_PLAYER_INDEX.FIGHT] = spr_battleChar_kris_fight;
_char_img[DR_PLAYER_INDEX.ACT] = spr_battleChar_kris_glide;
_char_img[DR_PLAYER_INDEX.MAGIC] = spr_battleChar_kris_glide;
_char_img[DR_PLAYER_INDEX.ITEM] = spr_battleChar_kris_glide;
_char_img[DR_PLAYER_INDEX.DEFEND] = spr_battleChar_kris_glide;
_char_img[DR_PLAYER_INDEX.WIN] = spr_battleChar_kris_glide;

_char_ico = spr_battle_ico_susie;
_char_heard = spr_dr_battle_headerName_susie;

//_magic = true;