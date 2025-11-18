/// @description 事件
live;
/*
	思路：
	开局先生成基本的战斗角色和敌人角色，而这些角色都是独立的
	这就意味着战斗开始后地图里的角色会被隐藏
	同时为了性能将会关闭地图里的特效与动图渲染
	
	然后生成战斗UI，分别为基本的UI，TP值，队友类窗口
	Dr_battle_main用于整个战斗程序流程的控制，而
	Dr_battle_ui则用于绘制图案，同时用于生成并操控打字机
	Dr_battle_friendClass则是每个角色的信息，玩家回合时，需要设置好每个
	类的信息，比如：玩家回合时，你要给角色1设置战斗，流程是：战斗 - 敌人 - 完成
	最后结束对友军类的设置，轮到第二个友军类，以此循环
	如果第一个友军类一设置好，到第二个角色时，如果退回，则会触发友军类的清除事件，用于
	清除里面的所有属性，还有后面的友军类，最后在把控制权转交第一个友军类
	

*/

//主要表面
_surface_main = -1;

//储存敌人信息
_enemy = [];				// --------储存敌人结构对象
_enemy_btl_obj = [];		// --------用于储存敌人的物体，以便在动画生成
_enemy_ow_obj = [];			// --------用于ow的敌人，战斗结束后如果可以就选择
_enemy_name = [		];

//存储敌人事件
_enemy_event = ds_list_create();

//基本控制变量

_stage = DR_BATTLE_STAGE.START_BATTLE;					//阶段
//存储友军
_player_friend = [];									// 
_player_friend_ow_obj = [];								//用于ow的队友，战斗结束后调用
_player_friend_class = [];								//队友Class，用于设置UI
//友军基本信息
_player_menu = DR_BATTLE_PLAYERMENU.BUTTON;				//玩家设置
_player_button = 0;										//选择按钮
_player_friend_num = 0;									//选中队友编号

_player_choice_friend = 0;								//选中队友
_player_choice_enemy = 0;								//选择敌人					
_player_choice_act = 0;								//ACT类，选择要执行的类
_player_choice_magic = 0;								//魔法类，选择要执行的魔法
_player_choice_item = 0;								//物品类，选择要使用的物品
_player_item_choice_item = 0;
_player_item_choice_char = 0;

//决心信息
_player_soul_inst = noone;
_player_soul_start_x = 320;
_player_soul_start_y = 320;

//Fight储存


//储存准备对敌人进行进攻或行动的事件
_player_GoToEvent = [];						//储存用于玩家回合结束接下来要触发的事件

_player_act_event = [];						//在ACT阶段要触发的事件
_player_act_slot = 0;

_player_magic_event = [];
_player_magic_slot = 0;

_player_mercy_event = [];
_player_mercy_slot = 0;


_player_item_event = [];
_player_item_slot = 0;
_player_item_is_use = [];

_player_fight_slot = 0;


//每个阶段读秒结束后进入下一个阶段，下面是储存用于读秒变量
_stage_time = 0;
_stage_timeMax = 100;
_stage_timeSpeed = 1;
//TP
_player_tp = 50;


//基础对话
_dialogue_style = "{scale 2}{voice 1}{speed 2}{shadow true}{gui true}";
//_dialogue = "* Hodwy！我是可爱的野花！你可以叫我Nico！&* Hodwy！我是可爱的野花！你可以叫我Nico！&* Hodwy！我是可爱的野花！你可以叫我Nico！";
_dialogue = "* 你遇到了塞莉儿的玩偶，记得抚摸哦~";
//_dialogue = "";
_text_list = ["行动1","行动2","行动3","行动4","行动5"]; 

//战斗回合
_battle_board_inst = noone;
_battle_board_up_max = 65;
_battle_board_down_max = 65;
_battle_board_left_max = 65;
_battle_board_right_max = 65;

_battle_turn_num = 0;
_battle_turn_time_max = 100;
_battle_turn_time = 0;
_battle_turn_time_speed = 1;

//其他

game_win = false;
ow_obj = [];

_font_debug = Font_Get("FH16")
_font_dam = font_add_sprite_ext(spr_dr_battle_ui_damage_num,"1234567890-+%",true,1)

alarm[0] = 1


//调试器描边用的字体-可以忽视
scale = 1

spr_width = 20
spr_height = 20

border_size_x = 100;
border_size_y = 50;

sf_width = spr_width + 2*border_size_x;
sf_height = spr_height + 2*border_size_y;

sf = surface_create(sf_width, sf_height);


function switch_H(NUM,MIN,MAX,PUSH,SFX=true ,AUTO_RANGE = false , AUTO_NUM = 0){
	live;
	var UI = dr_battle_ui	
	if(Input_IsPressed(INPUT.RIGHT)){
		if((NUM + PUSH) < MAX){
			NUM += PUSH;		
		}
	}
	if(Input_IsPressed(INPUT.LEFT)){
		if((NUM - PUSH) > MIN){
			NUM -= PUSH;			
		}
		
	}
	if(Input_IsPressed(INPUT.RIGHT) or Input_IsPressed(INPUT.LEFT)){
		if(SFX){ audio_play_sound(snd_menu_switch,0,0); }
		if(AUTO_RANGE){
			if(NUM)
				with(UI){
					event_user(0)
				}
		}
	}
	return NUM;
}

function switch_V(NUM,MIN,MAX,PUSH,SFX=true , AUTO_RANGE = false){
	live;
	var UI = dr_battle_ui
	if(Input_IsPressed(INPUT.DOWN) or Input_IsPressed(INPUT.UP)){
		if(SFX){ audio_play_sound(snd_menu_switch,0,0); }
		if(AUTO_RANGE){
			with(UI){
				event_user(0)
			}
		}
	}
	if(Input_IsPressed(INPUT.DOWN)){
		if((NUM + PUSH) < MAX){
			NUM += PUSH;
		}
	}
	if(Input_IsPressed(INPUT.UP)){
		if((NUM - PUSH) > MIN){
			NUM -= PUSH;
		}
	}
	//if(Input_IsPressed(INPUT.DOWN)){
	//	if(NUM < MAX){
	//		NUM += PUSH;
	//	}
	//}
	//if(Input_IsPressed(INPUT.UP)){
	//	if(NUM > MIN){
	//		NUM -= PUSH;
	//	}
	//}
	return NUM;
}
function add_Enemy(ST_X , ST_Y , DEPTH , ENEMY , ANIM , EN_X = 640-60 , EN_Y){
	var inst = instance_create_depth(ST_X , ST_Y , DEPTH , ENEMY);
	if(ANIM){
		Anim_Create(inst,"x" , 0 , 0 ,ST_X , EN_X - ST_X , 25);
		Anim_Create(inst,"y" , 0 , 0 ,ST_Y , EN_Y - ST_Y , 25);
	}
	return inst;
}
function get_EnemyActName(){
	var ActName = []; 
	for(var i=0; i< array_length(_enemy_act) ; i++){
		for(var j=0; j<array_length(_enemy_act) ; j++){
			if(_enemy_act[i][j].enemy_id = _player_choice_enemy){
				//show_message(_enemy_act[i][j]);
				array_push(ActName,_enemy_act[i][j].act_name)
			}
		}
	}
	return ActName
}
function get_MagicName(){
	
}
