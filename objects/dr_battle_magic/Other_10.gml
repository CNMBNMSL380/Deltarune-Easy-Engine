/// @description 魔法事件
live;

 

show_message("你释放了魔法");
MyAlarm_Add("magic " +string(random(50)) ,function(){ 
	Dr_Battle_CallDialog("你使用了魔法，但什么事没发生");
},10)