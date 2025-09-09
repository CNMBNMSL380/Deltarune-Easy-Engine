/// @description 事件
live;
depth = DEPTH_DR_BTL.UI_HIGH;

if !surface_exists(mask_surface) {
    mask_surface = surface_create(room_width, room_height);
}

Dr_Draw(function(){
	surface_set_target(mask_surface){
		draw_clear_alpha(c_black, 0); // 透明背景
	
		draw_sprite_ext(spr_dr_battle_tp,1,x,y,1,1,0,c_white,image_alpha);	
		var tpp = (Dr_Battle_GetTp() / 100 ) * 1
	
		draw_sprite_ext(spr_dr_battle_tp_value,0,x,y+196,1,tpp,0,c_white,image_alpha)
	
		gpu_set_blendmode(bm_subtract);
		draw_sprite_ext(spr_dr_battle_tp_,0,x,y,1,1,0,c_white,image_alpha);
		gpu_set_blendmode(bm_normal);
	
		draw_sprite_ext(spr_dr_battle_tp,0,x,y,1,1,0,c_white,image_alpha)
		draw_sprite_ext(spr_dr_battle_tp,2,x-30,y+30,2,2,0,c_white,image_alpha);
		
		draw_set_font(Font_Get("FH16"))
		draw_set_halign(fa_center)
		draw_set_alpha(image_alpha)
		draw_text_transformed(x-15,y+30+37,Dr_Battle_GetTp(),2,2,0);
		draw_text_transformed(x-15,y+30+40+20,"%",2,2,0);		
		draw_set_alpha(1)
	}surface_reset_target();
	draw_surface(mask_surface, 0, 0);
})