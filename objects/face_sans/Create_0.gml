/// @description 事件
live;

// Inherit the parent event
event_inherited();

//Custom
for(var i = 0; i<7 ; i++){
	idle_sprite[i]=spr_face_sans_0;
	idle_image[i]=i;
	idle_speed[i]=0;
	talk_sprite[i]=spr_face_sans_0;
	talk_image[i]=i;
	talk_speed[i]=0;
}