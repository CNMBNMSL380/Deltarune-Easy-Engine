/// @description 魔法事件
live;

show_message("你释放了魔法");
var magicEvent = function(){ Dr_Battle_CallDialog("你使用了魔法，但什么事没发生");}
MyAlarm_Add(string("magic " + random(50) ) , magicEvent,10)