/// @description 打字机事件
//用于打印普通文本和链式文本，还会通过需求打印血条与仁慈度
live;
var del_text_ins = function(){
	for(var i = array_length(text_inst)-1 ; i > -1 ; i--){
		if(instance_exists(text_inst[i])){
			instance_destroy(text_inst[i]);	
			array_pop(text_inst);
		}
	}
}
del_text_ins();
///// --------------基础变变量
var cam_x = camera.x;
var cam_y = camera.y;
var main = dr_battle_main;

var pos_x = 45;
var pos_y = 375;
//// ---------------打字机UI布局
//如果文本为空，则不生成打字机
if(text != "" or text_list != []){
	
	//默认的对话，不会被清除
	if(text_layout == 0){
		if(text != ""){
			text_inst[0] = instance_create_depth(pos_x,pos_y,-100,text_typer);
			text_inst[0].text = text_style + text;
		}
	}
	//垂直队列文本
	else if(text_layout == 1){
		var off_x = 0 , off_y = 0;
		for(var i = 0 ; i < array_length(text_list) ; i++){
			off_x = 25
			off_y = 32*i;
			text_inst[i] = instance_create_depth(pos_x + off_x,pos_y + off_y,-100,text_typer);
			text_inst[i].text = "{instant true}" + text_style + text_list[i];
		}
	}
	//两列垂直队列文本
	else if(text_layout == 2){
		var off_x = 0 , off_y = 0;
	
		for(var i = 0 ; i < array_length(text_list) ; i++){
			off_x = (i % 2 == 0 ? 0 : 200)
			off_y = 32*floor(i/2);
			text_inst[i] = instance_create_depth(pos_x + off_x,pos_y + off_y,-100,text_typer);
			text_inst[i].text = "{instant true}" + text_style + text_list[i];
			
		}
	}
	//对话，但可以通过按x来消除对话
	else if(text_layout == 3){
		if(text != ""){
			text_inst[0] = instance_create_depth(pos_x,pos_y,-100,text_typer);
			text_inst[0].text = text_style + text + "{pause}{end}";
		}
	}
	//如果没有，则使用默认对话
	else{
		if(text != ""){
			text_inst[0] = instance_create_depth(pos_x,pos_y,-100,text_typer);
			text_inst[0].text = text_style + text;
		}
	}
}
else{
	text_inst = []
}

///生成ACT 介绍



/*
	var num=0
			var te_x=0
			var te_y=0
			repeat(Item_GetNumber()){
				if!(num=0){
					te_x=(num % 2 == 0 ? 0 : 200)
					te_y=32*floor(num/2)
				}			
				if!(instance_exists(_dia_i[num])){
					_dia_i[num]=instance_create_depth(bor_x+63+te_x,bor_y+5+te_y,0,text_typer)
					_dia_i[num].text=text_css+"{instant true}" + string(Item_GetName(Item_Get(num)))
					show_debug_message(num)
				}
				num+=1
			}
*/