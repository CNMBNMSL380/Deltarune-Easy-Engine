///@arg text
function Dialog_Add() {
	if!(instance_exists(dr_battle_main)){
		ds_queue_enqueue(global._dialog_queue,argument[0]);
		return true;
	}
	else{
		if(instance_exists(dr_battle_ui)){
			var text = argument[0];
			Dr_Battle_CallDialog(text,dr_battle_main._dialogue_style,3)
			return true
		}
		return false;
	}
	return false;


}
