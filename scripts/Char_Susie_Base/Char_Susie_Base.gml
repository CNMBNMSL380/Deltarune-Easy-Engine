// Script assets have changed for v2.3.0 see
function Char_Susie_Base() : Char_Base() constructor{
	char_name = "Susie";
	char_obj = char_susic;
	char_battle_obj = dr_battle_char_susie;
	char_hp = 110;
	char_maxhp = 110;
	char_atk = 12;
	char_def = 15;
	char_magic =[
			new Char_Friend_MagicBase("Susie","粗暴碎击","",75,dr_battle_magic_rudebuster) ,
			new Char_Friend_MagicBase("Susie","终极治疗","",100,dr_battle_magic_healplayer) ,
		];
}

//function Char_Susie_Base(){
//	return new Char_Base(
//		"Susie",char_susic,dr_battle_char_susie,150,150,12,15,,,,,,
//		[
//			new Char_Friend_MagicBase("Susie","粗暴碎击","",75,dr_battle_magic_rudebuster) ,
//			new Char_Friend_MagicBase("Susie","终极治疗","",100,dr_battle_magic_healplayer) ,
//		]
//	) 
//}