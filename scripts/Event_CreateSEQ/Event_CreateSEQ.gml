// Script assets have changed for v2.3.0 see
function Event_CreateSEQ(ROOM = room){
	//var SEQ = ds_list_create()
	var SEQ = {
		mode : 0,
		seq : ds_map_create(),
		_room : ROOM,
		auto_clear : true
	}
	ds_list_add(global._event_list,SEQ);
	return SEQ;
}