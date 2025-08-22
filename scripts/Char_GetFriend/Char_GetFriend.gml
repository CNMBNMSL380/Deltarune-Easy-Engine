// Script assets have changed for v2.3.0 see

// ---------获取朋友列表中的角色

// --获取所有
function Char_GetFriend(){
	return Flag_Get(FLAG_STATIC,"friend");
}
function Char_GetFriendLenght(){
	return array_length(Char_GetFriend());
}
// --通过ID获取
function Char_GetFriendByID(SLOT){
	return Flag_Get(FLAG_STATIC,"friend")[SLOT];
}
// --通过NAME获取
function Char_GetFriendByName(NAME){
	for(var i = 0; i < array_length(Char_GetFriend()); i++){
		var strc = Char_GetFriendByID(i);
		var strc_name = strc.char_name;
		if(NAME = strc_name){
			return strc;
		}
	}
	return noone;
}
function Char_GetFriendObjToArray(){
	var arr = [];
	for(var i =0 ; i< array_length(Char_GetFriend()) ; i++){
		var strc = Char_GetFriendByID(i);
		var obj = strc.char_obj;
		arr[i] = obj
	}
	return arr;
}