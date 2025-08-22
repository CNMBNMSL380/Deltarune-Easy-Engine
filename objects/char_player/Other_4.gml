alarm[0]=1;

var warp_landmark=Flag_Get(FLAG_TEMP,"trigger_warp_landmark");
var warp_dir=Flag_Get(FLAG_TEMP,"trigger_warp_dir")

if(warp_landmark!=-1&&instance_exists(hint_landmark)){
	var lx=x;
	var ly=y;
	with(hint_landmark){
		if(landmark_id==warp_landmark){
			lx=x;
			ly=y;
		}
	}
	x=lx;
	y=ly;
}
if(warp_dir!=-1){
	dir=warp_dir;
}

Flag_Set(FLAG_TEMP,"trigger_warp_landmark",-1);
Flag_Set(FLAG_TEMP,"trigger_warp_dir",-1);

if(array_length(follower) > 0){
	//循环，第一步检查跟随对象的大小
	for(i=0;i<array_length(follower);i+=1){
		if(!instance_exists(follower[i])){
			inst_follower[i] = instance_create_depth(x,y-1,0,follower[i]);
			inst_follower[i].dir = char_player.dir;
			inst_follower[i].char_friend_id = i;
		}
	}

	ds_list_clear(moves)
	repeat(follow_delay*array_length(follower)){
		ds_list_add(moves,[0,0,0,0,0]);
	}
	ds_list_clear(pos)
	repeat(follow_delay*array_length(follower)){
		ds_list_add(pos,[x,y]);
	}
}