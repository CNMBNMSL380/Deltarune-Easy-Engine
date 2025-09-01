/// @description 创建 / INIT 
live;
/*
	-------------介绍-------------
	敌人创建之后执行
*/

Dr_Battle_SetEnemyName(_enemy_id,"敌人"+string(_enemy_id));

Dr_Battle_AddEnemyAct(_enemy_id,"查看","检查敌人的身体（？",
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
);

Dr_Battle_AddEnemyAct(_enemy_id,"抚摸",,
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
);

Dr_Battle_AddEnemyAct(_enemy_id,"击杀",,
function(){ //启动开始
	show_debug_message("ACT启动2");
	Dr_Battle_SetStageTimeMax(10)
	//不要填_enemy_id！！
	//因为再创建之后这个值不会随_enemy_id改变，这导致可能你删除第一个敌人
	//，然后再删除第二个后第二个还在但第三个消失了
	//！亲身经历！
	Dr_Battle_killEnemy(_enemy_id);
	
},,,
[] // 哪个能动的角色
);