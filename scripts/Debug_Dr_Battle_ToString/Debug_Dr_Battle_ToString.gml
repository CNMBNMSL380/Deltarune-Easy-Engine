// Script assets have changed for v2.3.0 see

function Debug_StageToString(STRING){
	switch(STRING){
		//------------阶段--------------
		case DR_BATTLE_STAGE.START_BATTLE:
			return "准备战斗";
		case DR_BATTLE_STAGE.PLAYER:
			return "玩家回合";
		case DR_BATTLE_STAGE.ACT:
			return "ACT回合";
		case DR_BATTLE_STAGE.MAGIC:
			return "魔法回合";
		case DR_BATTLE_STAGE.MERCY:
			return "仁慈回合";
		case DR_BATTLE_STAGE.FIGHT:
			return "攻击回合";
		case DR_BATTLE_STAGE.DIALOG:
			return "对话回合";
		case DR_BATTLE_STAGE.BEFORE_TURN:
			return "回合开始前";
		case DR_BATTLE_STAGE.DIALOG_TURN:
			return "回合对话";
		case DR_BATTLE_STAGE.START_TURN:
			return "开始敌人回合";
		case DR_BATTLE_STAGE.IN_TRUN:
			return "回合里";
		case DR_BATTLE_STAGE.END_TURN:
			return "结束敌人回合";
		case DR_BATTLE_STAGE.RESET:
			return "重置回合";
		case DR_BATTLE_STAGE.END_BATTLE:
			return "战斗结束";
		case DR_BATTLE_STAGE.BLACK:
			return "返回";
		default:
			return "";
		break
		
	}
}
function Debug_PlayerMenuToString(STRING){
	switch(STRING){
		//----------玩家设置------------
		case DR_BATTLE_PLAYERMENU.BUTTON:
			return "按钮阶段";
		case DR_BATTLE_PLAYERMENU.CHOICE_ENEMY:
			return "选择敌人";
		case DR_BATTLE_PLAYERMENU.CHOICE_CLASS:
			return "选择行为类";
		case DR_BATTLE_PLAYERMENU.CHOICE_MAGIC:
			return "选择魔法";
		case DR_BATTLE_PLAYERMENU.CHOICE_ITEM:
			return "选择药品";
		case DR_BATTLE_PLAYERMENU.CHOICE_FRIEND:
			return "选择队友";
		default:
			return "";
			
	}
}
function Debug_ButtonToString(STRING){
	switch(STRING){
		//----------玩家设置------------
		case 0:
			return "战斗";
		case 1:
			return "行动 / 魔法";
		case 2:
			return "药品";
		case 3:
			return "仁慈";
		case 4:
			return "防御";
		default:
			return "*空";
		
	}
}