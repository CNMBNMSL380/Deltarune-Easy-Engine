/// @description 事件
live;

// Inherit the parent event
event_inherited();

if(instance_exists(dr_battle_main)){
	Dialog_Add("你释放了蒲公英");
	Dialog_Start();

	Item_Remove(_item_slot);
}
else{
	Dialog_Add("* 你手慢脚乱的抓住蒲公英{sleep 25}&  现在还不能放她出来{pause}{clear}等到战斗在使用");
	Dialog_Start();
}

audio_play_sound(snd_item_heal,0,false);
