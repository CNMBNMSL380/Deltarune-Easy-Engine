// Script assets have changed for v2.3.0 see
function Char_SetValueType(CHAR,TYPE,VALUE){
    switch (TYPE) {
        case "name":
            CHAR.char_name = VALUE;
            return CHAR.char_name;
        case "obj":
            CHAR.char_obj = VALUE;
            return CHAR.char_obj;
        case "hp":
            CHAR.char_hp = VALUE;
            return CHAR.char_hp;
        case "maxhp":
            CHAR.char_maxhp = VALUE;
            return CHAR.char_maxhp;
		case "lv" : 
			CHAR.char_lv = VALUE;
			return CHAR.char_lv;
		case "exp":
			CHAR.char_exp = VALUE;
			return CHAR.char_exp;
        case "atk":
            CHAR.char_atk = VALUE;
            return CHAR.char_atk;
        case "def":
            CHAR.char_def = VALUE;
            return CHAR.char_def;
        case "weapon":
            CHAR.char_weapon = VALUE;
            return CHAR.char_weapon;
        case "armor1":
            CHAR.char_armor1 = VALUE;
            return CHAR.char_armor1;
        case "armor2":
            CHAR.char_armor2 = VALUE;
            return CHAR.char_armor2;
        default:
			if(variable_struct_exists(CHAR,TYPE)){	
				variable_struct_set(CHAR,TYPE,VALUE);
				return variable_struct_get(CHAR,TYPE);			
			}
			show_debug_message(@"Char_GetValueType : 无法设置变量！ 
				原因 : 未知变量。 
				变量名字 : " + string(TYPE) + @"
				值 : " + string(VALUE)
				)
	    return undefined;
    }
}