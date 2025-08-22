///@arg name
function Player_SetName() {
	var NAME=argument[0];

	var result=Flag_Set(FLAG_STATIC,"name",NAME);

	return result;


}
