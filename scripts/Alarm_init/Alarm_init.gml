// 自定义闹钟系统

/// 初始化全局闹钟表
function MyAlarm_init(){
    global._gmu_alarm = ds_map_create();
}

/// 添加一个闹钟
function MyAlarm_Add(ID = "Alarm " + string(random_range(0,100)), EVENT = function(){} , TIME , START = true , REPEAT = 1, LOOP = false, EQUAL_ROOM = true, ROOM_ID = room){
    var myTimeEvent = function(ID, EQUAL_ROOM , ROOM, EVENT, LOOP){
        // 只在房间一致时执行事件
        if (room == ROOM and EQUAL_ROOM) {
            EVENT();
        }
        // 如果不是循环，事件执行后销毁
        if (!LOOP) {
            MyAlarm_Destroy(ID);
        }
    }
    var myTimeSource = time_source_create(
        time_source_game, TIME, time_source_units_frames,
        myTimeEvent, [ID , EQUAL_ROOM , ROOM_ID, EVENT, LOOP], REPEAT, time_source_expire_after
    );
	
	if(START){
		MyAlarm_Start(ID);
	}
    return ID
}

/// 销毁指定ID的闹钟
function MyAlarm_Destroy(ID){
    if (ds_map_exists(global._gmu_alarm, ID)) {
        var myTimeSource = ds_map_find_value(global._gmu_alarm, ID);
        time_source_destroy(myTimeSource);
        return ds_map_delete(global._gmu_alarm, ID);
    }
    return false;
}

/// 启动指定ID的闹钟
function MyAlarm_Start(ID){
    if (ds_map_exists(global._gmu_alarm, ID)) {
        var myTimeSource = ds_map_find_value(global._gmu_alarm, ID);
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

/// 完全卸载闹钟系统（包括ds_map本身）
function MyAlarm_Uninit(){
    MyAlarm_Clear();
    ds_map_destroy(global._gmu_alarm);
    global._gmu_alarm = undefined;
}