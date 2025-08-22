/// @description 事件
live;

// Inherit the parent event
event_inherited();

/*
	一般UTE的框的遮挡是以block这个物体驱动的，依靠block来阻挡灵魂，
	但在dr里，战斗是直接在ow世界进行的，这意味着block必须分开，否则的话
	就会因为ow世界里的block阻挡灵魂前进，或者直接卡死在里面
*/

