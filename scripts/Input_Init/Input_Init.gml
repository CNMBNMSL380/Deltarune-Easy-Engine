function Input_Init() {
	//GMU_Input v1.1.5

	global._gmu_input=ds_map_create();
	global._gmu_input_state_override=ds_map_create();
	global._gmu_input_LController_axis_pressed = [0,0,0,0];//1:left  2:right  3:up  4:down

	enum INPUT_TYPE{
		KEYBOARD,
		GAMEPAD,
		MOUSE,
		GAMEPAD_AXIS
	};

	enum INPUT_STATE{
		NULL,
		HELD,
		PRESSED,
		RELEASED
	};

	return true;


}