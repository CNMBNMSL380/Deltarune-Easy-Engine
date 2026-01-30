/// @description 事件
live;
depth = DEPTH_DR_BTL.UI_BORDER
/* 
Dr_Draw(function(){}) 这个函数是专门绘制在Dr战斗系统里的画面，这样子绘制
用于战斗系统的贴图时可以用上他，如果你不用这个函数，那当摄像机坐标超过640 x 480,
会导致你看不到绘制内容，即便没有，如果摄像机移动一点，那你绘制的x,y坐标会错位
*/
Dr_Draw(function(){
	
	
	draw_sprite_ext(spr_pixel,0,0,329+pos_y - 5 ,640,320,0,bg_color,1)
	draw_sprite_ext(spr_pixel,0,0,326+pos_y - 5,640,2,0,border_color,1)
	with(dr_battle_ui_friendClass){
		event_user(0);	
	}
	draw_sprite_ext(spr_pixel,0,0,366+pos_y - 5,640,320,0,bg_color,1)
	draw_sprite_ext(spr_pixel,0,0,366+pos_y - 5,640,3,0,border_color,1)

	//绘制队友类表面，	
	//draw_surface_part(_surface_friendClass,1,0,641,80,0,286+pos_y-5);
	//如果choice为true , 则绘制灵魂
	//draw_sprite_ext(_____2025_08_03_023908,0,0,0,0.5,0.5,0,c_white,0.5)
	var posX = 52;
	var posY = 390;
	var offX = 0 , offY = 0;
	if(choice_select){
		if(text_layout == 1){		
			offY = 32*floor(text_choice_num);
			draw_sprite(spr_battle_soul_red,0,posX + offX,posY + offY);
		}
		if(text_layout == 2){
			offX = (text_choice_num % 2 == 0 ? 0 : 200)
			offY = 32*floor(text_choice_num/2)
			draw_sprite(spr_battle_soul_red,0,posX + offX - 20,posY + offY);
		}
	}
	
	//绘制-FIGHT-战斗UI贴图
	if(Dr_Battle_GetStage() == DR_BATTLE_STAGE.FIGHT){
		draw_sprite_ext(spr_dr_battle_menu_fight_bg,0,80,364+pos_y,1,1,0,c_white,1)
	}
	
	
	
});