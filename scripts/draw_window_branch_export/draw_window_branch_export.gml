function draw_window_branch_export() {
	// draw_window_branch_export()
	var x1, y1, a, b, c, d, str, nsel, tabs, tabstr, tabw, tabtip, menun, menua, menub, block, c1, c2;
	curs = cr_default
	x1 = floor(window_width / 2 - 275)
	y1 = floor(window_height / 2 - 200)
	draw_window(x1, y1, x1 + 550, y1 + 400)
	draw_set_font(fnt_mainbold)
	draw_text(x1 + 8, y1 + 8, "导出")
	draw_set_font(fnt_main)

	b = 8
	str[0] = "设计"
	str[1] = "方块"
	nsel = -1
	menun = -1
	if (draw_checkbox(x1 + 12, y1 + 374, sch_br_remember, "记住更变", "是否保存更变\n以用作下次导出.") && wmenu = 0) sch_br_remember=!sch_br_remember

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
	    draw_sprite(spr_schematic_br, 0, x1 + 15, y1 + 56)
	    draw_text(x1 + 16, y1 + 220, "输出设置:")
		if (draw_radiobox(x1 + 32, y1 + 240, sch_exp_stereo = 4, "全部", "导出全部音符.")) sch_exp_stereo = 4
		if (draw_radiobox(x1 + 32, y1 + 260, sch_exp_stereo = 3, "中心", "只保存没有设置偏移量的音符.")) sch_exp_stereo = 3
	    if (draw_radiobox(x1 + 32, y1 + 280, sch_exp_stereo = 2, "左声道", "只保存设置左偏移量的音符.")) sch_exp_stereo = 2
	    if (draw_radiobox(x1 + 32, y1 + 300, sch_exp_stereo = 1, "右声道", "只保存设置右偏移量的音符.")) sch_exp_stereo = 1
	
		draw_text(x1 + 170, y1 + 220, "复调:")
		sch_exp_polyphony = median(1, draw_dragvalue(18, x1 + 260, y1 + 220, sch_exp_polyphony, 1), 3)
	    draw_text(x1 + 170, y1 + 240, "主轨道:")
	    sch_exp_layer1 = median(1, draw_dragvalue(15, x1 + 260, y1 + 240, sch_exp_layer1, 1), sch_exp_maxheight[0] + 1)
		sch_exp_layer_index[0] = sch_exp_layer1
		draw_text(x1 + 170, y1 + 260, "和弦轨道 1:")
		draw_text(x1 + 170, y1 + 280, "和弦轨道 2:")
		if (sch_exp_polyphony > 1 ) {
			sch_exp_layer2 = median(1, draw_dragvalue(16, x1 + 260, y1 + 260, sch_exp_layer2, 1), sch_exp_maxheight[0] + 1)
			sch_exp_layer_index[1] = sch_exp_layer2
		} else {
			draw_text(x1 + 260, y1 + 260, "无")
		}
		if sch_exp_polyphony > 2 {
			sch_exp_layer3 = median(1, draw_dragvalue(17, x1 + 260, y1 + 280, sch_exp_layer3, 1), sch_exp_maxheight[0] + 1)
			sch_exp_layer_index[2] = sch_exp_layer3
		} else {
			draw_text(x1 + 260, y1 + 280, "无")
		}
	    if (draw_checkbox(x1 + 170, y1 + 300, sch_exp_velocity, "启用速度", "是否根据速度调节音符盒位置.\n当复调大于1时，建议各层的速度相同.")) sch_exp_velocity=!sch_exp_velocity
		if sch_exp_velocity = 1 var schwidth = 35 else schwidth = 1
		if sch_exp_polyphony > 1 && sch_exp_velocity = 0 var schwidth = 3
	    if (draw_checkbox(x1 + 170, y1 + 320, sch_exp_circuitry, "导出电路", "是否导出红石,地面,中继器.")) sch_exp_circuitry=!sch_exp_circuitry
	    draw_text(x1 + 380, y1 + 240 + 16, "尺寸:")
	    draw_set_halign(fa_right)
	    draw_text(x1 + 520, y1 + 240 + 16, string(enda * 2 + 4) + "x" + string(2) + "x" + string(schwidth))
		draw_set_halign(fa_left)
		draw_text(x1 + 380, y1 + 280, "范围:")
		sch_exp_range_start = draw_inputbox(55,x1 + 380, y1 + 300,40,sch_exp_range_start,"初始刻")
		sch_exp_range_end = draw_inputbox(56,x1 + 425, y1 + 300,40,sch_exp_range_end,"结束刻")
	    draw_set_halign(fa_left)
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
	    tabstr[0] = "乐器"
	    tabtip[0] = "乐器名称"
	    tabw[0] = 252
	    tabstr[1] = "方块"
	    tabtip[1] = "被替换到音符盒底部的方块的id"
	    tabw[1] = 60
	    tabstr[2] = "方块名称"
	    tabtip[2] = "被替换到音符盒底部的方块的名称."
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
	
	    draw_text(x1 + 16, y1 + 300, "电路方块:")
    
	    draw_set_color(c_white)
		if(theme = 2) draw_set_color(c_dark)
	    draw_rectangle(x1 + 200, y1 + 265 + 30, x1 + 200 + 140, y1 + 265 + 21 + 30, 0)
	    draw_area(x1 + 200, y1 + 265 + 30, x1 + 200 + 140, y1 + 265 + 21 + 30)
	    if ((draw_abutton(x1 + 200 + 121, y1 + 267 + 30) || (mouse_rectangle(x1 + 200, y1 + 265 + 30, 140, 21) && mouse_check_button_pressed(mb_left))) && wmenu = 0) {
	        menun = 1
	        menua = 1
	    }
	    popup_set_window(x1 + 200, y1 + 265 + 30, 140, 21, "用于为铺设电路垫底的方块.")
	    draw_theme_color()
	    draw_text(x1 + 204, y1 + 264 + 4 + 30, block_get_name(sch_exp_circuit_block, sch_exp_circuit_data))
	
	}
	if (draw_button2(x1 + 470, y1 + 368, 72, "导出") && wmenu = 0) {
	    if (sch_exp_totalblocks[sch_exp_includelocked] <= 0) {
	        message("没有方块可被导出!", "导出")
	    } else if sch_exp_range_end = 0 || sch_exp_range_start = "" || sch_exp_range_end = "" {
			message("请输入一个范围!", "导出")
		} else if real(sch_exp_range_start) > real(sch_exp_range_end) {
			message("开始刻的数值应小于结束刻!", "导出")
		} else if real(sch_exp_range_end) > enda {
			message("结束刻的数值过大!\n这首曲子的结束刻最大为: " + string(enda) + ".", "导出")
		}
		else {
			sch_exp_range_start = real(sch_exp_range_start)
			sch_exp_range_end = real(sch_exp_range_end)
	        branch_export()
	    }
	}
	if (draw_button2(x1 + 470 - 80 * 1, y1 + 368, 72, "取消") && wmenu = 0) window = 0
	if (draw_button2(x1 + 470 - 80 * 2, y1 + 368, 72, "使用默认值") && wmenu = 0) {
	    if (question("您 确 定 吗?", "确认")) reset_schematic_export(1)
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
