/// @description 事件
live;

event_inherited();

Player_Heal(99);

Dialog_Add("你喝掉了野花茶，回复了"+Item_GetTextHeal(90));
Dialog_Start();

Item_Remove(_item_slot);

audio_play_sound(snd_item_heal,0,false);
