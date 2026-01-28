// Script assets have changed for v2.3.0 see
function Dr_Battle_EnemyFunc(SLOT = -1,KEY,ARG = []){
	var Main = dr_battle_main;	
	if(SLOT == -1){
		for(var i = 0; i < Dr_Battle_GetEnemySize(); i++){
			var ev = function (ARG){};
			ev = Dr_Battle_GetEnemyEvent(i,KEY);
			var args = [i];
			
			array_push(args,ARG);
			ev(args);
		}
	}
	else{
		var ev = function(ARG){}
		ev = Dr_Battle_GetEnemyEvent(SLOT,KEY);
		var args = [SLOT];
		ev(array_concat(args,ARG));
	}
	return true;
}

