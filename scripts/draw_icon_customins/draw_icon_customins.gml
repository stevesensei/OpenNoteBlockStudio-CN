function draw_icon_customins(xx, yy, ins, alpha, large) {
	var display, num1, num2, color1, color2;
	display = (ins + 1) % 100
	num1 = floor(display / 10)
	num2 = display % 10
	color1 = make_color_hsv((ins * 16) % 256, 192, 255)
	color2 = make_color_hsv((ins * 16) % 256, 255, 128)
	if (large) {
		draw_sprite_ext(spr_instrumenticons, first_custom_index, xx, yy, 1, 1, 0, color1, alpha)
		draw_sprite_ext(spr_numbers_mc, num1, xx + 3, yy + 5, 1, 1, 0, color2, alpha)
		draw_sprite_ext(spr_numbers_mc, num2, xx + 9, yy + 5, 1, 1, 0, color2, alpha)
		draw_sprite_ext(spr_numbers_mc, num1, xx + 2, yy + 4, 1, 1, 0, -1, alpha)
		draw_sprite_ext(spr_numbers_mc, num2, xx + 8, yy + 4, 1, 1, 0, -1, alpha)
	} else {
		draw_sprite_ext(spr_icons, icons.CUSTOM_INS_OVERLAY, xx, yy, 1, 1, 0, color1, 1)
		draw_sprite_ext(spr_numbers, num1, xx + 12, yy + 13, 1, 1, 0, color2, 1)
		draw_sprite_ext(spr_numbers, num2, xx + 16, yy + 13, 1, 1, 0, color2, 1)
		draw_sprite(spr_numbers, num1, xx + 11, yy + 12)
		draw_sprite(spr_numbers, num2, xx + 15, yy + 12)
	}
}