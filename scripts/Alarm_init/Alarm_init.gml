// 自定义闹钟系统

/// 初始化全局闹钟表
function MyAlarm_init(){
    global._gmu_alarm = ds_map_create();
    //global._gmu_alarm = [];
}
function MyAlarm_Get(ID){
	return ds_map_find_value(global._gmu_alarm, ID);
}
function MyAlarm_Exists(ID){
	
}
/// 添加一个闹钟
	function MyAlarm_Add(ID = "Alarm " + string(random_range(0,100)), EVENT = function(){} , TIME , START = true , REPEAT = 1, LOOP = false, EQUAL_ROOM = true, ROOM_ID = room){
    live_ext
	///@agg 计时器ID
	///@arg事件
	///@时间
	///@是否开始
	///@重复多少次
	///@重复
	///@房间一致？
	
	// ---- 创建一个要执行的事件
	var myTimeEvent = function(ID, EQUAL_ROOM , ROOM, EVENT, LOOP){
        // 只在房间一致时执行事件
        if (room == ROOM and EQUAL_ROOM) {
            EVENT();
			//show_message("2")
        }
        // 如果不是循环，事件执行后销毁
		var myTimeSource = ds_map_find_value(global._gmu_alarm, ID);
		var resp = time_source_get_reps_remaining(myTimeSource);
        if (LOOP == false or resp == 0) {
            MyAlarm_Destroy(ID);
        }
    }
	// ---- 创建计时器对象
	var par = time_source_game;
	var unit = time_source_units_frames;
    var myTimeSource = time_source_create(par, TIME , unit , myTimeEvent, [ID , EQUAL_ROOM , ROOM_ID, EVENT, LOOP], REPEAT, time_source_expire_after
    );
	//ds_map_add(global._gmu_alarm,ID,myTimeSource)
	if(!ds_map_exists(global._gmu_alarm,ID)){	
		ds_map_add(global._gmu_alarm,ID,myTimeSource)
		if(START){
			MyAlarm_Start(ID);
		}
		return ID
	}
	else{
		MyAlarm_Destroy(ID);
		ds_map_add(global._gmu_alarm,ID,myTimeSource)
		if(START){
			MyAlarm_Start(ID);
		}
		return ID
	}
	//if(!ds_map_exists(global._gmu_alarm,ID)){	
	//	ds_map_add(global._gmu_alarm,ID,myTimeSource)
	//	if(START){
	//		MyAlarm_Start(ID);
	//	}
	//	return ID
	//}
	//else{
	//	MyAlarm_Destroy(ID);
	//	ds_map_add(global._gmu_alarm,ID,myTimeSource)
	//	if(START){
	//		MyAlarm_Start(ID);
	//	}
	//	return ID
	//}
	show_message(ID + " : 闹钟添加失败！") 
	
	return "false"
  
}

/// 销毁指定ID的闹钟
function MyAlarm_Destroy(ID){
    if (ds_map_exists(global._gmu_alarm, ID)) {
        var myTimeSource = ds_map_find_value(global._gmu_alarm, ID);
        time_source_destroy(myTimeSource);
		show_debug_message("计时器" + string(time_source_exists(myTimeSource))+ ":" )
		ds_map_delete(global._gmu_alarm, ID);
		show_debug_message(string(ID)+ ": 已删除")
        return !ds_map_exists(global._gmu_alarm,ID)
    }
    return false;
}

/// 启动指定ID的闹钟
function MyAlarm_Start(ID){
    if (ds_map_exists(global._gmu_alarm, ID)) {
        var myTimeSource = MyAlarm_Get(ID)
        time_source_start(myTimeSource);
        return true;
    }
    return false;
}

/// 启动所有闹钟
function MyAlarm_StartAll(){
    var myKey = ds_map_find_first(global._gmu_alarm);
    while (myKey != undefined) {
        var myTimeSource = ds_map_find_value(global._gmu_alarm, myKey);
        time_source_start(myTimeSource);
        myKey = ds_map_find_next(global._gmu_alarm, myKey);
    }
}

/// 清除所有闹钟（不销毁ds_map本身）
function MyAlarm_Clear(){
    var myKey = ds_map_find_first(global._gmu_alarm);
    var myKeyList = [];
    while (myKey != undefined) {
        array_push(myKeyList, myKey);
        myKey = ds_map_find_next(global._gmu_alarm, myKey);
    }
    for (var i = 0; i < array_length(myKeyList); i++) {
        MyAlarm_Destroy(myKeyList[i]);
    }
}

/// 
function MyAlarm_Uninit(){
    MyAlarm_Clear();
    return ds_map_destroy(global._gmu_alarm);
}
// 自定义闹钟系统

///// 初始化全局闹钟表
//function MyAlarm_init(){
//    //global._gmu_alarm = ds_map_create();
//    global._gmu_alarm = [];
//}
//function MyAlarm_GetAlarm(ID){
//	var _gmu = global._gmu_alarm
//	for(var i =0; i < array_length(_gmu) ; i++){
//		var arm = _gmu[i];
//		if(arm[0] == ID){
//			return arm[1];	
//		}
//	}
//}
//function MyAlarm_Exists(ID){
//	var _gmu = global._gmu_alarm
//	for(var i =0; i < array_length(_gmu) ; i++){
//		var arm = _gmu[i];
//		if(arm[0] == ID and array_length(arm) != 1){
//			return true;
//		}
//	}
//}
///// 添加一个闹钟
//	function MyAlarm_Add(ID = "Alarm " + string(random_range(0,100)), EVENT = function(){} , TIME , START = true , REPEAT = 1, LOOP = false, EQUAL_ROOM = true, ROOM_ID = room){
//    live_ext
//	///@agg 计时器ID
//	///@arg事件
//	///@时间
//	///@是否开始
//	///@重复多少次
//	///@重复
//	///@房间一致？
	
//	// ---- 创建一个要执行的事件
//	var myTimeEvent = function(ID, EQUAL_ROOM , ROOM, EVENT, LOOP){
//        // 只在房间一致时执行事件
//        if (room == ROOM and EQUAL_ROOM) {
//            EVENT();
//			//show_message("2")
//        }
//        // 如果不是循环，事件执行后销毁
//		var myTimeSource = MyAlarm_GetAlarm(ID)
//		var resp = time_source_get_reps_remaining(myTimeSource);
//        if (LOOP == false or resp == 0) {
//            MyAlarm_Destroy(ID);
//        }
//    }
//	// ---- 创建计时器对象
//	var par = time_source_game;
//	var unit = time_source_units_frames;
//    var myTimeSource = time_source_create(par, TIME , unit , myTimeEvent, [ID , EQUAL_ROOM , ROOM_ID, EVENT, LOOP], REPEAT, time_source_expire_after
//    );
//	//ds_map_add(global._gmu_alarm,ID,myTimeSource)
//	if(!MyAlarm_Exists(ID)){	
//		var alarm_array = [ID,myTimeSource]
//		array_push(global._gmu_alarm,alarm_array)
//		if(START){
//			MyAlarm_Start(ID);
//		}
//		return ID
//	}
//	else{
//		MyAlarm_Destroy(ID);
//		var alarm_array = [ID,myTimeSource]
//		array_push(global._gmu_alarm,alarm_array)
//		if(START){
//			MyAlarm_Start(ID);
//		}
//		return ID
//	}
//	//if(!ds_map_exists(global._gmu_alarm,ID)){	
//	//	ds_map_add(global._gmu_alarm,ID,myTimeSource)
//	//	if(START){
//	//		MyAlarm_Start(ID);
//	//	}
//	//	return ID
//	//}
//	//else{
//	//	MyAlarm_Destroy(ID);
//	//	ds_map_add(global._gmu_alarm,ID,myTimeSource)
//	//	if(START){
//	//		MyAlarm_Start(ID);
//	//	}
//	//	return ID
//	//}
//	show_message(ID + " : 闹钟添加失败！") 
	
//	return "false"
  
//}

///// 销毁指定ID的闹钟
//function MyAlarm_Destroy(ID){
//    //if (MyAlarm_Exists(ID)) {
//    //    var myTimeSource = MyAlarm_GetAlarm(ID);
//    //    time_source_destroy(myTimeSource);
		
//	//	show_debug_message(string(ID)+ ": 已删除")
//    //    return !MyAlarm_Destroy(ID)
//    //}
//	var _gmu = global._gmu_alarm
//	for(var i =0; i < array_length(_gmu) ; i++){
//		var arm = _gmu[i];
//		if(arm[0] == ID){
//			time_source_destroy(arm[1]);
//			array_delete(_gmu,i,1);
//		}
//	}
//    return false;
//}

///// 启动指定ID的闹钟
//function MyAlarm_Start(ID){
//    if (MyAlarm_Exists(ID)) {
//        var myTimeSource = MyAlarm_GetAlarm(ID)
//        time_source_start(myTimeSource);
//        return true;
//    }
//    return false;
//}

///// 启动所有闹钟
//function MyAlarm_StartAll(){
//    //var myKey = ds_map_find_first(global._gmu_alarm);
//    //while (myKey != undefined) {
//    //    var myTimeSource = ds_map_find_value(global._gmu_alarm, myKey);
//    //    time_source_start(myTimeSource);
//    //    myKey = ds_map_find_next(global._gmu_alarm, myKey);
//    //}
//}

///// 清除所有闹钟
//function MyAlarm_Clear(){
//    //var myKey = ds_map_find_first(global._gmu_alarm);
//    //var myKeyList = [];
//    //while (myKey != undefined) {
//    //    array_push(myKeyList, myKey);
//    //    myKey = ds_map_find_next(global._gmu_alarm, myKey);
//    //}
//    //for (var i = 0; i < array_length(myKeyList); i++) {
//    //    MyAlarm_Destroy(myKeyList[i]);
//    //}
//	var _gmu = global._gmu_alarm
//	for(var i = 0; i < array_length(_gmu) ; i++){
//		var arm = _gmu[i];
//		time_source_destroy(arm[1]);
//	}
//	global._gmu_alarm = [];
	
//	return true;
//}

///// 和MyAlarm_Clear没啥区别
//function MyAlarm_Uninit(){
//    return MyAlarm_Clear();
//}