// Script assets have changed for v2.3.0 see

// ---------获取朋友列表中的角色的属性（全部通过Get方法）

function Char_GetFriendName(SLOT){
    return Char_GetFriendByID(SLOT).Get("name");
}
function Char_GetFriendObj(SLOT){
    return Char_GetFriendByID(SLOT).Get("obj");
}
function Char_GetFriendBattleObj(SLOT){
    return Char_GetFriendByID(SLOT).Get("battle_obj");
}
function Char_GetFriendHp(SLOT){
    return Char_GetFriendByID(SLOT).Get("hp");
}
function Char_GetFriendMaxHp(SLOT){
    return Char_GetFriendByID(SLOT).Get("maxhp");
}
function Char_GetFriendAtk(SLOT){
    return Char_GetFriendByID(SLOT).Get("atk");
}
function Char_GetFriendDef(SLOT){
    return Char_GetFriendByID(SLOT).Get("def");
}
function Char_GetFriendWeapon(SLOT){
    return Char_GetFriendByID(SLOT).Get("weapon");
}
function Char_GetFriendArmor1(SLOT){
    return Char_GetFriendByID(SLOT).Get("armor1");
}
function Char_GetFriendArmor2(SLOT){
    return Char_GetFriendByID(SLOT).Get("armor2");
}
function Char_GetFriendElement(SLOT){
    return Char_GetFriendByID(SLOT).Get("element");
}
