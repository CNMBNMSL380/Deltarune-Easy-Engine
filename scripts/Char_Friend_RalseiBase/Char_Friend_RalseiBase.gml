// Script assets have changed for v2.3.0 see
function Char_Friend_RalseiBase(){
	return new Char_Friend_Base(
		"Ralsei",char_ralsei,dr_battle_char_ralsei,150,150,12,15,,,,,,
		[
			new Char_Friend_MagicBase("Ralsei","治疗" ,"",,dr_battle_magic_healplayer) ,
			new Char_Friend_MagicBase("Ralsei","安抚" ,"",,dr_battle_magic_pacify) ,
		]
	) 
}