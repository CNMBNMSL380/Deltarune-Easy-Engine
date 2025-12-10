/// @description 事件
live;
Dr_Battle_SetEnemyName(_enemy_id,"赛利尔的人偶");



Dr_Battle_AddEnemyAct(_enemy_id,"行动1",,
function(){ //启动开始
	Dr_Battle_CallDialog("* 玩偶  14ATK 14DEF &  是一个可爱的玩偶")
	Dr_Battle_SetStageTimeMax(10)
},
function(){ //前启动
},
function(){ //执行之后
	
},
[] // 哪个能动的角色
);
Dr_Battle_AddEnemyAct(_enemy_id,"行动2",,
function(){ //启动开始
	
},
function(){ //前启动
	
},
function(){ //执行之后
	
},
[] // 哪个能动的角色
);