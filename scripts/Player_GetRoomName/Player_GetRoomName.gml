///@arg room
function Player_GetRoomName() {
	var ROOM=argument[0];

	var name="";

	switch(ROOM){
		case room_ruins_5:
			name=Lang_GetString("save.ruins.5.room");
			break;
		case room_ruins_8:
			name=Lang_GetString("save.ruins.8.room");
			break;
		case room_ruins_11:
			name=Lang_GetString("save.ruins.11.room");
			break;
		case room_ruins_15:
			name=Lang_GetString("save.ruins.15.room");
			break;
		case room_ruins_17:
			name=Lang_GetString("save.ruins.17.room");
			break;
		case room_ruins_18_2:
			name=Lang_GetString("save.ruins.18.2.room");
			break;
		default:
			if(room_exists(ROOM)){
				name=room_get_name(ROOM);
			}
			else{
				name="--";
			}
			break;
	}
	return name;
}
