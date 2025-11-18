// Script assets have changed for v2.3.0 see
function Dr_Battle_AddTp(TP){
	var tpNum = Dr_Battle_GetTp();
	var num = clamp(tpNum + TP,0,100);
	
	Dr_Battle_SetTp(num);
	
	return num;
	
}