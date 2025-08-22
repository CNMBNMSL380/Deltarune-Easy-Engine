/// @description 事件
live;
//如果没有贴图则不执行这下列代码
if(img != noone){
	
	spr_max_width = sprite_get_width(img);
	spr_max_height = sprite_get_height(img);
	var draw = function(){
		var width =spr_max_width
		var height =spr_max_height
		draw_sprite_ext(img,0,x,y,140 / width,200/height,0,c_white,image_alpha);
	}
	
	Dr_Draw(draw)
}
