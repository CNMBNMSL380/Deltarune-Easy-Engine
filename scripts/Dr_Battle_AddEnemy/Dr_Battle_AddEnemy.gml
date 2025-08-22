// Script assets have changed for v2.3.0 see
function Dr_Battle_AddEnemy(SLOT,XX,YY,DEPTH = DEPTH_DR_BTL.CHAR,ENEMY ,
		ANIM = false , MOVE_X = XX , MOVE_Y = YY , ADD_INS = true)
{	
	var Main = dr_battle_main
	var inst = instance_create_depth(XX,YY,DEPTH,ENEMY);
	inst._enemy_id = SLOT
	if(ANIM){
		//移动敌人到指定位置
		Anim_Create(inst,"x",0,0,XX,MOVE_X - XX,25)
		Anim_Create(inst,"y",0,0,YY,MOVE_Y - YY,25)
	}
	
	if(ADD_INS){
		Main._enemy[SLOT].setIns(inst);	
	}
	
	Dr_Battle_CallEnemyEvent(0,SLOT)
	
	return inst;
}