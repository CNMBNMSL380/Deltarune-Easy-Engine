/// @description 事件
live;
instance_create_depth(320,320,0,dr_battle_board);
var animTime = 35
Anim_Create(dr_battle_board,"up",0,0,0,65,animTime);
Anim_Create(dr_battle_board,"down",0,0,0,65,animTime);
Anim_Create(dr_battle_board,"left",0,0,0,65,animTime);
Anim_Create(dr_battle_board,"right",0,0,0,65,animTime);
Anim_Create(dr_battle_board,"alpha_frame",0,0,0,1,animTime);
Anim_Create(dr_battle_board,"alpha_bg",0,0,0,1,animTime);
Anim_Create(dr_battle_board,"angle",0,0,270,-270,animTime);


//Anim_Create(dr_battle_board,"up",0,0,65,-65,50);
//Anim_Create(dr_battle_board,"down",0,0,65,-65,50);
//Anim_Create(dr_battle_board,"left",0,0,65,-65,50);
//Anim_Create(dr_battle_board,"right",0,0,65,-65,50);
//Anim_Create(dr_battle_board,"alpha_frame",0,0,1,-1,50);
//Anim_Create(dr_battle_board,"alpha_bg",0,0,1,-1,50);
//Anim_Create(dr_battle_board,"angle",0,0,0,270,50);



alarm[0] = 1;