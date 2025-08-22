function Flag_Custom(){
	#macro FLAG_STATIC "static"
	var flag_static = new Flag_Storage();
	Flag_RegisterType(FLAG_STATIC,flag_static);
	Flag_CustomStatic();
	
	#macro FLAG_DYNAMIC "dynamic"
	var flag_dynamic = new Flag_Storage();
	Flag_RegisterType(FLAG_DYNAMIC,flag_dynamic);
	Flag_CustomDynamic();
	
	#macro FLAG_TEMP "temp"
	var flag_temp = new Flag_Storage();
	Flag_RegisterType(FLAG_TEMP,flag_temp,false);
	Flag_CustomTemp();
	
	#macro FLAG_INFO "info"
	var flag_info = new Flag_Storage();
	Flag_RegisterType(FLAG_INFO,flag_info);
	Flag_CustomInfo();
	
	#macro FLAG_SETTINGS "settings"
	var flag_settings = new Flag_Storage();
	Flag_RegisterType(FLAG_SETTINGS,flag_settings,false);
	Flag_CustomSettings();
	
	#macro FLAG_PLOT "plot"
	var flag_plot = new Flag_Storage();
	Flag_RegisterType(FLAG_PLOT,flag_plot);
	Flag_CustomPlot();
	
	#macro FLAG_DEMO "demo"
	var flag_demo = new Flag_Storage();
	Flag_RegisterType(FLAG_DEMO,flag_demo);
	Flag_CustomDemo();
}
