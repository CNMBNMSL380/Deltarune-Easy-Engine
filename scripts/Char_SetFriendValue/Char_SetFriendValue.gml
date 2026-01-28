// Script assets have changed for v2.3.0 see

// ---------获取朋友列表中的角色的属性（全部通过Char_GetValue方法）
function Char_SetFriendName(SLOT, VALUE) {
    return Char_SetValue(0, SLOT, "name", VALUE);
}
function Char_SetFriendObj(SLOT, VALUE) {
    return Char_SetValue(0, SLOT, "obj", VALUE);
}
function Char_SetFriendBattleObj(SLOT, VALUE) {
    return Char_SetValue(0, SLOT, "btlObj", VALUE);
}
function Char_SetFriendHp(SLOT, VALUE) {
    return Char_SetValue(0, SLOT, "hp", VALUE);
}
function Char_SetFriendMaxHp(SLOT, VALUE) {
    return Char_SetValue(0, SLOT, "maxhp", VALUE);
}
function Char_SetFriendLv(SLOT, VALUE) {
    return Char_SetValue(0, SLOT, "lv", VALUE);
}
function Char_SetFriendExp(SLOT, VALUE) {
    return Char_SetValue(0, SLOT, "exp", VALUE);
}
function Char_SetFriendAtk(SLOT, VALUE) {
    return Char_SetValue(0, SLOT, "atk", VALUE);
}
function Char_SetFriendDef(SLOT, VALUE) {
    return Char_SetValue(0, SLOT, "def", VALUE);
}
function Char_SetFriendMag(SLOT, VALUE) {
    return Char_SetValue(0, SLOT, "mag", VALUE);
}
function Char_SetFriendWeapon(SLOT, VALUE) {
    return Char_SetValue(0, SLOT, "weapon", VALUE);
}
function Char_SetFriendArmor1(SLOT, VALUE) {
    return Char_SetValue(0, SLOT, "armor1", VALUE);
}
function Char_SetFriendArmor2(SLOT, VALUE) {
    return Char_SetValue(0, SLOT, "armor2", VALUE);
}
function Char_SetFriendElement(SLOT, VALUE) {
    return Char_SetValue(0, SLOT, "element", VALUE);
}
