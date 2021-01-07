function draw_scrollbar(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {
	// draw_scrollbar(id, x, y, slotwh, slots, maxslots, cantscroll, window)
	var i, xx, yy, swh, s, ms, mwh, bwh, bpos, ind, locked, cantscroll, win;
	i = argument0
	xx = argument1
	yy = argument2
	swh = argument3
	s = argument4
	ms = argument5
	cantscroll = argument6
	win = argument7
	mwh = swh * s
	bwh = max(10, (s / ms) * (s * swh))
	bpos = (sb_val[i] / ms) * (s * swh)
	locked = (ms <= s || (marker_follow = 1 && i = scrollbarh && playing = 1))
	if (locked) cantscroll = 1

	//Horizontal scrollbar
	if (sb_dir[i] = 0) {
	    if (sb_sel = i && sb_drag = -1 && (window = 0 || win = 1) && cantscroll = 0) {
	        sb_val[i] += mouse_wheel_down() - mouse_wheel_up()
	        sb_val[i] = median(0, sb_val[i], ms - s)
	        bpos = (sb_val[i] / ms) * (s * swh)
	    }
	    if (!mouse_check_button(mb_left)) {
	        sb_press[i] = 0
	    }
	    if (sb_drag = i) {
	        if (!mouse_check_button(mb_left)) {
	            if (win = 0) window = 0
	            sb_drag = -1
	            sb_val[i] = round(sb_val[i])
	        } else {
	            sb_val[i] += (mouse_x - sb_mprev) / (mwh / ms)
	            sb_val[i] = median(0, sb_val[i], ms - s)
	            sb_mprev = mouse_x
	            bpos = (sb_val[i] / ms) * (s * swh)
	        }
	    }
	    sb_val[i] = median(0, sb_val[i], ms - s)
	    bpos = floor(bpos)
    
		// Background
	    draw_sprite_ext(spr_scrollbar_h_background, theme, xx, yy, mwh + 32, 1, 0, -1, 1)
    
		// Bar
	    if (!locked) {
	        ind = 0
	        if (mouse_rectangle(xx + 16 + bpos, yy, bwh, 16) && sb_drag = -1 && (window = 0 || win = 1)) {
	            ind += 1
	            if (mouse_check_button_pressed(mb_left)) {
	                sb_sel = i
	                sb_drag = i
	                if (win = 0) window = w_drag
	                sb_mprev = mouse_x
	            }
	        }
	        if (sb_drag = i) ind = 2
		
			draw_sprite_ext(spr_scrollbar_h_bar_fill,(theme * 3) + ind, xx + 20 + bpos, yy, floor(bwh) - 4, 1, 0, -1, 1)
			draw_sprite(spr_scrollbar_h_bar_left, (theme * 3) + ind, xx + 17 + bpos, yy)
			draw_sprite(spr_scrollbar_h_bar_right, (theme * 3) + ind, xx + 17 + bpos + ceil(bwh - 2), yy)	
			if (bwh > 20) draw_sprite(spr_scrollbar_h_bar_handle, (theme * 3) + ind, xx + 17 + floor(bpos + bwh / 2 - 8), yy)
		
	    }
	    if (mouse_rectangle(xx + 16, yy, bpos, 16) && locked = 0 && (window = 0 || win = 1) && sb_drag = -1) {
	        if (mouse_check_button(mb_left))  {
	            sb_press[i] -= 1
	            sb_sel = i
	            if (sb_press[i] = -1) {
	                sb_press[i] = 20
	                sb_val[i] -= s
	                sb_val[i] = median(0, sb_val[i], ms - s)
	            } else if (sb_press[i] = 0) {
	                sb_press[i] = 3
	                sb_val[i] -= s
	                sb_val[i] = median(0, sb_val[i], ms - s)
	            }
	        }
	    }
	    if (mouse_rectangle(xx + 16 + bpos + bwh, yy, mwh - (bpos + bwh), 16) && locked = 0 && (window = 0 || win = 1) && sb_drag = -1) {
	        if (mouse_check_button(mb_left))  {
	            sb_press[i] -= 1
	            sb_sel = i
	            if (sb_press[i] = -1) {
	                sb_press[i] = 20
	                sb_val[i] += s
	                sb_val[i] = median(0, sb_val[i], ms - s)
	            } else if (sb_press[i] = 0) {
	                sb_press[i] = 3
	                sb_val[i] += s
	                sb_val[i] = median(0, sb_val[i], ms - s)
	            }
	        }
	    }
	    // Buttons
	    ind = 0
	    if ((mouse_rectangle(xx, yy, 32 + mwh, 16) && !locked && (window = 0 || win = 1) && sb_drag = -1) || sb_drag = i) {
	        ind += 1
	        if (mouse_rectangle(xx, yy, 16, 16) && sb_drag = -1) {
	            ind += 1
	            if (mouse_check_button(mb_left))  {
	                ind += 1
	                sb_press[i] -= 1
	                sb_sel = i
	                if (sb_press[i] = -1) {
	                    sb_press[i] = 20
	                    sb_val[i] -= 1
	                    sb_val[i] = median(0, sb_val[i], ms - s)
	                } else if (sb_press[i] = 0) {
	                    sb_press[i] = 3
	                    sb_val[i] -= 1
	                    sb_val[i] = median(0, sb_val[i], ms - s)
	                }
	            }
	        }
	    }
	
	    draw_sprite(spr_scrollbar_h_button_left, (theme * 4) + ind, xx, yy)
	
	    ind = 0
	    if ((mouse_rectangle(xx, yy, 32 + mwh, 16) && !locked && (window = 0 || win = 1) && sb_drag = -1) || sb_drag = i) {
	        ind += 1
	        if (mouse_rectangle(xx + mwh + 16, yy, 16, 16) && sb_drag = -1) {
	            ind += 1
	            if (mouse_check_button(mb_left))  {
	                ind += 1
	                sb_press[i] -= 1
	                sb_sel = i
	                if (sb_press[i] = -1) {
	                    sb_press[i] = 20
	                    sb_val[i] += 1
	                    sb_val[i] = median(0, sb_val[i], ms - s)
	                } else if (sb_press[i] = 0) {
	                    sb_press[i] = 3
	                    sb_val[i] += 1
	                    sb_val[i] = median(0, sb_val[i], ms - s)
	                }
	            }
	        }
	    }
	    draw_sprite(spr_scrollbar_h_button_right, (theme * 4) + ind, xx + mwh + 16, yy)
	} 

	//Vertical scrollbar
	else {
	    if (sb_sel = i && sb_drag = -1 && (window = 0 || win = 1) && cantscroll = 0) {
	        sb_val[i] += mouse_wheel_down() - mouse_wheel_up()
	        sb_val[i] = median(0, sb_val[i], ms - s)
	        bpos = (sb_val[i] / ms) * (s * swh)
	    }
	    if (!mouse_check_button(mb_left)) {
	        sb_press[i] = 0
	    }
	    if (sb_drag = i) {
	        if (!mouse_check_button(mb_left)) {
	            if (win = 0) window = 0
	            sb_drag = -1
	            sb_val[i] = round(sb_val[i])
	        } else {
	            sb_val[i] += (mouse_y - sb_mprev) / (mwh / ms)
	            sb_val[i] = median(0, sb_val[i], ms - s)
	            sb_mprev = mouse_y
	            bpos = (sb_val[i] / ms) * (s * swh)
	        }
	    }
	    sb_val[i] = median(0, sb_val[i], ms - s)
	    bpos = floor(bpos)
	    // Background
	    draw_sprite_ext(spr_scrollbar_v_background, theme, xx, yy, 1, mwh + 32, 0, -1, 1)
	    // Bar
	    if (!locked) {
	        ind = 0
	        if (mouse_rectangle(xx, yy + 16 + bpos, 16, bwh) && sb_drag = -1 && (window = 0 || win = 1)) {
	            ind += 1
	            if (mouse_check_button_pressed(mb_left)) {
	                sb_sel = i
	                sb_drag = i
	                if (win = 0) window = w_drag
	                sb_mprev = mouse_y
	            }
	        }
	        if (sb_drag = i) ind = 2
		
			draw_sprite_ext(spr_scrollbar_v_bar_fill,(theme * 3) + ind, xx, yy + 20 + bpos, 1, floor(bwh) - 6, 0, -1, 1)
			draw_sprite(spr_scrollbar_v_bar_up, (theme * 3) + ind, xx, yy + 17 + bpos)
			draw_sprite(spr_scrollbar_v_bar_down, (theme * 3) + ind, xx, yy + 17 + bpos + ceil(bwh - 6))	
			if (bwh > 20) draw_sprite(spr_scrollbar_v_bar_handle, (theme * 3) + ind, xx, yy + 17 + bpos + floor(bwh / 2) - 8)
		
	    }
	    if (mouse_rectangle(xx, yy + 16, 16, bpos) && locked = 0 && (window = 0 || win = 1) && sb_drag = -1) {
	        if (mouse_check_button(mb_left))  {
	            sb_press[i] -= 1
	            sb_sel = i
	            if (sb_press[i] = -1) {
	                sb_press[i] = 10
	                sb_val[i] -= s
	                sb_val[i] = median(0, sb_val[i], ms - s)
	            } else if (sb_press[i] = 0) {
	                sb_press[i] = 2
	                sb_val[i] -= s
	                sb_val[i] = median(0, sb_val[i], ms - s)
	            }
	        }
	    }
	    if (mouse_rectangle(xx, yy + 16 + bpos + bwh, 16, mwh - (bpos + bwh)) && locked = 0 && (window = 0 || win = 1) && sb_drag = -1) {
	        if (mouse_check_button(mb_left))  {
	            sb_press[i] -= 1
	            sb_sel = i
	            if (sb_press[i] = -1) {
	                sb_press[i] = 10
	                sb_val[i] += s
	                sb_val[i] = median(0, sb_val[i], ms - s)
	            } else if (sb_press[i] = 0) {
	                sb_press[i] = 2
	                sb_val[i] += s
	                sb_val[i] = median(0, sb_val[i], ms - s)
	            }
	        }
	    }
	    // Buttons
	    ind = 0
	    if ((mouse_rectangle(xx, yy, 16, 32 + mwh) && !locked && (window = 0 || win = 1) && sb_drag = -1) || sb_drag = i) {
	        ind += 1
	        if (mouse_rectangle(xx, yy, 16, 16) && sb_drag = -1) {
				ind += 1
	            if (mouse_check_button(mb_left))  {
	                ind += 1
	                sb_press[i] -= 1
	                sb_sel = i
	                if (sb_press[i] = -1) {
	                    sb_press[i] = 10
	                    sb_val[i] -= 1
	                    sb_val[i] = median(0, sb_val[i], ms - s)
	                } else if (sb_press[i] = 0) {
	                    sb_press[i] = 2
	                    sb_val[i] -= 1
	                    sb_val[i] = median(0, sb_val[i], ms - s)
	                }
	            }
	        }
	    }
	    draw_sprite(spr_scrollbar_v_button_up, (theme * 4) + ind, xx, yy)
	
	    ind = 0
	    if ((mouse_rectangle(xx, yy, 16, 32 + mwh) && !locked && (window = 0 || win = 1) && sb_drag = -1) || sb_drag = i) {
	        ind += 1
	        if (mouse_rectangle(xx, yy + mwh + 16, 16, 16) && sb_drag = -1) {
				ind += 1
	            if (mouse_check_button(mb_left))  {
	                ind += 1
	                sb_press[i] -= 1
	                sb_sel = i
	                if (sb_press[i] = -1) {
	                    sb_press[i] = 10
	                    sb_val[i] += 1
	                    sb_val[i] = median(0, sb_val[i], ms - s)
	                } else if (sb_press[i] = 0) {
	                    sb_press[i] = 2
	                    sb_val[i] += 1
	                    sb_val[i] = median(0, sb_val[i], ms - s)
	                }
	            }
	        }
	    }
	    draw_sprite(spr_scrollbar_v_button_down, (theme * 4) + ind, xx, yy + mwh + 16)
	}
	return round(sb_val[i])



}
