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


function draw_event(){
	var box_width = 213;
	var box_height = 39*2;
	var box_width_max = sprite_get_width(spr_dr_battle_box_x1);
	var box_height_max = sprite_get_height(spr_dr_battle_box_x1);
	var posX = x - floor( (box_width / 2));
	var posY = 286 + _anim_y + dr_battle_ui.pos_y;		
	
	///		------------头部边框绘制	-用于绘制角色图标，名字与HP条
	draw_sprite_ext(spr_pixel,0,posX,posY+2,box_width,box_height,0,c_black,1);
	draw_sprite_ext(_border_img,0,posX,posY,box_width/box_width_max,box_height/box_width_max,0,_sytle_color,_border_alpha);
		
	var ico_x = 13;
	var ico_y = 11;
	var name_x = 38;
	var name_y = 14;
	draw_sprite_ext(_header_ico,_header_ico_index,posX + ico_x,posY + ico_y,1,1,0,c_white,1 * image_alpha);
	draw_sprite_ext(_header_name,0,posX + ico_x + name_x,posY + name_y,1,1,0,c_white,1 * image_alpha);
		
		
	var ui_hp_x = 110;
	var ui_hp_y = 22;
	draw_sprite(spr_dr_battle_class_hp,0,posX+ui_hp_x,posY+ui_hp_y);
		
	//		-------------HP条	
	var hp_x1 = 18
	var hp_y1 = 0
	var hp_x2 = 93
		var hp_y2 = 8
	var pc = (hp / hp_max) * 100 ;
	draw_healthbar(posX + ui_hp_x + hp_x1 ,  posY + ui_hp_y + hp_y1 , posX+ui_hp_x + + hp_x2,posY+ui_hp_y + hp_y2,pc,c_red,c_yellow,c_yellow,0,0,0);
		
	//		-------------绘制HP值
	var hpF_x = 50;
	var hpF_y = -13;
	draw_set_font(hp_font);
	draw_set_colour(c_white);
	draw_set_halign(fa_right)
	draw_text_transformed(posX + ui_hp_x + hpF_x,posY+ui_hp_y + hpF_y,string(hp),2,2,0);
	var slant_x = 1;
	draw_sprite(spr_dr_battle_font_slant,0,posX + ui_hp_x + hpF_x + slant_x,posY+ui_hp_y + hpF_y)
	var hpMaxF_x = 45;
	draw_text_transformed(posX + ui_hp_x + hpF_x + hpMaxF_x,posY+ui_hp_y + hpF_y,string(hp_max),2,2,0);
		
	draw_set_halign(fa_left)
		
	///		------------按钮边框绘制	-用于绘制按钮
	//draw_sprite_ext(spr_dr_battle_friendClass_box_x1,0,posX,buttonBox_y,box_width/box_height_max ,box_height/box_height_max ,0,c_white,_border_alpha * image_alpha);
		//现在改为画线
	var buttonBox_y = posY+(39 - 2);
	draw_sprite_ext(spr_pixel,0,posX + 2,buttonBox_y,box_width - 4  ,2 ,0,_sytle_color,_border_alpha * image_alpha);
	///		------------按钮绘制
	var button_posY = 5;
	var fight_posX = 19;
	draw_sprite_ext(button_img[0],(choice_button == 0),posX+fight_posX,buttonBox_y + button_posY,1,1,0,c_white,1);
		
	var ACT_posX = 35;
	var two_button = (magic_button ? button_img[2] : button_img[1]);

	draw_sprite_ext(two_button,(choice_button == 1),posX+fight_posX+ACT_posX, buttonBox_y + button_posY,1,1,0,c_white,1);
		
	var item_posX = 35;
	draw_sprite_ext(button_img[3],(choice_button == 2),posX+fight_posX+ACT_posX+item_posX, buttonBox_y + button_posY,1,1,0,c_white,1);
		
	var mercy_posX = 35;
	draw_sprite_ext(button_img[4],(choice_button == 3),posX+fight_posX+ACT_posX+item_posX+mercy_posX, buttonBox_y + button_posY,1,1,0,c_white,1);
		
	var defend_posX = 35;
	draw_sprite_ext(button_img[5],(choice_button == 4),posX+fight_posX+ACT_posX+item_posX+mercy_posX+defend_posX, buttonBox_y + button_posY,1,1,0,c_white,1);
	
}

function animSwitch(){
	alarm[0] = 1;
}
//event_user(0)