// Script assets have changed for v2.3.0 see
function Char_Friend_MagicBase(
	CHAR = "",
	NAME = "魔法" + string(random(5)),
	INFO = "这是魔法",
	TP = 10,
	INST ,
	FUNCTION = function(){}
) 
constructor{
	_magic_name = NAME;
	_magic_info = INFO;
	_magic_use_tp = TP;
	
	//这里可以通过战斗中的实例来实现方法，也可以直接调用自带的函数
	_magic_inst = INST;
	_magic_event = FUNCTION;	

	function Use_Magic(){
		var inst = instance_create_depth(0,0,0,dr_battle_magic)
		inst.mag = Char_GetValue(1,"",);
		with(inst){
			event_user(0);
		}
		instance_destroy(magic_inst);
		return true;
	}
}