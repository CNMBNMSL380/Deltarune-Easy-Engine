/// @description 主要表面预处理
live;
if!(surface_exists(_surface_main)){
	_surface_main = surface_create(display_get_width(),display_get_height());
}
if (! surface_exists(sf)) {
	sf = surface_create(sf_width, sf_height);
}

surface_set_target(_surface_main);{
	draw_clear_alpha(0, 0);
}surface_reset_target();
