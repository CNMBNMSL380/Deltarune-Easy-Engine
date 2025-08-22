// Script assets have changed for v2.3.0 see
//用于创建队友类

function Dr_Battle_CreateClass(FRIEND_DATA = []){
	live;
	var storage_firendClass_inst = [];
	for(var i = 0; i < array_length(FRIEND_DATA); i++) {	
	    // 直接根据索引计算水平坐标
	   var centerX = 320; // 舞台中心坐标
		var spacing = 213; // 实例间距
		var total = array_length(FRIEND_DATA);

		// 计算起始坐标（整体居中）
		var startX = centerX - ((total-1) * spacing) / 2;

		for(var i = 0; i < total; i++) {
		    // 直接计算每个实例的中心坐标
		    var finalX = startX + (i * spacing);
			var insFriend = FRIEND_DATA[i];
		    storage_firendClass_inst[i] = instance_create_depth(finalX, 0, 0, dr_battle_friendClass);
			storage_firendClass_inst[i].friend_ins = insFriend;
			storage_firendClass_inst[i]._header_ico = insFriend._char_ico;
			storage_firendClass_inst[i]._header_name = insFriend._char_heard;
			storage_firendClass_inst[i]._sytle_color = insFriend._char_style_color;
			storage_firendClass_inst[i].magic_button = insFriend._magic;
		}
	}
	return storage_firendClass_inst 
	
}
//用于重置队友类
function Dr_Battle_ResetClass(){
	
}