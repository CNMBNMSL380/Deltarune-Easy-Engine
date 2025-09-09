live

Anim_Init();

// 声明DLL函数并获取ID
global.input_fix_switch = external_define("./img/Static/bin/InputFix.dll", "SwitchToEnglishLayout", dll_cdecl, ty_real, 0);
global.input_fix_restore = external_define("./img/Static/bin/InputFix.dll", "RestoreOriginalLayout", dll_cdecl, ty_real, 0);

// 立即切换输入法（可选）
//external_call(global.input_fix_switch);

Font_Init();
Font_AddFont("FH16","font_classic_16px.ttf",12);
Font_AddFont("FH16_2","font_classic_16px (3).ttf",10);
Font_AddFont("FH12","font_classic_12px.ttf",9);
Font_AddFont("FH12_2","font_classic_12px (2).ttf",9);

MyAlarm_init();


Input_Init();
Input_Bind(INPUT.CONFIRM,INPUT_TYPE.KEYBOARD,0,vk_enter);
Input_Bind(INPUT.CONFIRM,INPUT_TYPE.KEYBOARD,0,ord("Z"));
Input_Bind(INPUT.CANCEL,INPUT_TYPE.KEYBOARD,0,vk_shift);
Input_Bind(INPUT.CANCEL,INPUT_TYPE.KEYBOARD,0,ord("X"));
Input_Bind(INPUT.MENU,INPUT_TYPE.KEYBOARD,0,vk_control);
Input_Bind(INPUT.MENU,INPUT_TYPE.KEYBOARD,0,ord("C"));
Input_Bind(INPUT.UP,INPUT_TYPE.KEYBOARD,0,vk_up);
Input_Bind(INPUT.DOWN,INPUT_TYPE.KEYBOARD,0,vk_down);
Input_Bind(INPUT.LEFT,INPUT_TYPE.KEYBOARD,0,vk_left);
Input_Bind(INPUT.RIGHT,INPUT_TYPE.KEYBOARD,0,vk_right);

Lang_Init();
Lang_LoadList();
Lang_LoadString(0);
Lang_LoadSprite(0);
Lang_LoadFont(0);

Flag_Init();	

Encounter_Init();

BGM_Init();

Dialog_Init();

Demo_Init();

Shop_Init();

instance_create_depth(0,0,0,camera);
instance_create_depth(0,0,0,fader);
instance_create_depth(0,0,0,border);
instance_create_depth(0,0,0,closed_captions);
instance_create_depth(0,0,0,obj_gmlive)
//instance_create_depth(0,0,0,_CRT_ins);

application_surface_draw_enable(false);

//Border_SetEnabled(true);

//show_debug_overlay(true);
//show_message(Char_GetFriendHp(0));
//show_message(Char_GetFriendByID(0).Get("name"));
//show_message(Char_GetFriendByID(0).Get_Magic_Function(0)());
//show_message(Char_GetFriendByID(0).Get_Magic_UseTp(0));

randomize();

room_goto_next();

Resolution_Set(1,false)

Char_SetFriend();
