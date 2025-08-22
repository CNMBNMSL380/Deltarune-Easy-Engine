///@arg lang_id/name
function Lang_IsExists(LANG) {

	if(is_real(LANG)){
		//show_message("条件1")
		//show_message(is_string(ds_list_find_value(global._gmu_lang_list,LANG)))
		return is_string(ds_list_find_value(global._gmu_lang_list,LANG));
	}else if(is_string(LANG)){
		//show_message("条件2")
		//show_message(ds_list_find_index(global._gmu_lang_list,LANG)!=-1);
		return ds_list_find_index(global._gmu_lang_list,LANG)!=-1;
	}


}
