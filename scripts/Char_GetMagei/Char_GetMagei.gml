// Script assets have changed for v2.3.0 see
function Char_GetMagic(CHAR_CLASS,CHAR){
	var magic = Char_GetValue(CHAR_CLASS,CHAR,"magic");
	return magic
}
function Char_GetMagicName(CHAR_CLASS = 1,CHAR,SLOT){
	var magic = Char_GetMagic(CHAR_CLASS,CHAR);
	if(magic != undefined or magic != false){
		if(SLOT < array_length(magic)){
			var instMag = magic[SLOT]._magic_inst;
			var name = "";
			var inst =instance_create_depth(0,0,0,instMag);
			name = inst.name;
			instance_destroy(inst);
			
			return name;
		}
		
	}
	return "null";
}
function Char_GetMagicNameAll(CHAR_CLASS,CHAR){
	var arr = [];
	var magic = Char_GetMagic(CHAR_CLASS,CHAR);
	for(var i =0; i < array_length(magic); i++){
		array_push(arr,Char_GetMagicName(CHAR_CLASS,CHAR,i));
	}
	return arr
}
function Char_GetMagicInstance(CHAR_CLASS,CHAR,SLOT){
	var magic = Char_GetMagic(CHAR_CLASS,CHAR);
	if(magic != undefined or magic != false){
		if(SLOT < array_length(magic)){
			var inst = magic[SLOT]._magic_inst;
			return inst;
		}
		
	}
	return noone;
}	
function Char_GetMagicTp(CHAR_CLASS,CHAR,SLOT){
	var magic = Char_GetMagic(CHAR_CLASS,CHAR);
	if(magic != undefined or magic != false){
		if(SLOT < array_length(magic)){
			var tp = magic[SLOT]._magic_use_tp;
			return tp;
		}
		
	}
	return 0;
}