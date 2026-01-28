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
		Set("item_dark",new Flag_Inventory(12));
		Set("box0",new Flag_Inventory(10));
		Set("box1",new Flag_Inventory(10));
		Set("phone",new Flag_Inventory(10));
		
			
	}
	Item_SetWeapon(item_bandage);
	Item_SetArmor(item_stick);
	
	Item_Add(item_tml);
	Item_Add(item_tml);
	
	Phone_Add(phone_toriel)
	Phone_Add(phone_toriel)
	Phone_Add(phone_toriel)
}