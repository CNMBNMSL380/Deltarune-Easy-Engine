/// @description 事件
live;
depth=DEPTH_BATTLE.BOARD - 10;
Dr_Draw(function(){
	var color = dr_battle_board.color_frame
	var spr_wid = sprite_get_width(img);
	var spr_hei = sprite_get_height(img);
	draw_sprite_ext(img,0,x,y,width/spr_wid,height/spr_hei,image_angle,color,image_alpha);
});

