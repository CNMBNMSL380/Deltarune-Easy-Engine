event_inherited();

battle_mod = 1

char_id=100;
char_friend_id = 0;
battle_obj = noone;



idle_sprite = [spr_default,spr_default,spr_default,spr_default];
move_sprite = [spr_default,spr_default,spr_default,spr_default];
run_sprite = move_sprite


res_idle_sprite[DIR.UP]=idle_sprite[0];
res_idle_sprite[DIR.DOWN]=idle_sprite[1];
res_idle_sprite[DIR.LEFT]=idle_sprite[2];
res_idle_flip_x[DIR.LEFT]=false;
res_idle_sprite[DIR.RIGHT]=idle_sprite[3];

res_move_sprite[DIR.UP]=move_sprite[0]
res_move_sprite[DIR.DOWN]=move_sprite[1];
res_move_sprite[DIR.LEFT]=move_sprite[2];
res_move_flip_x[DIR.LEFT]=false;
res_move_sprite[DIR.RIGHT]=move_sprite[3];


move_speed[DIR.UP]=1.5;
move_speed[DIR.DOWN]=1.5;
move_speed[DIR.LEFT]=1.5;
move_speed[DIR.RIGHT]=1.5;

block_enabled = false
collision = false

run = 0