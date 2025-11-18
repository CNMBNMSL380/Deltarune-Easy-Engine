// Script assets have changed for v2.3.0 see
function Char_Friend_SusieBase(){
	return new Char_Friend_Base(
		"Susie",char_susic,dr_battle_char_susie,150,150,12,15,,,,,,
		[
			new Char_Friend_MagicBase("Susie","粗暴碎击","",75,dr_battle_magic_rudebuster) ,
			new Char_Friend_MagicBase("Susie","终极治疗","",100,dr_battle_magic_healplayer) ,
		]
	) 
}