/// @description 事件
live;
draw_set_font(font);
depth = DEPTH_DR_BTL.UI_HIGH;
Dr_Draw(function(){
	draw_set_alpha(image_alpha)
	draw_text_transformed(x+anim_x,y+anim_y,string(dam_num),sca_x,sca_y,0);
	draw_set_alpha(1)
})