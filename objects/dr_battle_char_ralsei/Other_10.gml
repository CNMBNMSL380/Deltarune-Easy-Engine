/// @description 事件
live;
_char_spr = Dr_Battle_CreateSpriteList("ralsei",id)
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.GLIDE, spr_char_ralsei_right);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.INTRO, spr_battleChar_ralsei_intro);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.IDLE, spr_battleChar_ralsei_idle,,0.1);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.FIGHT, spr_battleChar_ralsei_fight);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.FIGHT_IDLE, spr_battleChar_ralsei_fight_b);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.ACT, spr_battleChar_ralsei_act_0);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.B_ACT, spr_battleChar_ralsei_act_2);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.E_ACT, spr_battleChar_ralsei_act_2);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.MAGIC, spr_battleChar_susie_magic);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.ITEM, spr_battleChar_ralsei_item);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.ITEM_IDLE, spr_battleChar_ralsei_item_idle);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.DEFEND, spr_battleChar_ralsei_defend);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.DEFEATE, spr_battleChar_ralsei_defeated);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.WIN, spr_battleChar_ralsei_victory);