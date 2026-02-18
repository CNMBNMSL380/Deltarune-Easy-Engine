// Script assets have changed for v2.3.0 see
function Flag_CustomPlayerTeam(){
	with(Flag_GetStorage(FLAG_PLAYER_TEAM)){
		//--------------------- 
		//朋友列表，
		//储存队友信息，实际上就是好友库，不会展示在队伍里
		//一般情况下无法在游戏里修改数值
		Set("friend", [
			//new Char_Friend_Structer("Ralsei",char_ralsei,dr_battle_char_kris),
		] );	
		
		//团队，储存要跟着你的队友，这种会跟着队伍里且可以在UI里修改信息
		//一般它可以同时设置多个队友，不过最好只有2个
		Set("team",[		
			new Char_Kris_Base(),
			//new Char_Susie_Base(), 
			//new Char_Ralsei_Base()
		]);
	}
}