function draw_tab(argument0) {
	// draw_tab(str)
	var a, xx, w, str, ismenu;
	str = argument0
	xx = tab_x
	yy = 1
	w = string_width(str) + 12
	tab_x += w
	a = ((mouse_rectangle(xx, yy, w, 18)) && window = 0 && sb_drag = -1)
	a += (a && (mouse_check_button(mb_left)))
	ismenu = (menu_shown = string_lower(str))
	if (a > 0 || ismenu) {
	    draw_sprite(spr_tabframe, 0 + 3 * (a = 2  || ismenu) + 6 * theme, xx, yy)
	    draw_sprite_ext(spr_tabframe, 1 + 3 * (a = 2 || ismenu) + 6 * theme, xx + 3, yy, (w - 6) / 3, 1, 0, -1, 1)
	    draw_sprite(spr_tabframe, 2 + 3 * (a = 2 || ismenu) + 6 * theme, xx + w - 3, yy)
	}
	draw_text(xx + 6 + (a = 2 || ismenu), yy + 2 + (a = 2 || ismenu), str)
	return (a && mouse_check_button(mb_left))



}
