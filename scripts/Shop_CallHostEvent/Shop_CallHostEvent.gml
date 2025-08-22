///@arg event
function Shop_CallHostEvent(){
	var EVENT=argument[0];
	var INST=Shop_GetHost(Flag_Get(FLAG_TEMP,"shop"));
	if(instance_exists(INST)){
		with(INST){
			event_user(EVENT);
		}
	}
	return true;
}