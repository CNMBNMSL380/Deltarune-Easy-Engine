function Flag_ObjectValid(obj){
	if(Item_IsValid(Get(obj))){
		return true;
	}
	else if(Phone_IsValid(Get(obj))){
		return true;
	}
	else if(Char_Friend_IsValid(Get(obj))){
		return true;
	}
	return false;
}