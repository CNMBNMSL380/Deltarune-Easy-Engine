// Script assets have changed for v2.3.0 see
function Encounter_Dr_Base() constructor{
	// -------- 不可修改设定
	e_battle_mod = "DR";		// 不可修改
	e_id = 0;					// 战斗ID，必须唯一，如果有重复则会被覆盖，不可修改
	// --------  基础必要设定
	e_enemy = [];				// 战斗里敌人实例列表
	e_enemy_max = 3;			// 战斗敌人的最大数量，目前只能3个人，否则游戏会出现非致命错误（
	e_menu_dialog = "";			// 开局菜单对话框文本
	e_battle_bgm = noone;		// BGM,如果没有则没有音乐
	e_ow_isPause_bgm = true;	// 启动战斗后是否关闭世界音乐
	e_friend = [];				// 你的同伴实例列表，如果为空则默认使用当前Team队列
	e_friend_position = [[120,120],[120,220],[120,300]];	// 你的同伴位置列表，格式为[[x1,y1],[x2,y2],...]
	e_enemy_position = [[560,120],[500,220],[560,320]];		// 敌人位置列表，格式为[[x1,y1],[x2,y2],...]

	// 灵魂设定
	e_soul_x = 0;
	e_soul_y = 0;
	e_soul_inst = 0; //如果为0，则使用默认红魂，否则使用这个实例的红魂

	// 战斗背景设定
	e_battle_bg = true;
	e_battle_bg_inst = 0; // 如果为0，则使用默认背景，否则使用这个实例的背景
	// 开局后是否全体恢复血量
		e_start_full_hp = false;
	// 开局是否全体快速位移进入战斗
		e_fast_enter = false;
	// 开局敌人是否以更快的速度进入战斗位置
		e_fast_enter_enemy = false;  // 如果e_fast_enter为true, 则这个变量无效
	// 开局是否直接进入战斗界面
		e_direct_enter = false;
	// 开局是否可以自行寻找敌人
		e_enemy_seek = true;
	// 敌人随机列表
		e_enemy_random_list = [];  
	/*
		可以设置静态敌人，比如说你设置A,B,C之后，房间有A,B,C,D,E 的敌人，
		你触发了A的敌人后，就会根据这个变量设置，提取A,B,C的敌人，随机一个出来，
		而不是从A,B,C,D,E中随机一个出来。如果由A,A,B,B这些重复敌人时，同样也会抽取这些重复敌人
		如果触发了D等其他不在列表的敌人，则继续从A,B,C抽取
		如果房间没有列表里的敌人，则只有一个敌人
		如果为空，则从房间里所有敌人中随机抽取
		如果e_enemy_seek 为false, 则这个变量无效
	*/
	
	// 敌人不可重复变量
		e_enemy_no_repeat = false;
	/*
		如果为true,则抽取房间里的敌人时，不可重复抽取
	*/
	// 敌人是否可以饶速
		e_enemy_can_spare = false;
	// 敌人是否可以安抚
		e_can_pacify = true;
	// 如果结束，剩余敌人是否回到原来位置
		e_enemy_return = false; // 如果为true, 则战斗结束后，剩余敌人会回到原来位置，否则战斗结束后会被销毁
}