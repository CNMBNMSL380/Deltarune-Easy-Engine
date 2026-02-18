/// @description 攻击事件
live;
var Main = dr_battle_main
var Main_FightSlot = Main._fight_menu_slot;
//show_debug_message(string( Main_FightSlot) + "  "+ string(fight_slot) + "  " + string(id));

if(Main_FightSlot == fight_slot){
	//开始后，队友播放攻击动画
	Dr_Battle_PlaySpriteAnimOnce(friend_ins,DR_PLAYER_INDEX.FIGHT);
	audio_play_sound(snd_damage,0,0)
	
	Anim_Create(id,"knife_alp",0,0,1,-1,50);
	Anim_Create(id,"knife_sc",0,0,1,1,50);
	if(array_length(Main._enemy) > 0){
		if(instance_exists(enemy_ins)){
			//计算伤害
			var damg = 50
			//跳出伤害数字
			var ins = instance_create_depth(enemy_ins.x-70,enemy_ins.y-50,enemy_ins.depth-1,dr_battle_menu_damageNum)
			ins.dam_num = damg;
			//扣除敌人血量
			enemy_ins.hp -= damg;
			//触发事件
			Dr_Battle_EnemyFunc(enemy_ins._enemy_id,DR_BATTLE_ENEMY.HURT,[{ damgage : damg  }]);
			
			//show_message(fight_slot)
		}
		else{
			var ins = Dr_Battle_GetEnemyInstance(0);
			if(instance_exists(ins)){
				//计算伤害
				var damg = 50
				//跳出伤害数字
				var ins = instance_create_depth(enemy_ins.x-70,enemy_ins.y-50,enemy_ins.depth-1,dr_battle_menu_damageNum)
				ins.dam_num = damg;
				//扣除敌人血量
				enemy_ins.hp -= damg;
				//触发事件
				Dr_Battle_EnemyFunc(enemy_ins._enemy_id,DR_BATTLE_ENEMY.HURT,[{ damgage : damg  }]);
			}
		}
	}
	knife_is_done = true;
}

