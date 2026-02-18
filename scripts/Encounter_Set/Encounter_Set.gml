function Encounter_Set(ID,BASE = new Encounter_Dr_Base(),FUNC = function(){}){
	if(is_struct(BASE)){
		BASE.e_id = ID;
		if(ID>=0){
			var map=global._encounter;
			var map_e=-1;
			
			if(ds_map_exists(map,ID)){
				map_e=ds_map_find_value(map,ID);
				ds_map_clear(map_e);
			}
			else{
				map_e=ds_map_create();
				ds_map_add(map,ID,map_e);
			}
			ds_map_add(map_e,"base",BASE);
			ds_map_add(map_e,"func",FUNC);
		}
		
		return true;
	}
}


// 废弃方法，只保留兼容
function Encounter_Old_Set(ID,ENEMY_0,ENEMY_1,ENEMY_2,MENU_DIALOG,BGM=-1,MENU_MERCY_FLEE_ENABLED=true,PAUSE_BGM=true,QUICK=false,SOUL_X=48,SOUL_Y=454) {
	///@arg id
	///@arg enemy_0
	///@arg enemy_1
	///@arg enemy_2
	///@arg menu_dialog
	///@arg bgm*
	///@arg menu_mercy_flee_enabled*
	///@arg pause_bgm*
	///@arg quick*
	///@arg soul_x*
	///@arg soul_y*
	
	//此方法设置UT的敌人遭遇
	if(ID>=0){
		var map=global._encounter;
		var map_e=-1;
		if(ds_map_exists(map,ID)){
			map_e=ds_map_find_value(map,ID);
			ds_map_clear(map_e);
		}else{
			map_e=ds_map_create();
			ds_map_add(map,ID,map_e);
		}
		ds_map_add(map_e,"enemy_0",ENEMY_0);
		ds_map_add(map_e,"enemy_1",ENEMY_1);
		ds_map_add(map_e,"enemy_2",ENEMY_2);
		ds_map_add(map_e,"menu_dialog",MENU_DIALOG);
		ds_map_add(map_e,"bgm",BGM);
		ds_map_add(map_e,"pause_bgm",PAUSE_BGM);
		ds_map_add(map_e,"menu_mercy_flee_enabled",MENU_MERCY_FLEE_ENABLED);
		ds_map_add(map_e,"quick",QUICK);
		ds_map_add(map_e,"soul_x",SOUL_X);
		ds_map_add(map_e,"soul_y",SOUL_Y);
		return true;
	}else{
		return false;
	}
}