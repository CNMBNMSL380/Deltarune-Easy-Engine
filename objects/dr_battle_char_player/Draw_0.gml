/// @description 事件
live;
image_xscale = 2;
image_yscale = 2;

Dr_Draw(function(){
	draw_sprite_ext(_char_img,_char_index,x,y,image_xscale,image_yscale,image_angle,_char_color,image_alpha);	
	draw_set_font(Font_Get("FH16"))
	draw_text(x+50,y-30,_char_index);	
})
