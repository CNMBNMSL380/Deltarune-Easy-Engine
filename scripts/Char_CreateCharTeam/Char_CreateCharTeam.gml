// Script assets have changed for v2.3.0 see
function Char_CreateCharTeam(){
	var arr = [];
	for(var i = Char_GetTeamLenght() -1 ; i > 0 ; i--){
		var strc = Char_GetTeamByID(i);
		var obj = strc.char_obj;
		array_push(arr , obj);
	}
	return arr;
}