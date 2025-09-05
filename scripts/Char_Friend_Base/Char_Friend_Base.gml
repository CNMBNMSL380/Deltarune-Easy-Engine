// Script assets have changed for v2.3.0 see
function Char_Friend_Base(NAME,CHAR_OBJ,CHAR_BATTLE_OBJ,HP=20,MAXHP=20,ATK=0,DEF=0,MAG=0,
WEAPON = noone,ARMOR_1 = noone,ARMOR_2 = noone,ELEMENT = [],MAGIC = []
) 
constructor {
    // friend
    char_name = NAME;									//角色名称
    char_obj = CHAR_OBJ;								//角色世界实例
	char_battle_obj = CHAR_BATTLE_OBJ;					//角色战斗实例
    char_hp = HP;										//角色血量
    char_maxhp = MAXHP;									//角色最高血量
    char_atk = ATK;										//角色攻击
    char_def = DEF;										//角色防御	
	char_mag = MAG;
    char_weapon = WEAPON;								//角色武器
    char_armor1 = ARMOR_1;								//角色防具1
    char_armor2 = ARMOR_2;								//角色防具2
    char_element = ELEMENT;								//角色元素，元素是添加武器或防具获得的效果
    char_magic = MAGIC;									//角色魔法，需要添加实例

    function Set(STRING, INDEX) {
        switch (STRING) {
            case "name":
                char_name = INDEX;
                return true;
            case "obj":
                char_obj = INDEX;
                return true;
            case "hp":
                char_hp = INDEX;
                return true;
            case "maxhp":
                char_maxhp = INDEX;
                return true;
            case "atk":
                char_atk = INDEX;
                return true;
            case "def":
                char_def = INDEX;
                return true;
            case "weapon":
                char_weapon = INDEX;
                return true;
            case "armor1":
                char_armor1 = INDEX;
                return true;
            case "armor2":
                char_armor2 = INDEX;
                return true;
            default:
                return false;
        }
    }

    //// Magic Operations
    //function Add_Magic(magic_struct) {
    //    array_push(char_magic, magic_struct);
    //    return true;
    //}

    //function Get_Magic() {
    //    return char_magic;
    //}
    //function Get_Magic_Lenght() {
    //    return array_length(char_magic);
    //}

    //static _CheckIndex = function(slot, array_length, func_name) {
    //    if (slot < 0 || slot >= array_length) {
    //        var err_msg = string(char_name) + " : 错误引用 " + func_name;
    //        show_debug_message(err_msg);
    //        return false;
    //    }
    //    return true;
    //}

    //function Get_Magic_Infot(SLOT) {
    //    if (!_CheckIndex(SLOT, array_length(char_magic), "Get_Magic_Infot")) return "";
    //    return char_magic[SLOT].infot;
    //}

    //function Get_Magic_UseTp(SLOT) {
    //    if (!_CheckIndex(SLOT, array_length(char_magic), "Get_Magic_UseTp")) return 0;
    //    return char_magic[SLOT].tp;
    //}

    //function Get_Magic_Function(SLOT) {
    //    if (!_CheckIndex(SLOT, array_length(char_magic), "Get_Magic_Function")) return undefined;
    //    return char_magic[SLOT].magic_function;
    //}

    //function Set_Magic_Function(SLOT, FUNCTION) {
    //    if (!_CheckIndex(SLOT, array_length(char_magic), "Set_Magic_Function")) return false;
    //    char_magic[SLOT].magic_function = FUNCTION;
    //    return true;
    //}

    //function Set_Magic_Name(SLOT, NAME) {
    //    if (!_CheckIndex(SLOT, array_length(char_magic), "Set_Magic_Name")) return false;
    //    char_magic[SLOT].name = NAME;
    //    return true;
    //}

    //// 元素相关方法
    //function Get_Element_Name(SLOT) {
    //    if (!_CheckIndex(SLOT, array_length(char_element), "Get_Element_Name")) return "";
    //    return char_element[SLOT][0];
    //}

    //function Get_Element_Function(SLOT) {
    //    if (!_CheckIndex(SLOT, array_length(char_element), "Get_Element_Function")) return undefined;
    //    return char_element[SLOT][1];
    //}
}
