// Script assets have changed for v2.3.0 see
function Char_GetValueType(CHAR,TYPE) {
	if(CHAR != noone){
	    switch (TYPE) {
	        case "name":
	            return CHAR.char_name;
	        case "obj":
	            return CHAR.char_obj;
	        case "btlObj":
	            return CHAR.char_battle_obj;
	        case "hp":
	            return CHAR.char_hp;
	        case "maxhp":
	            return CHAR.char_maxhp;
			case "lv":
				return CHAR.char_lv;
			case "exp":
				return CHAR.char_exp;
	        case "atk":
	            return CHAR.char_atk;
	        case "def":
	            return CHAR.char_def;
	        case "mag":
	            return CHAR.char_mag;
	        case "weapon":
	            return CHAR.char_weapon;
	        case "armor1":
	            return CHAR.char_armor1;
	        case "armor2":
	            return CHAR.char_armor2;
	        case "element":
	            return CHAR.char_element;
	        case "magic":
	            return CHAR.char_magic;
	        default:
				if(variable_struct_exists(CHAR,TYPE)){	
					return variable_struct_get(CHAR,TYPE);			
				}
				show_debug_message(@"Char_GetValueType : 无法获取变量！ 
				原因 : 未知变量。 
				变量名字 : " + string(TYPE)
				)
	            return false;
	        break;
	    }
	}
}