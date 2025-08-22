/// @description 事件
live;

// Inherit the parent event
//event_inherited();

//Item_Add(item_wFlower_pie);
//Item_Add(item_wFlower_tea);

MyAlarm_Add("1",function(){
	show_message("恭喜你抚摸到了塞莉儿~")
},1);

MyAlarm_Start("1");