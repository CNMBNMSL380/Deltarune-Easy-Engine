function Player_GetKillsTotal(){
    return array_sum(Flag_Get(FLAG_STATIC,"kills",[[0]]));
}