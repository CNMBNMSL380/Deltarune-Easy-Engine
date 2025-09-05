// Script assets have changed for v2.3.0 see

// ---------获取朋友列表中的角色的属性（全部通过Char_GetValue方法）

function Char_GetFriendName(SLOT){
    return Char_GetValue(0, SLOT, "name");
}
function Char_GetFriendObj(SLOT){
    return Char_GetValue(0, SLOT, "obj");
}
function Char_GetFriendBattleObj(SLOT){
    return Char_GetValue(0, SLOT, "btlObj");
}
function Char_GetFriendHp(SLOT){
    return Char_GetValue(0, SLOT, "hp");
}
function Char_GetFriendMaxHp(SLOT){
    return Char_GetValue(0, SLOT, "maxhp");
}
function Char_GetFriendAtk(SLOT){
    return Char_GetValue(0, SLOT, "atk");
}
function Char_GetFriendDef(SLOT){
    return Char_GetValue(0, SLOT, "def");
}
function Char_GetFriendMag(SLOT){
    return Char_GetValue(0, SLOT, "mag");
}
function Char_GetFriendWeapon(SLOT){
    return Char_GetValue(0, SLOT, "weapon");
}
function Char_GetFriendArmor1(SLOT){
    return Char_GetValue(0, SLOT, "armor1");
}
function Char_GetFriendArmor2(SLOT){
    return Char_GetValue(0, SLOT, "armor2");
}
function Char_GetFriendElement(SLOT){
    return Char_GetValue(0, SLOT, "element");
}
