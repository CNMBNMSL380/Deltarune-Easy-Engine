/// @description 事件
live;

// Inherit the parent event
event_inherited();

battle_mod = 0;
battle_charObj = dr_battle_enemy;


res_idle_sprite[DIR.UP]=spr_celiere_mod;
res_idle_sprite[DIR.DOWN]=spr_celiere_mod;
res_idle_sprite[DIR.LEFT]=spr_celiere_mod;
res_idle_sprite[DIR.RIGHT]=spr_celiere_mod
res_move_sprite[DIR.UP]=spr_celiere_mod;
res_move_sprite[DIR.DOWN]=spr_celiere_mod;
res_move_sprite[DIR.LEFT]=spr_celiere_mod;
res_move_sprite[DIR.RIGHT]=spr_celiere_mod;

move_speed[DIR.UP]=1.5;
move_speed[DIR.DOWN]=1.5;
move_speed[DIR.LEFT]=1.5;
move_speed[DIR.RIGHT]=1.5;
