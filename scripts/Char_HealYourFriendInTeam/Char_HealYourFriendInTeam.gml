// Script assets have changed for v2.3.0 see
function Char_HealYourFriendInTeam(SLOT,HEAL,SFX = true){
	if(HEAL > 0){
		var hp = ( (Char_GetTeamHp(SLOT) + HEAL) < Char_GetTeamMaxHp(SLOT) ? Char_GetTeamHp(SLOT) + HEAL : Char_GetTeamMaxHp(SLOT));
		Char_SetTeamHp(SLOT,hp);
		if(SFX){audio_play_sound(snd_item_heal,0,0)}
		return true;
	}
}