// Script assets have changed for v2.3.0 see
function Char_SetTeam(){
	var SLOT = argument[0];
	var FRIEND = argument[1];
	
	if(Char_Friend_IsValid(FRIEND)){
		var arr=Flag_GetStorage(FLAG_STATIC).Get("team");
		
		arr[SLOT] = FRIEND;
		Flag_GetStorage(FLAG_STATIC).Set("team",arr);
		
		return true
	}
	return false;
}