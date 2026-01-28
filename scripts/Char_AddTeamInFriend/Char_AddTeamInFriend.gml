// Script assets have changed for v2.3.0 see
// ！-- 尚未完成和测试 -- ！
function Char_AddTeamInFriend(FRIEND,OLD_FRIEND,NEW_FRIEND){
	//用于从friend里加进到team里的队友
	var arrFriend = Char_GetFriend();
	var arrTeam = Char_GetTeam();
	if(array_contains(arrTeam,OLD_FRIEND) and array_concat(arrFriend,FRIEND)){
		var delFriendArr = array_delete(arrFriend,array_get_index(arrFriend,FRIEND),1);	
		var delTeamArr = array_delete(arrTeam,array_get_index(arrTeam,FRIEND),1);	
				
	}
}