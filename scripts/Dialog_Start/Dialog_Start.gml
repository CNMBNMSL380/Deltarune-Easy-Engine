function Dialog_Start() {
	var Main = dr_battle_main;
	var UI = dr_battle_ui;
	//如果不在DR战斗系统
	if!(instance_exists(Main)){
		if(!instance_exists(ui_dialog)&&!Player_IsInBattle()){
			ins=instance_create_depth(0,0,0,ui_dialog);
			with(ins){
				event_user(1);	
			}
			return true;
		}else{
			return false;
		}
	}
	else{
		var text = Dialog_Get();
		UI.text = text
		return true;
	}

}
