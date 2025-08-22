/// @description 事件
live;
show_debug_message(start)
if(start == 0){
	if!(instance_exists(text_typer)){
		start = 1;	
	}
}
if(start == 1){
	char_player.moveable=false;
	char_susic.dir = DIR.DOWN;
	start = 1.5
	Anim_Create(id,"start",0,0,start,0.5,0,100);	
	BGM_SetVolume(0,0,25)
}
else if(start == 2){
	
	var text ="{face 2 0}{voice 4}* ...{pause}{clear}";
	text +="{face_emotion 0}* 好吧，克里斯，我在外面等你";
	Dialog_Add(
		text
	);
	Dialog_Start()
	start = 2.5
	Anim_Create(id,"start",0,0,start,0.1,0,1);	
}
else if(start == 2.6){
	if(!instance_exists(text_typer)){
		start = 3	
	}
}
else if(start == 3){
	if!(char_susic.y >= 350){
		char_susic.move[DIR.DOWN] = 2;
		char_susic.move_speed[DIR.DOWN] = 1.5;
	}
	else{
		start = 4;
	}
}
if(start = 4){
	audio_play_sound(snd_dong,0,0)
	Camera_Shake(0,16,0,1,0,1);
	start = 4.5
	Anim_Create(id,"start",0,0,start,0.5,0,100);
}

if(start == 5){
	BGM_SetVolume(0,1,25)
	var text ="{voice 3}{face 1 3}{font 3}* 好了，看样子你的朋友走了{pause}{clear}";
	text +="{face_emotion 3}* 不过好吧，其实压根就没有智&障儿童日,我只是瞎编的{pause}{clear}";
	text +="{face_emotion 0}* 不过，我确实有些话要跟你说{pause}{clear}";
	text +="{face_emotion 6}* 你能不能，靠近点听？";
	//text +="{face_emotion 0}* 很好{pause}{clear}";
	////text +="{face_emotion 1}* 听着，接下来你很快就要进入&全新的冒险{pause}{clear}";
	//text +="{face_emotion 1}* 你可能会遇到新朋友，新事物{pause}{clear}";
	//text +="{face_emotion 5}* 不过，接下来这些话&我希望你能听完{pause}{clear}";
	//text +="{face_emotion 1}* 如果你还是继续执迷不悟，&继续一昧地“向前”{pause}{clear}";
	//text +="{face_emotion 4}* 你 将 会 迎 来 你 一 生 中 最& 坏 的 坏 时 光";
	Dialog_Add(text);
	Dialog_Start()
	start = 6;
	Anim_Create(id,"start",0,0,start,0.5,0,1);
}
else if(start == 6.5){
	if(!instance_exists(text_typer)){		
		Anim_Create(id,"start",0,0,6.6,0.4,0,100);
		Anim_Create(fader,"alpha",0,0,0,1,50,25);
		start = 6.6
	}
}
else if(start == 6.6){
	char_player.move[DIR.UP] = 2
}
else if(start == 7){
	text ="{depth 200}{voice 3}{face 1 3}{font 1 0}{font 3}* 很好";
	if!(instance_exists(text_typer)){
		Dialog_Add(text);
		Dialog_Start()
	}
	fader.depth = 1000;
	ui_dialog.depth = 250;
	start = 7.5;
	char_player.x = char_dyBg_2. x+40
	char_player.y = char_dyBg_2.y-7

	Anim_Create(id,"start",0,0,7.5,0.5,0,1);
}
if(start == 8){
	if(!instance_exists(text_typer)){
		start = 9
		Anim_Create(id,"start",0,0,9,1,0,100);
		Anim_Create(fader,"alpha",0,0,1,-1,50,25);
	}
}
if(start ==10){
	text ="{voice 3}{face 1 1}{font 1 0}{font 3}* 如果我说的没错的话{pause}{clear}";
	text +="{face_emotion 1}* 接下来你很快就要进入&全新的冒险{pause}{clear}";
	text +="{face_emotion 1}* 你可能会遇到新朋友，新事物{pause}{clear}";
	text +="{face_emotion 5}* 不过，接下来这些话&我希望你能听完{pause}{clear}";
	text +="{face_emotion 1}* 如果你还是继续执迷不悟，&继续一昧地“向前”";
	//text +="{face_emotion 4}* 你 将 会 迎 来 你 一 生 中 最& 坏 的 坏 时 光";
	if!(instance_exists(text_typer)){
		Dialog_Add(text);
		Dialog_Start()
	}
	start = 10.5
	Anim_Create(id,"start",0,0,10.5,0.5,0,1);
}
else if(start == 11){
	if(!instance_exists(text_typer)){
		start = 11.5
		Anim_Create(id,"start",0,0,11.5,0.5,0,50);
	}
}
else if(start == 12){
	BGM_Stop(0)
	text ="{voice 5}{face 1 4}{speed 8}{font 1 0}{font 3}";
	text +="{face_emotion 4}* 你 将 会 迎 来 你 一 生 中 最& 坏 的 时 光";
	if!(instance_exists(text_typer)){
		Dialog_Add(text);
		Dialog_Start()
	}
	start =12.5
	Anim_Create(id,"start",0,0,12.5,0.5,0,1);
}
if(start ==13){
	if(!instance_exists(text_typer)){
		start = 13.5
		audio_play_sound(snd_noise,0,0);
		fader.alpha = 1
		Anim_Create(id,"start",0,0,13.5,0.5,0,25);
	}
}
if(start == 14){
	start = 14.5
	audio_play_sound(snd_noise,0,0);
	fader.alpha = 1
	Anim_Create(id,"start",0,0,14.5,0.5,0,50);
}
if(start == 15){
	text ="{face 2 7}{voice 4}{font 1}* 我去，你怎么突然出现在我面前{pause}{clear}";
	text +="* 挺吓人的，你知道吗？{pause}{clear}";
	text +="{face_emotion 5}* ...{pause}{clear}";
	text +="{face_emotion 6}* 话说，你好像跟那骷髅说些了话？{pause}{clear}";
	text +="* 那骷髅说了啥？{pause}{clear}";
	text +="{face_emotion 0}* ...{pause}{clear}";
	text +="{face_emotion 6}* 啥也没说？{pause}{clear}";
	text +="{face_emotion 5}* ... {sleep 50}{face_emotion 0},算了，我觉得也没啥好想的{pause}{clear}";
	text +="{face_emotion 1}* 我们走吧";
	if!(instance_exists(text_typer)){
		Dialog_Add(text);
		Dialog_Start()
	}
	start =15.5
	Anim_Create(id,"start",0,0,15.5,0.5,0,1);
}
show_debug_message(char_player.y)