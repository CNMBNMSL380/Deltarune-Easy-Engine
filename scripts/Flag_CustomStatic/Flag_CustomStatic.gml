function Flag_CustomStatic(){
	with(Flag_GetStorage(FLAG_STATIC)){
		Set("overworld_mode",0);
		Set("name","Nico");
		Set("lv",1);
		Set("hp",100);
		Set("hp_max",100);
		Set("atk",10);
		Set("atk_item",0);
		Set("def",10);
		Set("def_item",0);
		Set("spd",2);
		Set("spd_item",0);
		Set("inv",40);
		Set("inv_item",0);
		Set("exp",0);
		Set("gold",0);
		Set("battle_menu_fight_obj","fist");
		
		Set("room","如果你看到这个，那恭喜你，我要倒大霉了");
		Set("time",0);
		Set("fun",0);
		
		Set("item",new Flag_Inventory(8));
		Set("item_dark",new Flag_Inventory(8));
		Set("box0",new Flag_Inventory(10));
		Set("box1",new Flag_Inventory(10));
		Set("phone",new Flag_Inventory(10));
		
		// 队伍列表，你可以储存队友信息，不过不会展示在队伍，也不会被修改信息
		Set("friend", [
			new Char_Friend_Base("Susic",char_susic,dr_battle_char_susie,150,100),
			//new Char_Friend_Structer("Ralsei",char_ralsei,dr_battle_char_kris),
		] );	
		
		//团队，储存要跟着你的队友，这种会跟着队伍里且可以在UI里修改信息
		//一般它可以同时设置多个队友，不过最好只有2个
		Set("team",[		
			new Char_Friend_Base("Susie",char_susic,dr_battle_char_susie,150,100),
			new Char_Friend_Base("Ralsei",char_ralsei,dr_battle_char_ralsei,80,80)
		]);	
	}
	Item_SetWeapon(item_bandage);
	Item_SetArmor(item_stick);
	
	Item_Add(item_tml);
	Item_Add(item_tml);
	
	Phone_Add(phone_toriel)
	Phone_Add(phone_toriel)
	Phone_Add(phone_toriel)
}