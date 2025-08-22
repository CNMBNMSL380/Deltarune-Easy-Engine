/// @description 事件
live;
depth = DEPTH_DR_BTL.UI_HIGH;
Dr_Draw(function(){
	draw_sprite_ext(friend_ico,0,x + 5,y + 10,1,1,0,c_white,1)
	
	draw_sprite_ext(spr_dr_battle_menu_fight_press,0,x + 45,y - 3,1,1,0,c_white,1)
	
	draw_sprite_ext(spr_dr_battle_box_x1,0,x + 78,y,126/20,36/20,0,style_color,0.8)
	
	draw_sprite_ext(spr_dr_battle_box_x1,0,x + 80, y -2 ,10/20,40/20,0,style_color,1)
	
	//if(!knife_is_done){
		draw_sprite_ext(spr_dr_battle_menu_fight_knife,0,(x + (8/2)) + 80 + knife_x + (fight_slot * 50) , (y + (40/2)) ,1*knife_sc,1*knife_sc,0,c_white,knife_alp*image_alpha)
	//}
	
	draw_text(x + 10 ,y + 2,fight_slot);
	//draw_text(x + 10 ,y + 18,friend_ins);
	draw_text(x + 10 ,y + 18,is_last_ins);
	//draw_text(x + 10 ,y + 34,enemy_ins);
});