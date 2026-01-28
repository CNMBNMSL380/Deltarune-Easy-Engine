// Script assets have changed for v2.3.0 see
function Char_CreatePlayer(){
	var playerChar   = Char_GetTeamObj(0);
	var inst         = instance_create_depth(-999,-999,0,char_kris);
	var battleObject = inst.battle_obj;
	var spriteIdle   = inst.idle_sprite;
	var spriteMove   = inst.move_sprite;
	var spriteRun    = inst.run_sprite;
	
	var mSpdUp    = move_speed[DIR.UP]=1.5;
	var mSpdDown  = move_speed[DIR.DOWN]=1.5;
	var mSpdLeft  = move_speed[DIR.LEFT]=1.5;
	var mSpdRight = move_speed[DIR.RIGHT]=1.5;
	instance_destroy(inst);
	return {
		_char : Char_GetTeamByID(0),
		object : playerChar,
		battle_obj : battleObject,
		spr_idle : spriteIdle,
		spr_move : spriteMove,
		spr_run : spriteRun,
		move_speed_up : mSpdUp,
		move_speed_down : mSpdDown,
		move_speed_left : mSpdLeft, 
		move_speed_right : mSpdRight,
			
	}
}