/// @description 事件
live;
depth = DEPTH_DR_BTL.BG
time++ ;
Dr_Draw(function(){
	draw_sprite_ext(spr_pixel,0,0,0,640,480,0,c_black,image_alpha)
	draw_sprite_tiled_ext(spr_dr_battle_bg_box,0, -4+time / 4, time / 4 ,1,1,c_white,image_alpha);
	draw_sprite_tiled_ext(spr_dr_battle_bg_box,0,4-time/2,-time/2,1,1,c_white,image_alpha / 2);
})