/// @description 初始化玩家 
live;
_char_spr = Dr_Battle_CreateSpriteList("kris",id)
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.GLIDE, spr_battleChar_kris_glide,,0.1);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.INTRO, spr_battleChar_kris_intro);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.IDLE, spr_battleChar_kris_idle,,0.1);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.FIGHT, spr_battleChar_kris_fight);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.FIGHT_IDLE, spr_battleChar_kris_fight_idle);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.ACT, spr_battleChar_kris_act_1);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.B_ACT, spr_battleChar_kris_act_0,,0.1);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.E_ACT, spr_battleChar_kris_act_2);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.MAGIC, spr_battleChar_kris_glide);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.ITEM, spr_battleChar_kris_item);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.ITEM_IDLE, spr_battleChar_kris_item_idle);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.DEFEND, spr_battleChar_kris_defend);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.HURT, spr_battleChar_kris_hurt);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.DEFEATE, spr_battleChar_kris_defeated);
Dr_Battle_AddSprite(_char_spr, DR_PLAYER_INDEX.WIN, spr_battleChar_kris_victory);

//show_message(Dr_Battle_GetSprite(_char_spr,DR_PLAYER_INDEX.IDLE));
