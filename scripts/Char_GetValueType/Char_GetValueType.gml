// Script assets have changed for v2.3.0 see
function Char_GetValueType(CHAR,TYPE) {
	if(CHAR != noone){
	    switch (TYPE) {
	        case "name":
	            return CHAR.char_name;
	            break;
	        case "obj":
	            return CHAR.char_obj;
	            break;
	        case "btlObj":
	            return CHAR.char_battle_obj;
	            break;
	        case "hp":
	            return CHAR.char_hp;
	            break;
	        case "maxhp":
	            return CHAR.char_maxhp;
	            break;
	        case "atk":
	            return CHAR.char_atk;
	            break;
	        case "def":
	            return CHAR.char_def;
	            break;
	        case "mag":
	            return CHAR.char_mag;
	            break;
	        case "weapon":
	            return CHAR.char_weapon;
	            break;
	        case "armor1":
	            return CHAR.char_armor1;
	            break;
	        case "armor2":
	            return CHAR.char_armor2;
	            break;
	        case "element":
	            return CHAR.char_element;
	            break;
	        case "magic":
	            return CHAR.char_magic;
	            break;
	        default:
				if(variable_struct_exists(CHAR,TYPE)){	
					return variable_struct_get(CHAR,TYPE);			
				}
	            return false;
	            break;
	    }
	}
}