/// @description 事件
live;

// Inherit the parent event
event_inherited();

Player_Heal(99);

Dialog_Add("你使用了药品，回复了"+Item_GetTextHeal(10));
Dialog_Start();

Item_Remove(_item_slot);

audio_play_sound(snd_item_heal,0,false);
