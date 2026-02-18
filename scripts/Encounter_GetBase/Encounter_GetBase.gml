// Script assets have changed for v2.3.0 see
function Encounter_GetBase(ID){
	var map = ds_map_find_value( global._encounter , ID);
	return ds_map_find_value(map,"base");
}