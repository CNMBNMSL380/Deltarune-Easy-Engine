/// @description 事件
live;
image_xscale = 2;
image_yscale = 2;

Dr_Draw(function(){
	draw_sprite_ext(_char_img[_char_mode],_char_index[_char_mode],x,y,image_xscale,image_yscale,image_angle,_char_color,image_alpha);	
})
