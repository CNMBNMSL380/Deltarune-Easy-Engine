// Script assets have changed for v2.3.0 see
function Input_Step(){
	LController_h = gamepad_is_connected(0) ? gamepad_axis_value(0, gp_axislh) : 0;
	LController_v = gamepad_is_connected(0) ? gamepad_axis_value(0, gp_axislv) : 0;

	RController_h = gamepad_is_connected(0) ? gamepad_axis_value(0, gp_axisrh) : 0;
	RController_v = gamepad_is_connected(0) ? gamepad_axis_value(0, gp_axisrv) : 0;
	
	var VAL = 0.8   //界限，从0.1到1，建议0.5以上
//////RIGHT
	if (LController_h > VAL) { //RIGHT   
		//点击
		if(global._gmu_input_LController_axis_pressed[1] = 0){
			keyboard_key_press(vk_right)
			global._gmu_input_LController_axis_pressed[1] = 1
		}
	}
	else if(LController_h <= VAL){
		//点击 
		if(global._gmu_input_LController_axis_pressed[1] = 1){
			show_debug_message("右"+string(random(1))+"松开")
			keyboard_key_release(vk_right)
			global._gmu_input_LController_axis_pressed[1] = 2
		}
		global._gmu_input_LController_axis_pressed[1] = 0
		
	}
//////LEFT
	if (LController_h < -VAL) { ///////LEFT  
		//点击
		if(global._gmu_input_LController_axis_pressed[0] = 0){
			keyboard_key_press(vk_left)
			global._gmu_input_LController_axis_pressed[0] = 1
		}
	}
	else if(LController_h >= -VAL){
		//点击 
		if(global._gmu_input_LController_axis_pressed[0] = 1){
			show_debug_message("左"+string(random(0))+"松开")
			keyboard_key_release(vk_left)
			global._gmu_input_LController_axis_pressed[0] = 2
		}
		global._gmu_input_LController_axis_pressed[0] = 0		
	}
///////////////////////////////
/////=====================>      垂直         <=====================
//////DOWN
	if (LController_v > VAL) { //DOWN
		//点击
		if(global._gmu_input_LController_axis_pressed[3] = 0){
			keyboard_key_press(vk_down)
			global._gmu_input_LController_axis_pressed[3] = 1
		}
	}
	else if(LController_v <= VAL){
		//点击 
		if(global._gmu_input_LController_axis_pressed[3] = 1){
			show_debug_message("下"+string(random(1))+"松开")
			keyboard_key_release(vk_down)
			global._gmu_input_LController_axis_pressed[3] = 2
		}
		global._gmu_input_LController_axis_pressed[3] = 0
		
	}
//////UP
	if (LController_v < -VAL) { ///////UP  
		//点击
		if(global._gmu_input_LController_axis_pressed[2] = 0){
			keyboard_key_press(vk_up)
			global._gmu_input_LController_axis_pressed[2] = 1
		}
	}
	else if(LController_v >= -VAL){
		//点击 
		if(global._gmu_input_LController_axis_pressed[2] = 1){
			show_debug_message("上"+string(random(0))+"松开")
			keyboard_key_release(vk_up)
			global._gmu_input_LController_axis_pressed[2] = 2
		}
		global._gmu_input_LController_axis_pressed[2] = 0		
	}
}