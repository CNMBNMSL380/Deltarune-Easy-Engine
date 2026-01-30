// Script assets have changed for v2.3.0 see
function Char_HurtYourFriendInTeam(SLOT,DAMG = 0,SFX = true,FORCED = false){
	if(DAMG > 0){
		//如果为true，则无论如何都会保留到1点，否则直接扣除到负数
		if(FORCED){ var hp = ( (Char_GetTeamHp(SLOT) - DAMG) > 1 ? Char_GetTeamHp(SLOT) - DAMG : 1); }
		else { var hp = Char_GetTeamHp(SLOT) - DAMG; }
		
		Char_SetTeamHp(SLOT,hp);
		if(SFX){audio_play_sound(snd_hurt,0,0)}
		
		return true;
	}
	return false;
}