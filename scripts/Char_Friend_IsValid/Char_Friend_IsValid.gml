// Script assets have changed for v2.3.0 see
function Char_Friend_IsValid(){
	var STRC=argument[0];

	if(object_exists(STRC)){
		return ((STRC==char_friend||Object_GetBaseParent(STRC)==char_friend));
	}else{
		return false;
	}
}