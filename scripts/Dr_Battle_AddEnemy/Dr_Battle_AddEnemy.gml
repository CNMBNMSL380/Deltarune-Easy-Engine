// Script assets have changed for v2.3.0 see
//@arg 索引
//@description 用于添加敌人
function Dr_Battle_AddEnemy(SLOT,XX,YY,DEPTH = DEPTH_DR_BTL.CHAR,ENEMY ,
		ANIM = false , MOVE_X = XX , MOVE_Y = YY )
{	
	var enemyBase = new Dr_Battle_EnemyBase(SLOT);
	
	var Main = dr_battle_main;
	var inst = instance_create_depth(XX,YY,DEPTH,ENEMY);
	inst._enemy_id = SLOT;
	
	
	var enemy_map = ds_map_create();
	ds_list_add(Main._enemy_event,enemy_map);
	
	if(ANIM){
		//移动敌人到指定位置
		Anim_Create(inst,"x",0,0,XX,MOVE_X - XX,25);
		Anim_Create(inst,"y",0,0,YY,MOVE_Y - YY,25);
	}
	
	enemyBase.setIns(inst);	
	Main._enemy[SLOT] = enemyBase;
	
	// 初始化数据
	with(inst){event_user(0);}
	Dr_Battle_EnemyFunc(SLOT,DR_BATTLE_ENEMY.INIT,[SLOT]);
	
	return enemyBase;
}
