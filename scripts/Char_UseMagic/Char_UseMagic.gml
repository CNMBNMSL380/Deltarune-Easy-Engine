// Script assets have changed for v2.3.0 see
function Char_UseMagic(CHAR_CLASS,CHAR,SLOT,CHOICE = []){
	var magic = Char_GetMagic(CHAR_CLASS,CHAR)[SLOT];
	var instMag = magic._magic_inst;
	var inst = instance_create_depth(0,0,0,instMag)
	show_message(inst)
	inst.mag = Char_GetValue(1,CHAR,"mag");
	inst.magic_choice_enemy = CHOICE[0]
	inst.magic_choice_friend = CHOICE[1]
	with(inst){
		event_user(0);
	}
	instance_destroy(inst);
	return true;
}