function Player_IsInBattle() {
	return instance_exists(battle) or instance_exists(dr_battle_main);
}
