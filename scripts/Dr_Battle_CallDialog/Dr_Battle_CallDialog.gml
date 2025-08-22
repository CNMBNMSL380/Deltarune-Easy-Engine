// Script assets have changed for v2.3.0 see
function Dr_Battle_CallDialog(TEXT,TEXTSTYLE = -1,LAYOUT = 0,CHOICE = false){
	var Main = dr_battle_main;
	var UI = dr_battle_ui;
	if(TEXTSTYLE == -1){
		TEXTSTYLE = Main._dialogue_style;
		if(is_array(TEXT)){
			UI.text_list = TEXT;
		}
		else{UI.text = TEXT;}
		UI.text_style = TEXTSTYLE;
		UI.text_layout = LAYOUT;
		UI.choice_select = CHOICE;
		with(UI){	
			event_user(0)
		}	
	}
	else{
		if(is_array(TEXT)){
			UI.text_list = TEXT;
		}
		else{UI.text = TEXT;}
		UI.text_style = TEXTSTYLE;
		UI.text_layout = LAYOUT;
		UI.choice_select = CHOICE;
		with(UI){	
			event_user(0)
		}	
	}
	return true;
}