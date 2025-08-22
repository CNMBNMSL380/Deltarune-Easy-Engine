/// @description 事件
live;

dam_num = -100;
font = dr_battle_main._font_dam;

anim_x = 0;
anim_y = 0;

sca_x = 2;
sca_y = 0.1;

Anim_Create(id,"sca_y",0,0,0.1,1.9,5,10)
Anim_Create(id,"anim_x",1,1,0,50,50)
Anim_Create(id,"anim_y",ANIM_TWEEN.BOUNCE,1,0,50,50)

var st = string(random(10))
MyAlarm_Add(st,function(){
	Anim_Create(id,"anim_y",1,1,50,-50,50)
	Anim_Create(id,"image_alpha",0,0,1,-1,50)
},100)

MyAlarm_Start(st)