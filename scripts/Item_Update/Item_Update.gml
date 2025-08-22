function Item_Update() {
	Flag_GetStorage(FLAG_STATIC).Get("item").Sort();
	return true;
}
