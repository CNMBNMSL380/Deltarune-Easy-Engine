// Script assets have changed for v2.3.0 see
function Dr_Draw(FUNCTION = function(){}){
	/*
		这是用于绘制在DR战斗系统表面的方法，
		只有使用这个你才能以相机或窗口的大小来决定定位绘制贴图
		然后，最好不要在里面写一些与与绘制无关的代码，因为GMS2的表面很脑抽
		如果往里面些一大堆if可能会造成大量的优化丢失，除非特殊需要（仅理论猜测，不过我还是不建议你写绘制无关的）
	*/
	
	if(instance_exists(dr_battle_main)){
		if(surface_exists(Dr_battle_GetMainSurface())){
			surface_set_target(Dr_battle_GetMainSurface()){
				FUNCTION();
			}surface_reset_target()
			return true;
		}
	}
	return false;
}