/// @description 事件
live;
depth = DEPTH_DR_BTL.CHAR
Dr_Draw(function(){

	draw_self();
	
	draw_text(x+50,y - 20,_enemy_id);
	draw_text(x+50,y - 30,hp);
	//draw_text(x+50,y - 40,dr_battle_main._enemy[_enemy_id].getSlot());
})