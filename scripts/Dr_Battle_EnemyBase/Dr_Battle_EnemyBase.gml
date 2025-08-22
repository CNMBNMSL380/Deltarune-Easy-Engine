// Script assets have changed for v2.3.0 see

function Dr_Battle_EnemyBase(SLOT,INST = noone,OWINS = noone) constructor{
	enemy_slot = SLOT ;
	enemy_ins = INST;
	enemy_ins_ow = OWINS;
	enemy_name = "";
	enemy_atk = 10;
	enemy_Def = 10;
	enemy_act = [];
	/*m
		{
			act_name : "行动1" , //行动名字
			act_degin_event : function(){} , //选择到敌人后做出反应
			act_run_event : function(){} ,	//轮到行动回合后执行
			act_end_event : function(){} ,	//行动回合之后执行
			act_canDoChar : []	//哪个角色可以使用这个
		}
	*/
	function setSlot(SLOT){
		enemy_slot = INST;
	}
	function getSlot(){
		return enemy_slot;
	}
	function setIns(INST){
		enemy_ins = INST;
	}
	function getIns(){
		return enemy_ins;
	}
	function setName(NAME){
		enemy_name = NAME;
	}
	function getName(){
		return enemy_name;
	}
	function setAtk(ATK){
		enemy_atk = ATK;
	}
	function getAtk(){
		return enemy_atk;
	}
	function setDef(DEF){
		enemy_def = DEF;
	}
	function getDef(){
		return enemy_Def;
	}
	function addAct(SLOT,ACTNAME,INFO,EVENT = function(){},BEGIN_EVENT = function(){} , END_EVENT = function(){} , CAN_DO_CHAR = []){
		var act_strc = 
		{
			act_slot : SLOT,
			act_name : ACTNAME ,				//行动名字
			act_info : INFO,					//行动介绍
			act_run_event : EVENT ,				//轮到行动回合后执行
			act_begin_event : BEGIN_EVENT ,		//选择到敌人后做出反应
			act_end_event : END_EVENT ,			//行动回合之后执行
			act_canDoChar : CAN_DO_CHAR			//哪个角色可以使用这个
		}
		array_push(enemy_act,act_strc);
		
		return true;
		
	}
	function getAct(SLOT){
		if(SLOT < array_length(enemy_act)){
			return enemy_act[SLOT];
		}
	}
	function getActAll(){
		return enemy_act;
	}
	function getActName(SLOT){
		if(SLOT < array_length(enemy_act)){
			//show_message(getAct(SLOT).act_name)
			return getAct(SLOT).act_name;
		}	
	}
	function getActEvent(SLOT,TYPE = 0){
		if(TYPE = 0){
			return getAct(SLOT).act_run_event;
		}
		else if(TYPE == 1){
			return getAct(SLOT).act_begin_event
		}
		else if(TYPE == 2){
			return getAct(SLOT).act_end_event;
		}
	}
	function setActName(SLOT,NAME){
		enemy_act[SLOT].act_name = NAME;	
	}
	function setActEvent(SLOT,EVENT = function (){},TYPE = 0){
		if(TYPE == 0){
			enemy_act[SLOT].act_run_event = EVENT;	
		}
		else if(TYPE == 1){
			enemy_act[SLOT].act_begin_event = EVENT;	
		}
	}
}