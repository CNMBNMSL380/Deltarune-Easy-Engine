// Script assets have changed for v2.3.0 see

// ---------获取团队列表中的角色的属性（全部通过Char_SetValue方法）

function Char_SetTeamName(SLOT, VALUE) {
    return Char_SetValue(1, SLOT, "name", VALUE);
}
function Char_SetTeamObj(SLOT, VALUE) {
    return Char_SetValue(1, SLOT, "obj", VALUE);
}
function Char_SetTeamBattleObj(SLOT, VALUE) {
    return Char_SetValue(1, SLOT, "btlObj", VALUE);
}
function Char_SetTeamHp(SLOT, VALUE) {
    return Char_SetValue(1, SLOT, "hp", VALUE);
}
function Char_SetTeamMaxHp(SLOT, VALUE) {
    return Char_SetValue(1, SLOT, "maxhp", VALUE);
}
function Char_SetTeamLv(SLOT, VALUE) {
    return Char_SetValue(1, SLOT, "lv", VALUE);
}
function Char_SetTeamExp(SLOT, VALUE) {
    return Char_SetValue(1, SLOT, "exp", VALUE);
}
function Char_SetTeamAtk(SLOT, VALUE) {
    return Char_SetValue(1, SLOT, "atk", VALUE);
}
function Char_SetTeamDef(SLOT, VALUE) {
    return Char_SetValue(1, SLOT, "def", VALUE);
}
function Char_SetTeamMag(SLOT, VALUE) {
    return Char_SetValue(1, SLOT, "mag", VALUE);
}
function Char_SetTeamWeapon(SLOT, VALUE) {
    return Char_SetValue(1, SLOT, "weapon", VALUE);
}
function Char_SetTeamArmor1(SLOT, VALUE) {
    return Char_SetValue(1, SLOT, "armor1", VALUE);
}
function Char_SetTeamArmor2(SLOT, VALUE) {
    return Char_SetValue(1, SLOT, "armor2", VALUE);
}
function Char_SetTeamElement(SLOT, VALUE) {
    return Char_SetValue(1, SLOT, "element", VALUE);
}