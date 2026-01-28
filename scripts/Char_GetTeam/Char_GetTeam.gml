// Script assets have changed for v2.3.0 see

/// -------获取团队里的队友

// --获取所有
function Char_GetTeam(){
	return Flag_Get(FLAG_PLAYER_TEAM,"team");
}
// --通过ID获取
function Char_GetTeamByID(SLOT){
	if(SLOT < Char_GetTeamLenght()){
		return Flag_Get(FLAG_PLAYER_TEAM,"team")[SLOT];
	}
}
function Char_GetTeamLenght(){
	return array_length(Char_GetTeam());
}
// --通过NAME获取
function Char_GetTeamByName(NAME){
	for(var i = 0; i < Char_GetTeamLenght(); i++){
		var strc = Char_GetTeamByID(i);
		if(strc !=noone){
			var strc_name = strc.char_name;
			if(NAME = strc_name){
				return strc;
			}
		}
	}
	return false;
}
function Char_GetTeamObjToArray(){
	var arr = [];
	for(var i =0 ; i< Char_GetTeamLenght() ; i++){
		var strc = Char_GetTeamByID(i);
		var obj = strc.char_obj;
		array_push(arr , obj);
	}
	return arr;
}
