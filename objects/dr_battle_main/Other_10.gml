/// @description 重置数据
live;
_player_button = 0;										//选择按钮
_player_friend_num = 0;									//选中队友编号

_player_choice_friend = 0;								//选中队友
_player_choice_enemy = 0;								//选择敌人					
_player_choice_act = 0;								//ACT类，选择要执行的类
_player_choice_magic = 0;								//魔法类，选择要执行的魔法
_player_item_choice_item = 0;							//选择药瓶
_player_item_choice_char = 0;							//选择对象

_player_GoToEvent = [];						//储存用于玩家回合结束接下来要触发的事件

_player_act_event = [];						//在ACT阶段要触发的事件
_player_act_slot = 0;

_player_magic_event = [];
_player_magic_slot = 0;

_player_mercy_event = [];
_player_mercy_slot = 0;


_player_item_event = [];
_player_item_slot = 0;
_player_item_is_use = [];

_fight_menu_slot = 0;

for(var i=0; i<array_length(_player_friend); i++){
	Dr_Battle_SetSpriteMode(_player_friend[i],DR_PLAYER_INDEX.IDLE);
}