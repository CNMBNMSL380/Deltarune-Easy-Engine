// Script assets have changed for v2.3.0 see
function Char_SetValue(CHAR_CLASS = 0,CHAR,ELEMENT,VALUE){
	
	//如果Type = -1 ， 则自动搜索朋友列表和团队列表
	if(CHAR_CLASS == 0){
		//朋友
		if(is_string(CHAR)){
			var strc = Char_GetFriendByName(CHAR);
		}
		else if(is_real(CHAR)){
			var strc = Char_GetFriendByID(CHAR);
		}
		else{
			return false	
		}
		
		var value = Char_SetValueType(strc,ELEMENT,VALUE);		
		return value;
		
	}
	else if(CHAR_CLASS  == 1){
		//团队
		if(is_string(CHAR)){
			var strc = Char_GetTeamByName(CHAR);
		}
		else if(is_real(CHAR)){
			var strc = Char_GetTeamByID(CHAR);
		}
		else{
			return false	
		}
		
		var value = Char_SetValueType(strc,ELEMENT,VALUE);			
		return value;
	}
	else{
		//首先先检测团队里的，团队如果找不到则检测好友，否则返回underfine	
		if(is_string(CHAR)){
			if(Char_GetTeamByName(CHAR) != noone){
				var strc = Char_GetTeamByName(CHAR);
			}
			else if(Char_GetFriendByName(CHAR) != noone){
				var strc = Char_GetFriendByName(CHAR);
			}
			else{
				return false	
			}
			
			var value = Char_SetValueType(strc,ELEMENT,VALUE);			
			return value;
		}
		else if(is_real(CHAR)){
			if(Char_GetTeamByID(CHAR) != noone){
				var strc = Char_GetTeamByID(CHAR);
			}
			else if(Char_GetFriendByID(CHAR) != noone){
				var strc = Char_GetTeamByID(CHAR);
			}
			else{
				return false	
			}
			
			var value = Char_SetValueType(strc,ELEMENT,VALUE);			
			return value;
		}
	}
}