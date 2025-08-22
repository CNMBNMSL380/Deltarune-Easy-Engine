/// @description 事件
live;
depth=DEPTH_BATTLE.BOARD - 10;
Dr_Draw(function(){
	var color = dr_battle_board.color_frame
	draw_sprite_ext(spr_dr_battle_box_x2_center,0,x,y,width/20,height/20,image_angle,color,image_alpha);
});