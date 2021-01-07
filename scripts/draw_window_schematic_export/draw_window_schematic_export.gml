function draw_window_schematic_export() {
	// draw_window_schematic_export()
	var x1, y1, a, b, c, d, str, nsel, tabs, tabstr, tabw, tabtip, menun, menua, menub, block, blocks, c1, c2;
	curs = cr_default
	x1 = floor(window_width / 2 - 275)
	y1 = floor(window_height / 2 - 200)
	draw_window(x1, y1, x1 + 550, y1 + 400)
	draw_set_font(fnt_mainbold)
	draw_text(x1 + 8, y1 + 8, "Schematic Export")
	draw_set_font(fnt_main)

	b = 8
	str[0] = "Design"
	str[1] = "Blocks"
	nsel = -1
	menun = -1
	if (draw_checkbox(x1 + 12, y1 + 374, sch_exp_remember, "Remember changes", "Whether to use these settings the\nnext time you export a Schematic.") && wmenu = 0) sch_exp_remember=!sch_exp_remember

	if (theme = 1) draw_window(x1 + 4, y1 + 45, x1 + 496 + 50, y1 + 364)
	for (a = 0; a < 2; a += 1) {
	    c = mouse_rectangle(x1 + b, y1 + 28, string_width(str[a]) + 12, 18)
	    if (selected_tab_sch = a) {
	        stabx = b - 2
	        stabw = string_width(str[a]) + 15
	    } else {
	        draw_sprite(spr_tabbuttons, 0 + 3 * c + 6 * theme, x1 + b, y1 + 28)
	        draw_sprite_ext(spr_tabbuttons, 1 + 3 * c + 6 * theme, x1 + b + 2, y1 + 28, string_width(str[a]) / 2 + 4, 1, 0, -1, 1)
	        draw_sprite(spr_tabbuttons, 2 + 3 * c + 6 * theme, x1 + b + string_width(str[a]) + 10, y1 + 28)
	        draw_text(x1 + b + 6, y1 + 30, str[a])
	    }
	    if (mouse_check_button_pressed(mb_left) && c && wmenu = 0) nsel = a
	    b += string_width(str[a]) + 12
	}
	if (theme = 0) {
	    draw_set_color(c_white)
	    draw_rectangle(x1 + 6, y1 + 46, x1 + 494 + 50, y1 + 362, 0) 
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 6, y1 + 46, x1 + 494 + 50, y1 + 362, 1)
	    draw_set_color(c_white)
	    draw_rectangle(x1 + stabx, y1 + 26, x1 + stabx + stabw, y1 + 26 + 20, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + stabx, y1 + 26, x1 + stabx + stabw, y1 + 26 + 20, 1)
	    draw_set_color(c_white)
	    draw_rectangle(x1 + stabx + 1, y1 + 46, x1 + stabx + stabw - 1, y1 + 47, 0)
	    draw_theme_color()
	    draw_text(x1 + stabx + 8, y1 + 28, str[selected_tab_sch])
	} else if(theme = 1){
	    draw_sprite(spr_tabbuttons, 12, x1 + stabx - 1, y1 + 26)
	    draw_sprite_ext(spr_tabbuttons, 13, x1 + stabx + 1, y1 + 26, stabw / 2 - 1, 1, 0, -1, 1)
	    draw_sprite(spr_tabbuttons, 14, x1 + stabx + stabw - 1, y1 + 26)
	    draw_text(x1 + stabx + 8, y1 + 28, str[selected_tab_sch])
	}else{
		draw_set_color(c_dark)
	    draw_rectangle(x1 + 6, y1 + 46, x1 + 494 + 50, y1 + 362, 0) 
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 6, y1 + 46, x1 + 494 + 50, y1 + 362, 1)
	    draw_set_color(c_dark)
	    draw_rectangle(x1 + stabx, y1 + 26, x1 + stabx + stabw, y1 + 26 + 20, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + stabx, y1 + 26, x1 + stabx + stabw, y1 + 26 + 20, 1)
	    draw_set_color(c_dark)
	    draw_rectangle(x1 + stabx + 1, y1 + 46, x1 + stabx + stabw - 1, y1 + 47, 0)
	    draw_theme_color()
	    draw_text(x1 + stabx + 8, y1 + 28, str[selected_tab_sch])
	}
	if (nsel > -1) selected_tab_sch = nsel
	selected_tab_sch += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
	if (selected_tab_sch < 0) selected_tab_sch = 1
	if (selected_tab_sch > 1) selected_tab_sch = 0
	if (selected_tab_sch = 0) {
	    draw_sprite(spr_schematic_exp, sch_exp_layout, x1 + 15, y1 + 56)
	    draw_text(x1 + 16, y1 + 220, "Layout:")
	    if (draw_radiobox(x1 + 32, y1 + 240, sch_exp_layout = 1, "Simple walkway", "Generate a simple walkway that stretches\nas far as the length of the song.")) sch_exp_layout = 1
	    if (draw_radiobox(x1 + 32, y1 + 260, sch_exp_layout = 0, "Circular walkway", "Generate a walkway where the\nplayer travels back and forth.")) sch_exp_layout = 0
	    draw_text(x1 + 16, y1 + 290, "For Minecraft version:")
	    if (draw_radiobox(x1 + 32, y1 + 310, !sch_exp_minecraft_old, "1.11-1.12", "Create a Schematic that is compatible with 1.11 or 1.12.\nNOTE: Support for versions 1.13+ is coming soon.")) sch_exp_minecraft_old = false
	    if (draw_radiobox(x1 + 32, y1 + 330, sch_exp_minecraft_old, "pre 1.11", "Create a Schematic that is compatible with\nold Minecraft versions only, before 1.11.")) sch_exp_minecraft_old = true
	    draw_text(x1 + 170, y1 + 220, "Repeaters per row:")
	    sch_exp_notesperrow = median(5, draw_dragvalue(5, x1 + 300, y1 + 220, sch_exp_notesperrow, 1), 100)
	    sch_exp_notesperrow = max(5, sch_exp_notesperrow)
	    popup_set_window(x1 + 170, y1 + 220, 150, 16, "The amount of repeaters per row in\nthe Schematic. Click and drag to change.")
	    if (draw_checkbox(x1 + 170, y1 + 240, sch_exp_includelocked, "Include locked layers", "Whether to include locked layers in the Schematic.")) sch_exp_includelocked=!sch_exp_includelocked
	    if (draw_checkbox(x1 + 170, y1 + 260, sch_exp_compress, "Compress layers", "Compress layers to save vertical space.")) sch_exp_compress=!sch_exp_compress
	    if (sch_exp_layout = 0 || sch_exp_layout = 1) {
	        if (draw_checkbox(x1 + 170, y1 + 290, sch_exp_minecart, "Include minecart track", "Include a minecart track that\nautomatically goes along with the song.")) sch_exp_minecart=!sch_exp_minecart
	        if (draw_checkbox(x1 + 170 + 16, y1 + 310, sch_exp_chest, "Add chest with minecarts", "Whether to add a chest full of minecarts\nat the beginning of the song.", !sch_exp_minecart)) sch_exp_chest=!sch_exp_chest
	        if (sch_exp_layout = 0) {
	            if (draw_checkbox(x1 + 170, y1 + 330, sch_exp_loop, "Include looping option", "Whether to add a lever that toggles looping.")) sch_exp_loop=!sch_exp_loop
	        }
	    } else {
	        if (draw_checkbox(x1 + 170, y1 + 290, sch_exp_glass, "Create glass floor", "Whether a glass floor should\nmake all the note blocks visible.")) sch_exp_glass=!sch_exp_glass
	    }
	    draw_text(x1 + 380, y1 + 220, "Note blocks:")
	    draw_text(x1 + 380, y1 + 220 + 16 * 1, "Repeaters:")
	    draw_text(x1 + 380, y1 + 220 + 16 * 2, "Size:")
	    draw_set_halign(fa_right)
	    draw_text(x1 + 520, y1 + 220, string(max(0, sch_exp_totalblocks[sch_exp_includelocked])))
	    draw_text(x1 + 520, y1 + 220 + 16 * 1, string(sch_exp_repeaters[sch_exp_includelocked, sch_exp_tempo]) + "x" + string(ceil(sch_exp_maxheight[sch_exp_compress] / 4)))
	    draw_text(x1 + 520, y1 + 220 + 16 * 2, string(schematic_length()) + "x" + string(schematic_width()) + "x" + string(schematic_height()))
	    draw_set_halign(fa_left)
	    draw_text(x1 + 380, y1 + 220 + 16 * 3, "Tempo:")
	    if (draw_radiobox(x1 + 396, y1 + 220 + 16 * 3 + 20, sch_exp_tempo = 0, "10 ticks / second", "Generate song at 10 ticks / second")) sch_exp_tempo = 0
	    if (draw_radiobox(x1 + 396, y1 + 220 + 16 * 3 + 40, sch_exp_tempo = 1, "5 ticks / second", "Generate song at 5 ticks / second")) sch_exp_tempo = 1
	    if (draw_radiobox(x1 + 396, y1 + 220 + 16 * 3 + 60, sch_exp_tempo = 2, "2.5 ticks / second", "Generate song at 2.5 ticks / second")) sch_exp_tempo = 2
	} else {
	    if (theme = 1) {
	        draw_set_color(c_white)
	        draw_rectangle(x1 + 10, y1 + 52, x1 + 539, y1 + 255, 0)
	        draw_set_color(make_color_rgb(137, 140, 149))
	        draw_rectangle(x1 + 10, y1 + 52, x1 + 539, y1 + 255, 1)
	        draw_theme_color()
	    } else {
	        draw_set_color(make_color_rgb(137, 140, 149))
	        draw_rectangle(x1 + 11, y1 + 52, x1 + 538, y1 + 256, 1)
	    }
	    tabs = 3
	    tabstr[0] = "Instrument"
	    tabtip[0] = "The name of the instrument"
	    tabw[0] = 252
	    tabstr[1] = "Block"
	    tabtip[1] = "The ID of the block that should be placed\nbelow note blocks of the instrument."
	    tabw[1] = 60
	    tabstr[2] = "Block name"
	    tabtip[2] = "The name of the block that should be\nplaced below note blocks of the instrument."
	    tabw[2] = 220
	    for (a = 0; a < 9; a += 1) {
	        b = floor(sb_val[sch_exp_scrollbar] + a)
	        if (b >= ds_list_size(instrument_list)) break
	        var ins = instrument_list[| b];
	        draw_theme_color()
	        draw_text(x1 + 12 + 4, y1 + 74 + 20 * a, ins.name)
	        draw_text(x1 + 12 + 4 + tabw[0], y1 + 74 + 20 * a, string(sch_exp_ins_block[b]) + ", " + string(sch_exp_ins_data[b]))
	        if (draw_abutton(x1 + 12 + 4 + tabw[0] + tabw[1] - 25, y1 + 72 + 20 * a) && wmenu = 0) {
	            menun = 0
	            menua = a
	            menub = b
	        }
	        draw_text(x1 + 12 + 4 + tabw[0] + tabw[1], y1 + 74 + 20 * a, block_get_name(sch_exp_ins_block[b], sch_exp_ins_data[b]))
	        draw_set_color(12632256)
	        draw_line(x1 + 12, y1 + 90 + 20 * a, x1 + 528, y1 + 90 + 20 * a)
	    }
	    draw_set_color(12632256)
	    draw_line(x1 + 9 + tabw[0], y1 + 70, x1 + 9 + tabw[0], y1 + 70 + 20 * a)
	    draw_line(x1 + 8 + tabw[0] + tabw[1], y1 + 70, x1 + 8 + tabw[0] + tabw[1], y1 + 70 + 20 * a)
	    draw_scrollbar(sch_exp_scrollbar, x1 + 524, y1 + 71, 17, 9, ds_list_size(instrument_list), 0, 1)
	    xx = x1 + 524 + 16
	    for (a = tabs - 1; a >= 0; a -= 1) {
	        draw_window(xx - tabw[a], y1 + 51, xx, y1 + 51 + 20)
	        popup_set_window(xx - tabw[a], y1 + 51, tabw[a], 20, tabtip[a])
	        draw_text(xx - tabw[a] + 4, y1 + 54, tabstr[a])
	        xx -= tabw[a] - 1
	    }
	    draw_theme_color()
	    draw_text(x1 + 16, y1 + 270, "Block for walkway:")
	    draw_text(x1 + 16, y1 + 300, "Block for circuitry:")
	    draw_text(x1 + 16, y1 + 330, "Block for ground:")
    
	    draw_set_color(c_white)
		if(theme = 2) draw_set_color(c_dark)
	    draw_rectangle(x1 + 200, y1 + 265, x1 + 200 + 140, y1 + 265 + 21, 0)
	    draw_area(x1 + 200, y1 + 265, x1 + 200 + 140, y1 + 265 + 21)
	    if ((draw_abutton(x1 + 200 + 121, y1 + 267) || (mouse_rectangle(x1 + 200, y1 + 265, 140, 21) && mouse_check_button_pressed(mb_left))) && wmenu = 0) {
	        menun = 1
	        menua = 0
	    }
	    popup_set_window(x1 + 200, y1 + 265, 140, 21, "The block that should be used for the walkway, \nand everything else that isn't circuitry or ground.")
	    draw_theme_color()
	    draw_text(x1 + 204, y1 + 264 + 4, block_get_name(sch_exp_walkway_block, sch_exp_walkway_data))
    
	    draw_set_color(c_white)
		if(theme = 2) draw_set_color(c_dark)
	    draw_rectangle(x1 + 200, y1 + 265 + 30, x1 + 200 + 140, y1 + 265 + 21 + 30, 0)
	    draw_area(x1 + 200, y1 + 265 + 30, x1 + 200 + 140, y1 + 265 + 21 + 30)
	    if ((draw_abutton(x1 + 200 + 121, y1 + 267 + 30) || (mouse_rectangle(x1 + 200, y1 + 265 + 30, 140, 21) && mouse_check_button_pressed(mb_left))) && wmenu = 0) {
	        menun = 1
	        menua = 1
	    }
	    popup_set_window(x1 + 200, y1 + 265 + 30, 140, 21, "The block that should be used for the circuitry.")
	    draw_theme_color()
	    draw_text(x1 + 204, y1 + 264 + 4 + 30, block_get_name(sch_exp_circuit_block, sch_exp_circuit_data))
    
	    draw_set_color(c_white)
		if(theme = 2) draw_set_color(c_dark)
	    draw_rectangle(x1 + 200, y1 + 265 + 60, x1 + 200 + 140, y1 + 265 + 21 + 60, 0)
	    draw_area(x1 + 200, y1 + 265 + 60, x1 + 200 + 140, y1 + 265 + 21 + 60)
	    if ((draw_abutton(x1 + 200 + 121, y1 + 267 + 60) || (mouse_rectangle(x1 + 200, y1 + 265 + 60, 140, 21) && mouse_check_button_pressed(mb_left))) && wmenu = 0) {
	        menun = 1
	        menua = 2
	    }
	    popup_set_window(x1 + 200, y1 + 265 + 60, 140, 21, "The block that should be used for the ground.\nChoosing grass will result with a bunch of animals spawning.")
	    draw_theme_color()
	    draw_text(x1 + 204, y1 + 264 + 4 + 60, block_get_name(sch_exp_ground_block, sch_exp_ground_data))
	}
	if (draw_button2(x1 + 470, y1 + 368, 72, "Export") && wmenu = 0) {
	    if (sch_exp_totalblocks[sch_exp_includelocked] <= 0) {
	        message("There are no blocks to export!", "Schematic export")
	    } else if (schematic_length() >= 2000 || schematic_width() >= 2000 || schematic_height() >= 256) {
	        message("The Schematic is too big. The maximum size is 2000x2000x256.\nTry changing the \"Repeaters per row\" value to decrease the size.", "Error")
	    } else {
	        schematic_export()
	    }
	}
	if (draw_button2(x1 + 470 - 80 * 1, y1 + 368, 72, "Cancel") && wmenu = 0) window = 0
	if (draw_button2(x1 + 470 - 80 * 2, y1 + 368, 72, "Use default") && wmenu = 0) {
	    if (question("Are you sure?", "Confirm")) reset_schematic_export(1)
	}
	if (wmenu = 1 && !mouse_check_button(mb_left)) wmenu = 0

	draw_set_font(fnt_small)
	if (menun > -1) {
	    if (menun = 0) {
	        if (menub = 0) {
	            b = 0
	            block[b, 0] = 0 block[b, 1] = 0 b += 1
	            block[b, 0] = 2 block[b, 1] = 0 b += 1
	            block[b, 0] = 3 block[b, 1] = 0 b += 1
	            block[b, 0] = 18 block[b, 1] = 0 b += 1
	            block[b, 0] = 19 block[b, 1] = 0 b += 1
	        } else if (menub = 1) {
	            b = 0
	            block[b, 0] = 5 block[b, 1] = 0 b += 1
	            block[b, 0] = 17 block[b, 1] = 0 b += 1
	            block[b, 0] = 25 block[b, 1] = 0 b += 1
	            block[b, 0] = 47 block[b, 1] = 0 b += 1
	        } else if (menub = 2) {
	            b = 0
	            block[b, 0] = 1 block[b, 1] = 0 b += 1
	            block[b, 0] = 4 block[b, 1] = 0 b += 1
	            block[b, 0] = 7 block[b, 1] = 0 b += 1
	            block[b, 0] = 14 block[b, 1] = 0 b += 1
	            block[b, 0] = 15 block[b, 1] = 0 b += 1
	            block[b, 0] = 16 block[b, 1] = 0 b += 1
	            block[b, 0] = 21 block[b, 1] = 0 b += 1
	            block[b, 0] = 22 block[b, 1] = 0 b += 1
	            block[b, 0] = 24 block[b, 1] = 0 b += 1
	            block[b, 0] = 48 block[b, 1] = 0 b += 1
	            block[b, 0] = 49 block[b, 1] = 0 b += 1
	            block[b, 0] = 73 block[b, 1] = 0 b += 1
	            block[b, 0] = 87 block[b, 1] = 0 b += 1
	            block[b, 0] = 89 block[b, 1] = 0 b += 1
	        } else if (menub = 3) {
	            b = 0
	            block[b, 0] = 12 block[b, 1] = 0 b += 1
	            block[b, 0] = 13 block[b, 1] = 0 b += 1
	            block[b, 0] = 88 block[b, 1] = 0 b += 1
	        } else if (menub = 4) {
	            b = 0
	            block[b, 0] = 20 block[b, 1] = 0 b += 1
	        } else if (menub = 5) {
	            b = 0
	            block[b, 0] = 35 block[b, 1] = 0 b += 1
	            for (a = 0; a < 16; a += 1) {block[b + a, 0] = 35 block[b + a, 1] = a} b += 16
	        } else if (menub = 6) {
	            b = 0
	            block[b, 0] = 82 block[b, 1] = 0 b += 1
	        } else if (menub = 7) {
	            b = 0
	            block[b, 0] = 41 block[b, 1] = 0 b += 1
	        } else if (menub = 8) {
	            b = 0
	            block[b, 0] = 174 block[b, 1] = 0 b += 1
	        } else if (menub = 9) {
	            b = 0
	            block[b, 0] = 216 block[b, 1] = 0 b += 1
	        } else {
	            b = 0
	            for (a = 0; a < 256; a += 1) {
	                if (a = 35 || a = 95 || a = 159) {
	                    block[b, 0] = a block[b, 1] = 0 b += 1
	                    for (c = 0; c < 16; c += 1) {block[b + c, 0] = a block[b + c, 1] = c} b += 16
	                } else if (block_get_name(a, 0) != "") {
	                    block[b, 0] = a block[b, 1] = 0 b += 1
	                }
	            }
	        }
	        str = ""
	        d = 0
	        sm = 0
	        for (a = 0; a < b; a += 1) {
	            if (block[a, 0] = 35) {
	                str += "Wool|\\|"
	                for (c = 0; c < 16; c += 1) str += check(sch_exp_ins_block[menub] = 35 && sch_exp_ins_data[menub] = c) + "35, " + string(c) + "$" + block_get_name(35, c) + "|"
	                str += "/|"
	                a += 16
	            } else if (block[a, 0] = 95) {
	                str += "Stained glass|\\|"
	                for (c = 0; c < 16; c += 1) str += check(sch_exp_ins_block[menub] = 95 && sch_exp_ins_data[menub] = c) + "95, " + string(c) + "$" + block_get_name(95, c) + "|"
	                str += "/|"
	                a += 16
	            } else if (block[a, 0] = 159) {
	                str += "Stained hardened clay|\\|"
	                for (c = 0; c < 16; c += 1) str += check(sch_exp_ins_block[menub] = 159 && sch_exp_ins_data[menub] = c) + "159, " + string(c) + "$" + block_get_name(159, c) + "|"
	                str += "/|"
	                a += 16
	            } else {
	                str += check(sch_exp_ins_block[menub] = block[a, 0]) + string(block[a, 0]) + ", " + string(block[a, 1]) + "$" + block_get_name(block[a, 0], block[a, 1]) + "|"
	            }
	            d++
	            if (d % 25 = 0 && a < b - 1) {
	                str += "-|More...|\\|"
	                sm++
	            }
	        }
	        str += string_repeat("/|", sm)
	        //clipboard_set_text(str)
	        menu = show_menu_ext("schexport_insblock", x1 + 9 + tabw[0], y1 + 90 + 20 * menua, str)
	        menu.menub = menub
	    }
	    if (menun = 1) {
	        b = 0
	        for (a = 0; a < 256; a += 1) {
	            if ((a = 20 || a = 25) && menua = 1) continue
	            if (a = 35 || a = 95 || a = 159) {
	                block[b, 0] = a block[b, 1] = 0 b += 1
	                for (c = 0; c < 16; c += 1) {block[b + c, 0] = b block[b + c, 1] = c} b += 16
	            } else if (block_get_name(a, 0) != "") {
	                block[b, 0] = a block[b, 1] = 0 b += 1
	            }
	        }
	        str = ""
	        if (menua = 0) {c1 = sch_exp_walkway_block c2 = sch_exp_walkway_data}
	        if (menua = 1) {c1 = sch_exp_circuit_block c2 = sch_exp_circuit_data}
	        if (menua = 2) {c1 = sch_exp_ground_block c2 = sch_exp_ground_data}
	        d = 0
	        sm = 0
	        for (a = 0; a < b; a += 1) {
	            if (block[a, 0] = 35) {
	                str += "Wool|\\|"
	                for (c = 0; c < 16; c += 1) str += check(c1 = 35 && c2 = c) + "35, " + string(c) + "$" + block_get_name(35, c) + "|"
	                str += "/|"
	                a += 16
	            } else if (block[a, 0] = 95) {
	                str += "Stained Glass|\\|"
	                for (c = 0; c < 16; c += 1) str += check(c1 = 95 && c2 = c) + "95, " + string(c) + "$" + block_get_name(95, c) + "|"
	                str += "/|"
	                a += 16
	            } else if (block[a, 0] = 159) {
	                str += "Stained Hardened Clay|\\|"
	                for (c = 0; c < 16; c += 1) str += check(c1 = 159 && c2 = c) + "159, " + string(c) + "$" + block_get_name(159, c) + "|"
	                str += "/|"
	                a += 16
	            } else {
	                str += check(c1 = block[a, 0]) + string(block[a, 0]) + ", " + string(block[a, 1]) + "$" + block_get_name(block[a, 0], block[a, 1]) + "|"
	            }
	            d++
	            if (d%25 = 0  && a < b - 1) {
	                str += "-|More...|\\|"
	                sm++
	            }
	        }
	        str += string_repeat("/|", sm)
	        menu = show_menu_ext("schexport_block", x1 + 200, y1 + 265 + 20 + 30 * menua, str)
	        menu.menua = menua
	    }
	}
	window_set_cursor(curs)



}
