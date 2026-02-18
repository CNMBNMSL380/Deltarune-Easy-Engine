///@arg encounter_id
function Encounter_GetSoulX(ID) {
	var map=global._encounter;
	if(ds_map_exists(map,ID)){
		var map_e=ds_map_find_value(map,ID);
		var base = ds_map_find_value(map,"base");
		var result = base.e_soul_x
		return (is_real(result) ? result : 48);
	}else{
		return 48;
	}
}
