/// @description 收缩 / 张开框动画
live;
var animTime = 25
if(anim_mod){
	in_anim = true;
	Anim_Destroy(dr_battle_board)
	
	var dir_str = ["up","down","left","right"];
	var size_str = [];
	
	for(var i=0 ; i<4 ; i++){
		Anim_Create(dr_battle_board,dir_str[i],0,0,0,65,animTime);
	}
	Anim_Create(dr_battle_board,"alpha_frame",0,0,0,1,animTime);
	//Anim_Create(dr_battle_board,"alpha_bg",0,0,0,1,animTime);
	Anim_Create(dr_battle_board,"angle",0,0,270,-270,animTime);
	
	Anim_Create(dr_battle_board,"in_anim",0,0,in_anim,false - in_anim , 1,animTime)
	anim_mod = false;
	
	alarm[1]=1
}
else if(!anim_mod){
	Anim_Destroy(dr_battle_board)
	in_anim = true;
	
	Anim_Create(dr_battle_board,"up",0,0,65,-65,animTime);
	Anim_Create(dr_battle_board,"down",0,0,65,-65,animTime);
	Anim_Create(dr_battle_board,"left",0,0,65,-65,animTime);
	Anim_Create(dr_battle_board,"right",0,0,65,-65,animTime);
	Anim_Create(dr_battle_board,"alpha_frame",0,0,1,-1,animTime);
	//Anim_Create(dr_battle_board,"alpha_bg",0,0,1,-1,animTime);
	Anim_Create(dr_battle_board,"angle",0,0,0,270,animTime);	
	Anim_Create(dr_battle_board,"in_anim",0,0,in_anim,false - in_anim , 1,animTime)
	anim_mod = true;
	
	alarm[1]=1
}

