// Script assets have changed for v2.3.0 see
function Char_Base() 
constructor {
    char_name = "char";									//角色名称
    char_obj = char_friend;								//角色世界实例
	char_battle_obj = dr_battle_char_player;			//角色战斗实例
    char_hp = 100;										//角色血量
    char_maxhp = 100;									//角色最高血量
	char_lv = 1;										//角色等级
	char_exp = 0;										//角色经验值
    char_atk = 10;										//角色攻击
    char_def = 10;										//角色防御	
	char_mag = 0;										//角色魔力
    char_weapon = noone;								//角色武器
    char_armor1 = noone;								//角色防具1
    char_armor2 = noone;								//角色防具2
    char_element = [];								//角色元素，元素是添加武器或防具获得的效果
    char_magic = [];									//角色魔法，需要添加实例
}
//function Char_Base(NAME,CHAR_OBJ,CHAR_BATTLE_OBJ,HP=20,MAXHP=20,LV = 1,EXP = 0,ATK=0,DEF=0,MAG=0,
//WEAPON = noone,ARMOR_1 = noone,ARMOR_2 = noone,ELEMENT = [],MAGIC = []
//) 
//constructor {
//    char_name = NAME;									//角色名称
//    char_obj = CHAR_OBJ;								//角色世界实例
//	char_battle_obj = CHAR_BATTLE_OBJ;					//角色战斗实例
//    char_hp = HP;										//角色血量
//    char_maxhp = MAXHP;									//角色最高血量
//	char_lv = LV;										//角色等级
//	char_exp = EXP;										//角色经验值
//    char_atk = ATK;										//角色攻击
//    char_def = DEF;										//角色防御	
//	char_mag = MAG;										//角色魔力
//    char_weapon = WEAPON;								//角色武器
//    char_armor1 = ARMOR_1;								//角色防具1
//    char_armor2 = ARMOR_2;								//角色防具2
//    char_element = ELEMENT;								//角色元素，元素是添加武器或防具获得的效果
//    char_magic = MAGIC;									//角色魔法，需要添加实例
//}
