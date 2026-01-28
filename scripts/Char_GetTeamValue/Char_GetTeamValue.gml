// Script assets have changed for v2.3.0 see

// ---------获取队伍列表中的角色的属性（全部通过Char_GetValue方法）

function Char_GetTeamName(SLOT){
	return Char_GetValue(1, SLOT - 1, "name");
}
function Char_GetTeamObj(SLOT){
    return Char_GetValue(1, SLOT, "obj");
}
function Char_GetTeamBattleObj(SLOT){
    return Char_GetValue(1, SLOT, "btlObj");
}
function Char_GetTeamHp(SLOT){
    return Char_GetValue(1, SLOT, "hp");
}
function Char_GetTeamMaxHp(SLOT){
    return Char_GetValue(1, SLOT, "maxhp");
}
function Char_GetTeamAtk(SLOT){
    return Char_GetValue(1, SLOT, "atk");
}
function Char_GetTeamDef(SLOT){
    return Char_GetValue(1, SLOT, "def");
}
function Char_GetTeamMag(SLOT){
    return Char_GetValue(1, SLOT, "mag");
}
function Char_GetTeamWeapon(SLOT){
    return Char_GetValue(1, SLOT, "weapon");
}
function Char_GetTeamArmor1(SLOT){
    return Char_GetValue(1, SLOT, "armor1");
}
function Char_GetTeamArmor2(SLOT){
    return Char_GetValue(1, SLOT, "armor2");
}
function Char_GetTeamElement(SLOT){
    return Char_GetValue(1, SLOT, "element");
}
