/// @description 事件
live;
	var bb = dr_battle_board;
if(Anim_IsExists(bb)){
	a=instance_create_depth(dr_battle_board.x,dr_battle_board.y,0,dr_battle_board_shadow)
	a.width = (bb.left + bb.right) ;
	a.height = (bb.up + bb.down) ;
	a.image_angle = bb.angle;
	//a.depth=bb.depth+10;
	alarm[0] = 2
}