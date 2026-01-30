/// @description 创建 / INIT 
live;
/*
	-------------介绍-------------
	敌人创建之后执行
*/



//show_message(Dr_Battle_GetEnemyEvent(_enemy_id,"create"));
Dr_Battle_SetEnemyName(_enemy_id,"敌人"+string(_enemy_id));
Dr_Battle_AddEnemyEvent(_enemy_id,DR_BATTLE_ENEMY.INIT,function(){
	// -------- 设置名字
	Dr_Battle_SetEnemyName(_enemy_id,"敌人"+string(_enemy_id));
	// -------- 设置ACT事件
	{Dr_Battle_AddEnemyAct(_enemy_id,"查看","检查敌X人的身体（？",
	function(){ //启动开始
		/*
			在执行完所有ACT启动前事件之后，这个事件就会轮流执行，
			默认100秒时间，如果100秒过后对话已经结束则继续执行下一个
			直到所有ACT事件执行完
		*/
		Dr_Battle_CallDialog("* 玩偶  14ATK 14DEF &  是一个可爱的玩偶",,3)
		instance_create_depth(x-120,y-50,0,dr_battle_ui_dialogBox);
	
		Dr_Battle_SetStageTimeMax(10)
	
	},	
	function(){ //启动前	-- 进入ACT回合后全局调用
		/*
			！要注意一点！
			因为此事件是在进入act阶段之后，只要此ACT被选中
			会在进入ACT阶段前直接执行，而不是轮流执行，也意味着
			Dr_Battle_SetActDialog最好别放在这，要不然这个对话会被覆盖
		*/
		show_debug_message("准备启动1");
	
	
	
	
	},
	function(){ //执行之后
		/*
			和启动前事件差不多，唯一的区别是这个是ACT阶段过后才执行，
			也是一样只要被选择就会直接执行
		*/
	},
	[] // 哪个能动的角色
	,0);
	}
	{Dr_Battle_AddEnemyAct(_enemy_id,"抚摸",,
	function(){ //启动开始
		show_debug_message("ACT启动2");
		Dr_Battle_CallDialog("* 你抚摸了玩偶，没有反应，但你感觉很开心")
	},
	function(){ //前启动
		show_debug_message("准备启动2");
	},
	function(){ //执行之后
	
	},
	[] // 哪个能动的角色
	,0);
	}
	{Dr_Battle_AddEnemyAct(_enemy_id,"击杀",,
	function(){ //启动开始
		show_debug_message("ACT启动2");
		Dr_Battle_SetStageTimeMax(10)
		Dr_Battle_DestroyEnemy(_enemy_id);
	},,,
	[] // 哪个能动的角色
	,50);
	}
	{Dr_Battle_AddEnemyAct(_enemy_id,"设置TP",,
	function(){ //启动开始
		show_debug_message("ACT启动3");
		Dr_Battle_AddTp(50);
		Dr_Battle_SetStageTimeMax(1)	
	},,,
	[] // 哪个能动的角色
	,0);
	}
	{Dr_Battle_AddEnemyAct(_enemy_id,"一起抚摸~",,
	function(){ //启动开始
		show_debug_message("ACT启动3");
		Dr_Battle_AddTp(50);
		Dr_Battle_SetStageTimeMax(1)	
	},,,
	[dr_battle_char_susie,dr_battle_char_player] // 哪个能使用的角色
	,0);
	}
		
	/*	
		原UTE里的事件驱动是直接使用GMS自带的用户事件对，这意味着你只能设置固定的15个对象	
	而且调用事件还可能会出现bug，所以我直接把以用户事件驱动改成了用Function驱动，这样子灵
	活性提高，你也不必只能设置15个。
	
	*/	
	// --------- 设置战斗开始事件
	{Dr_Battle_AddEnemyEvent(_enemy_id,DR_BATTLE_ENEMY.BATTLE_START,function(SLOT){
		//show_message("战斗开始");
	})}
	// --------- 设置设置开始事件
	{Dr_Battle_AddEnemyEvent(_enemy_id,DR_BATTLE_ENEMY.MENU_START,function(SLOT){
		//show_message("设置开始");
	})}
	// --------- 设置设置交换事件
	{Dr_Battle_AddEnemyEvent(_enemy_id,DR_BATTLE_ENEMY.MENU_SWITCH,function(SLOT){
		
	})}
	// --------- 设置设置结束事件
	{Dr_Battle_AddEnemyEvent(_enemy_id,DR_BATTLE_ENEMY.MENU_END,function(SLOT){
		show_message("设置结束")
	})}
	// --------- 设置对话事件
	{Dr_Battle_AddEnemyEvent(_enemy_id,DR_BATTLE_ENEMY.DIALOG_CALL,function(SLOT){
		Dr_Battle_CallDialog("nmsl",,3)
	})}
	// --------- 设置敌人事件
	{Dr_Battle_AddEnemyEvent(_enemy_id,DR_BATTLE_ENEMY.HURT,function(SLOT){
		//show_message("敌人受伤："+ string(SLOT));
	})}
	// --------- 设置敌人摧毁事件
	{Dr_Battle_AddEnemyEvent(_enemy_id,DR_BATTLE_ENEMY.DELETE,function(SLOT){
		show_message("敌人被摧毁")
	})}
	// --------- 设置生成回合事件
	{Dr_Battle_AddEnemyEvent(_enemy_id,DR_BATTLE_ENEMY.CREATE_TURN,function(SLOT){
		if(_enemy_id == 0)
		instance_create_depth(0,0,0,dr_battle_turn);
		
	})}
	// --------- 设置回合结束事件
	{Dr_Battle_AddEnemyEvent(_enemy_id,DR_BATTLE_ENEMY.END_TURN,function(SLOT){
		show_message("回合结束")
	})}
	
})
