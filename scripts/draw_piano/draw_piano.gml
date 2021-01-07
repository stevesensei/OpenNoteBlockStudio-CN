function draw_piano(argument0, argument1, argument2, argument3) {
	// draw_piano(x, y, keys, totalcols)
	var a, b, c, d, t, out, xx, yy, k, alpha, down, c1, c2, k1, k2, showclicks1, showclicks2, col, selectedkey, totalcols;
	draw_set_color(0)
	xx = argument0
	yy = argument1
	k = argument2
	totalcols = argument3
	b = 0
	d = -1
	selectedkey = -1
	alpha = max(0, 3 - startkey)
	midi_devices = midi_input_devices()
	for (a = 0; a < midi_devices; a += 1) {
	    midi_keys[a] = midi_input_key_presses(a)
	    midi_releases[a] = midi_input_key_releases(a)
	}
	for (a = 0; a < k; a += 1) {
	    c = (startkey + a) mod 7
	    if (a > 0 && c != 2 && c != 5) { // Sharp key to the left
	        c1 = startkey + sharpkeys + b
	        c2 = startkey + sharpkeys + b + 1
	        k1 = piano_key[c1] > 0
	        k2 = piano_key[c2] > 0
	        if (window = 0 && mouse_rectangle(xx + 39 * a, yy, 39, 128)) {
	            if (!mouse_rectangle(xx + 39 * a - 12, yy - 7, 25, 71) && (!mouse_rectangle(xx + 39 * a + 27, yy - 7, 25, 71) || (a = k - 1 || c = 1 || c = 4))) {
	                if (show_notechart && c2 > 6 && c2 < 69 && playing = 0) draw_notechart(xx + 39 * a + 18, yy - 32, startkey + a, 0)
	                if (mouse_check_button_pressed(mb_right) && show_keyboard) key_edit = c2
	                // Check mouse clicks
	                t = key_click[c2]
	                key_click[c2] = (mouse_check_button(mb_left))
	                if (t = 0 && key_click[c2]) {
	                    selectedkey = c2
	                    play_sound(instrument, c2, 100 ,100, 0)
	                }
	                if (a = k - 1) d = 1
	                if (a = 0) d = 0
	            } else {
	                key_click[c2] = 0
	            }
	        } else {
	            key_click[c2] = 0
	        }
	        if (window = 0 && mouse_rectangle(xx + 39 * a - 12, yy - 7, 25, 71)) {
	            if (show_keynumbers && c1 > 6 && c1 < 70 && playing = 0) draw_notechart(xx + 39 * a - 12 + 12, yy - 32, startkey + a - 1, 1)
	            if (mouse_check_button_pressed(mb_right) && show_keyboard) key_edit = c1
	            t = key_click[c1]
	            key_click[c1] = mouse_check_button(mb_left)
	            if (t = 0 && key_click[c1]) {
	                selectedkey = c1
	                play_sound(instrument, c1, 100 ,100, 0)
	            }
	        } else {
	            key_click[c1] = 0
	        }
	        // White
	        out = (c2 < 33 || c2 > 57)
			showclicks2 = !out && show_keynumbers
	        col = c_white
	        down[1] = 0
	        if (show_outofrange && out) col = 8224255
	        if (selected_key = c2 && playing = 0) col = 16753828
	        if (current_time - key_played[c2] < 300) {col = merge_color(col, c_yellow, 1 - (current_time - key_played[c2]) / 300) down[1] = ((current_time - key_played[c2]) / 300) * 2 if (down[1] > 1) down[1] = 2 - down[1] down[1] = floor(down[1] * 3) / 3}
	        if (key_midipress[c2] || key_press[c2] || key_click[c2]) down[1] = 0.75
	        draw_sprite_ext(spr_piano, 0, xx + 39 * a, yy + floor(7 * down[1]), 1, 1, 0, col, 1)
	        if (alpha < 3) draw_sprite_ext(spr_piano, 3, xx + 39 * a, yy + floor(7 * down[1]), 1, 1, 0, window_background, 0.8 - alpha / 3)
	        // Black
	        down[0] = 0
	        out = (c1 < 33 || c1 > 57)
			showclicks1 = !out && show_keynumbers
	        col = c_white
	        if (show_outofrange && out) col = 8224255
	        if (selected_key = c1 && playing = 0) col = 16753828
	        if (current_time - key_played[c1] < 300) {col = merge_color(col, c_yellow, 1 - (current_time - key_played[c1]) / 300) down[0] = ((current_time - key_played[c1]) / 300) * 2 if (down[0] > 1) down[0] = 2 - down[0] down[0] = floor(down[0] * 3) / 3}
	        if (key_midipress[c1] || key_press[c1] || key_click[c1]) down[0] = 0.75
	        draw_sprite_ext(spr_piano, 2, xx + 39 * a - 19, yy - 7, 1, 1, 0, col, 1)
	        if (alpha < 3) draw_sprite_ext(spr_piano, 5, xx + 39 * a - 19, yy - 7, 1, 1, 0, window_background, 0.8 - alpha / 3)
	        draw_sprite_ext(spr_piano, 1, xx + 39 * a - 19, yy - 7 + floor(7 * down[0]), 1, 1, 0, col, 1)
	        if (alpha < 3) draw_sprite_ext(spr_piano, 4, xx + 39 * a - 19, yy - 7 + floor(7 * down[0]), 1, 1, 0, window_background, 0.8 - alpha / 3)
	        // Text
	        draw_set_alpha(alpha / 3)
	        draw_set_halign(fa_center)
	        if (show_keynames) {
	            draw_set_font(fnt_mainbold)
	            draw_set_color(0)
	            draw_text(xx + 39 * a + 20, yy + 85 + floor(7 * down[1]) - 4 * (k2 && show_keyboard) - 4 * (k1 && show_keyboard && showclicks2) - 6 * (showclicks2), get_keyname(c2, 1))
	            draw_set_color(c_white)
	            draw_text(xx + 39 * a, yy + 24 + floor(7 * down[0]) - 4 * (k1 && show_keyboard) - 4 * (k1 && show_keyboard && showclicks1) - 6 * (showclicks1), get_keyname(c1, 1))
	        }
			draw_set_font(fnt_mainbold)
			if (showclicks2) {
				draw_set_color(0)
				draw_text(xx + 39 * a + 20, yy + 85 + 5 + floor(7 * down[1]) - 8 * (k2 && show_keyboard), string(c2 - 33))
			}
			if (showclicks1) {
				draw_set_color(c_white)
				draw_text(xx + 39 * a, yy + 24 + 5 + floor(7 * down[0]) - 8 * (k1 && show_keyboard), string(c1 - 33))
			}
			draw_set_font(fnt_main)
	        if (k2) {
	            if (show_keyboard) {
	                draw_set_color(0)
	                if ((editline mod 15) < 7 || key_edit != c2) draw_text(xx + 39 * a + 20, yy + 95 + floor(7 * down[1]), chr(piano_key[c2]))
	            }
	        }
	        if (k1) {
	            if (show_keyboard) {
	                draw_set_color(c_white)
	                if ((editline mod 15) < 7 || key_edit != c1) draw_text(xx + 39 * a, yy + 34 + floor(7 * down[0]), chr(piano_key[c1]))
	            }
	        }
	        draw_set_halign(fa_left)
	        b += 2
	    } else { // No sharp keys
	        c1 = startkey + sharpkeys + b
	        k1 = piano_key[c1] > 0
	        if (window = 0 && mouse_rectangle(xx + 39 * a, yy, 39, 128)) {
	            if (!mouse_rectangle(xx + 39 * a + 27, yy - 7, 25, 71) || (a = k - 1 || c = 1 || c = 4)) {
	                if (show_notechart && c1 > 6 && c1 < 69 && playing = 0) draw_notechart(xx + 39 * a + 18, yy - 32, startkey + a, 0)
	                if (mouse_check_button_pressed(mb_right) && show_keyboard) key_edit = c1
	                t = key_click[c1]
	                key_click[c1] = mouse_check_button(mb_left)
	                if (t = 0 && key_click[c1]) {
	                    selectedkey = c1
	                    play_sound(instrument, c1, 100 ,100, 0)
	                }
	                if (a = k - 1) d = 1
	                if (a = 0) d = 0
	            } else {
	                key_click[c1] = 0
	            }
	        } else {
	            key_click[c1] = 0
	        }
	        out = (c1 < 33 || c1 > 57)
			showclicks1 = !out && show_keynumbers
	        col = c_white
	        down = 0
	        if (show_outofrange && out) col = 8224255
	        if (selected_key = c1 && playing = 0) col = 16753828
	        if (current_time - key_played[c1] < 300) {col = merge_color(col, c_yellow, 1 - (current_time - key_played[c1]) / 300) down = ((current_time - key_played[c1]) / 300) * 2 if (down > 1) down = 2 - down down = floor(down * 3) / 3}
	        if (key_midipress[c1] || key_press[c1] || key_click[c1]) down = 0.75
	        draw_sprite_ext(spr_piano, 0, xx + 39 * a, yy + floor(7 * down), 1, 1, 0, col, 1)
	        if (alpha < 3) draw_sprite_ext(spr_piano, 3, xx + 39 * a, yy + floor(7 * down), 1, 1, 0, window_background, 0.8 - alpha / 3)
	        // Text
	        draw_set_alpha(alpha / 3)
	        draw_set_halign(fa_center)
	        if (show_keynames) {
	            draw_set_color(0)
	            draw_set_font(fnt_mainbold)
	            draw_text(xx + 39 * a + 20, yy + 85 + floor(7 * down) - 4 * (k1 && show_keyboard) - 4 * (k1 && show_keyboard && showclicks1) - 6 * showclicks1, get_keyname(c1, 1))
	        }
			if (showclicks1) {
				draw_set_font(fnt_mainbold)
				draw_set_color(0)
				draw_text(xx + 39 * a + 20, yy + 85 + 5 + floor(7 * down) - 8 * (k1 && show_keyboard), string(c1 - 33))
			}
			draw_set_font(fnt_main)
	        if (k1) {
	            if (show_keyboard) {
	                draw_set_color(0)
	                if ((editline mod 15) < 7 || key_edit != c1) draw_text(xx + 39 * a + 20, yy + 95 + floor(7 * down), chr(piano_key[c1]))
	            }
	        }
	        draw_set_halign(fa_left)
	        draw_set_alpha(1)
	        b += 1
	    }
	    if (a < 3 && alpha < 3) alpha += 1
	    if (a > k - min(5, 54 - (startkey + k))) alpha -= 1
	}
	if (selectedkey > -1) selected_key = selectedkey
	draw_set_alpha(1)
	if (d = 0 && startkey > 0 && !mouse_check_button(mb_left)) {
	    a = startkey mod 7
	    if (delay = 0) {
	        sharpkeys -= (a != 2 && a != 5)
	        startkey -= 1
	        delay = 2
	    }
	}
	if (d = 1 && !mouse_check_button(mb_left)) {
	    a = startkey mod 7
	    if (delay = 0 && startkey + k < 52) {
	        sharpkeys += (a != 1 && a != 4)
	        startkey += 1
	        delay = 2
	    }
	}
	// Check key presses
	if (window = 0 && text_focus = -1 && key_edit = -1 && !keyboard_check(vk_control)) {
	for (a = 0; a <= 87; a += 1) {
	    if (piano_key[a] > 0) {
	        if (key_press[a] = 0 && keyboard_check(piano_key[a])) {
	            if (select_lastpressed) selected_key = a
	            if (record = 0) play_sound(instrument, a, 100 ,100, 0)
	            if (playing = 0.25) toggle_playing(totalcols)
	            if (playing && record) {
	                b = 0
	                while (!add_block_manual(ceil(marker_pos), b, instrument, a, 100, 100, 0)) b += 1
	                song_played[round(marker_pos), b] = current_time
	            }
	        }
	        key_press[a] = keyboard_check(piano_key[a])
	    }
	    midi_input_set_key(a, totalcols)
	}
	}
	draw_set_color(0)



}
