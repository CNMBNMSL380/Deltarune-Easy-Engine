/// @description 收起 / 展开动画
live;
if(_expand){
	Anim_Destroy(id,"_border_alpha");
	Anim_Create(id,"_anim_y",2,1,(_anim_y +10),35-(_anim_y +10),20);
	Anim_Create(id,"_border_alpha",4,1,_border_alpha,0-_border_alpha,20,10);
	_expand = false;
}
else{
	Anim_Destroy(id,"_border_alpha");
	Anim_Create(id,"_anim_y",2,1,(_anim_y-10),0 -(_anim_y-10),25);
	Anim_Create(id,"_border_alpha",2,1,_border_alpha,1-_border_alpha,10);
	_expand = true;
}