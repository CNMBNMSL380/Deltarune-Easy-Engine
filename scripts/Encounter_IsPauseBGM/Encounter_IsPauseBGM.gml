///@arg encounter_id
function Encounter_IsPauseBGM(ID) {

	var map=global._encounter;
	if(ds_map_exists(map,ID)){
		var map_e=ds_map_find_value(map,ID);
		var base = ds_map_find_value(map,"base");
		var result = base.e_ow_isPause_bgm;
		return (is_bool(result) ? result : true);
	}else{
		return true;
	}


}
