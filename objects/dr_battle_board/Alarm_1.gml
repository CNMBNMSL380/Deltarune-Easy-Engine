/// @description 持续生成影子
live;
	var bb = dr_battle_board;
if(Anim_IsExists(bb,"angle")){
	a=instance_create_depth(dr_battle_board.x,dr_battle_board.y,0,dr_battle_board_shadow);
	a.width = (bb.left + bb.right) ;
	a.height = (bb.up + bb.down) ;
	a.image_angle = bb.angle;
	if(!anim_mod){
		Anim_Create(a,"image_alpha",4,2,image_alpha,0-image_alpha,15);
		a.depth=bb.depth+10;
		a.alarm[0] = 15
		alarm[1] = 1
	}
	else{
		Anim_Create(a,"image_alpha",4,2,image_alpha,0-image_alpha,15);
		a.depth=bb.depth-10;
		a.alarm[0] = 15
		alarm[1] = 1
	}
	
}

