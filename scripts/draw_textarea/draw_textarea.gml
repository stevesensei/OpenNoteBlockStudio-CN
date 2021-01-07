function draw_textarea(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	// draw_textarea(id, x, y, w, h, val, str)
	var i, xx, yy, w, h, val, str, on;
	i = argument0
	xx = argument1
	yy = argument2
	w = argument3
	h = argument4
	val = argument5
	str = argument6
	draw_set_color(c_white)
	if(theme = 2) draw_set_color(3552822)
	draw_rectangle(xx, yy, xx + w, yy + h, 0)
	popup_set_window(xx, yy, w, h, str)

	on = mouse_rectangle(xx, yy, w, h)

	if (theme = 0) {
	    draw_sprite(spr_textbox, 0 + 8 * on, xx, yy)
	    draw_sprite_ext(spr_textbox, 1 + 8 * on, xx, yy + 2, 1, (h - 4) / 2, 0, -1, 1)
	    draw_sprite(spr_textbox, 2 + 8 * on, xx, yy + h - 2)
	    draw_sprite_ext(spr_textbox, 3 + 8 * on, xx + 2, yy + h - 2, (w - 4) / 2, 1, 0, -1, 1)
	    draw_sprite(spr_textbox, 4 + 8 * on, xx + w - 2, yy + h - 2)
	    draw_sprite_ext(spr_textbox, 5 + 8 * on, xx + w - 2, yy + 2, 1, (h - 4) / 2, 0, -1, 1)
	    draw_sprite(spr_textbox, 6 + 8 * on, xx + w - 2, yy)
	    draw_sprite_ext(spr_textbox, 7 + 8 * on, xx + 2, yy, (w - 4) / 2, 1, 0, -1, 1)
	} else {
	    draw_area(xx, yy, xx + w, yy + h)
	}
	draw_theme_color()
	return draw_text_edit(i, val, xx + 3, yy + 3, w - 6, h - 6, 0, 0)



}
