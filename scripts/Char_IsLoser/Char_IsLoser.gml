// Script assets have changed for v2.3.0 see
function Char_IsLoser(){
	var lose = true;
	for(var i = 0; i < Char_GetTeamLenght(); i++){
		if(Char_GetTeamHp(i) > 0){
			lose = false;
		}
	}
	return lose;
}