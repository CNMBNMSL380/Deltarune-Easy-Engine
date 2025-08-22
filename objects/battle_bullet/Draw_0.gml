
surface_set_target(Battle_GetBoardSurface());{
	depth = DEPTH_BATTLE.BULLET
	draw_self();
}surface_reset_target();
var out = 1
if(out){
	depth = DEPTH_BATTLE.BULLET_OUTSIDE_LOW
	draw_self();
}