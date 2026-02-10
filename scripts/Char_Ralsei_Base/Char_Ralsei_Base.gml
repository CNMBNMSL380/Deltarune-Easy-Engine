// Script assets have changed for v2.3.0 see
function Char_Ralsei_Base() : Char_Base() constructor{
	char_name = "Ralsei";
	char_obj = char_ralsei;
	char_battle_obj = dr_battle_char_ralsei;
	char_hp = 20;
	char_maxhp = 70;
	char_atk = 12;
	char_def = 15;
	char_magic = [
			new Char_Friend_MagicBase("Ralsei","治疗" ,"",,dr_battle_magic_healplayer) ,
			new Char_Friend_MagicBase("Ralsei","安抚" ,"",,dr_battle_magic_pacify) ,
		]
}


//function Char_Ralsei_Base(){
//	return new Char_Base(
//		"Ralsei",char_ralsei,dr_battle_char_ralsei,70,70,12,15,,,,,,
//		[
//			new Char_Friend_MagicBase("Ralsei","治疗" ,"",,dr_battle_magic_healplayer) ,
//			new Char_Friend_MagicBase("Ralsei","安抚" ,"",,dr_battle_magic_pacify) ,
//		]
//	) 
//}