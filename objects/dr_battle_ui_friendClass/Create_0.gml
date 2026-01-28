/// @description 事件
live;

friend_ins = noone;


//绘制框的基本属性
width = 213; /* 框的宽度 */ height = 80; /* 框的高度 */ _button_alpha = 1;/* 按钮的透明 */
_border_alpha = 0;/* 框的透明 */ _sytle_color = make_colour_rgb(0,255,255); /* 风格颜色 */

_expand = false;
_anim_y = 35;//35

_border_img = spr_dr_battle_box_x1 /* 框使用的精灵，默认spr_dr_battle_friendClass_box_x1 */

_header_ico = spr_battle_ico_kris;
_header_ico_index = 0
_header_name = spr_dr_battle_headerName_kris;
	 
button_img[0] = spr_dr_battle_button_fight;
button_img[1] = spr_dr_battle_button_act;
button_img[2] = spr_dr_battle_button_magic;
button_img[3] = spr_dr_battle_button_item;
button_img[4] = spr_dr_battle_button_mercy;
button_img[5] = spr_dr_battle_button_defend;
magic_button = true;

choice_button = 0;

hp_font = font_add_sprite_ext(spr_dr_battle_font_hp,"1234567890-",true,1)

hp = 100;
hp_max = 100;

function animSwitch(){
	alarm[0] = 1;
}
//event_user(0)