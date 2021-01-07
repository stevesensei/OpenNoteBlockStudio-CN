function draw_window_midi_import() {
	// draw_window_midi_import()
	var x1, y1, xx, a, b, c, menun, menua, menub, stabx, stabw, nsel, tabs, tabw, tabstr, tabtip, str;
	curs = cr_default
	menun = -1
	nsel = -1
	x1 = floor(window_width / 2 - 300)
	y1 = floor(window_height / 2 - 200)
	draw_window(x1, y1, x1 + 600, y1 + 400)
	draw_set_font(fnt_mainbold)
	draw_text(x1 + 8, y1 + 8, "MIDI Import")
	draw_set_font(fnt_main)
	if (draw_checkbox(x1 + 32, y1 + 32, w_midi_removesilent, "Remove silent parts at beginning", "Whether to remove any silent parts\nat the beginning of the song.") && wmenu = 0) {w_midi_removesilent=!w_midi_removesilent midi_songlength = (midi_micsecqn * ((midi_maxpos - midi_minpos * w_midi_removesilent) / (midi_tempo & $7FFF))) / 1000000}
	if (draw_checkbox(x1 + 32, y1 + 32 + 20, w_midi_name, "Name layers...", "If the layers should be given names\ndepending on the data in the MIDI file.") && wmenu = 0) w_midi_name=!w_midi_name
	if (draw_radiobox(x1 + 52, y1 + 32 + 40, w_midi_name_patch, "...after patches", "If the layers should be named\nafter the instruments in the MIDI file.", !w_midi_name) && wmenu = 0) w_midi_name_patch = 1
	if (draw_radiobox(x1 + 52, y1 + 32 + 60, !w_midi_name_patch, "...channel numbers", "If the layers should be named\nafter the channels in the MIDI file.", !w_midi_name) && wmenu = 0) w_midi_name_patch = 0
	if (draw_checkbox(x1 + 300, y1 + 32, w_midi_tempo, "Same tempo as in file", "Set the song's tempo to match\nthe one of the MIDI file.") && wmenu = 0) w_midi_tempo=!w_midi_tempo
	draw_text(x1 + 300, y1 + 52, "Max. channel height:")
	popup_set_window(x1 + 300, y1 + 52, 140, 16, "The maximum allowed layers per channel.\nClick and drag to adjust.")
	w_midi_maxheight = median(1, draw_dragvalue(1, x1 + 420, y1 + 52, w_midi_maxheight, 1), 20)
	if (draw_checkbox(x1 + 300, y1 + 72, w_midi_octave, "Keep within octave range", "Whether to automatically transpose the notes\nto keep them within the 2 octave range.") && wmenu = 0) w_midi_octave=!w_midi_octave
	if (draw_checkbox(x1 + 300, y1 + 92, w_midi_vel, "Read note velocity", "Whether to copy the volume data found\nin each MIDI note.") && wmenu = 0) w_midi_vel=!w_midi_vel
	if (draw_checkbox(x1 + 300, y1 + 112, w_midi_precision, "Double time precision", "Whether to use twice as much space between\neach note to increase the placement precision.") && wmenu = 0) w_midi_precision=!w_midi_precision
	if (draw_checkbox(x1 + 12, y1 + 374, w_midi_remember, "Remember changes", "Whether to use these settings the\nnext time you import a MIDI file.") && wmenu = 0) w_midi_remember=!w_midi_remember
	if (draw_button2(x1 + 520, y1 + 368, 72, "Import") && wmenu = 0) {w_midi_tab = 0 window = -1 import_midi()}
	if (draw_button2(x1 + 520 - 80, y1 + 368, 72, "Cancel") && wmenu = 0) {midifile = "" w_midi_tab = 0 window = 0}
	if (draw_button2(x1 + 520 - 160, y1 + 368, 72, "Use default") && wmenu = 0) {
	    if (question("Are you sure?", "Confirm")) { 
	        midi_instruments()
	        for (a = 0; a < 16; a += 1) { // Load channel settings from database
	            midi_channelins[a] = midi_ins[midi_channelpatch[a], 1]
	            midi_channeloctave[a] = midi_ins[midi_channelpatch[a], 2]
	        }
	        for (a = 0; a < midi_percamount; a += 1) { // Load percussion settings from database
	            midi_percins[a] = midi_drum[midi_percnote[a], 1]
	            midi_percpitch[a] = midi_drum[midi_percnote[a], 2] + 33
	        }
	        w_midi_removesilent = 1
	        w_midi_name = 1
	        w_midi_name_patch = 1
	        w_midi_maxheight = 20
	        w_midi_tempo = 1
	        w_midi_octave = 0
			w_midi_vel = 1
			w_midi_precision = 1
	    }
	}
	b = 8
	str[0] = "Instruments"
	str[1] = "Percussion"
	str[2] = "Tracks"
	if (theme = 1) {
	    draw_window(x1 + 4, y1 + 145, x1 + 596, y1 + 364)
	}
	for (a = 0; a < 3; a += 1) {
	    c = mouse_rectangle(x1 + b, y1 + 128, string_width(str[a]) + 12, 18)
	    if (w_midi_tab = a) {
	        stabx = b - 2
	        stabw = string_width(str[a]) + 15
	    } else {
	        draw_sprite(spr_tabbuttons, 0 + 3 * c + 6 * theme, x1 + b, y1 + 128)
	        draw_sprite_ext(spr_tabbuttons, 1 + 3 * c + 6 * theme, x1 + b + 2, y1 + 128, string_width(str[a]) / 2 + 4, 1, 0, -1, 1)
	        draw_sprite(spr_tabbuttons, 2 + 3 * c + 6 * theme, x1 + b + string_width(str[a]) + 10, y1 + 128)
	        draw_text(x1 + b + 6, y1 + 130, str[a])
	    }
	    if (mouse_check_button_pressed(mb_left) && c) nsel = a
	    b += string_width(str[a]) + 12
	}
	if (theme = 0) {
	    draw_set_color(c_white)
	    draw_rectangle(x1 + 6, y1 + 146, x1 + 594, y1 + 362, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 6, y1 + 146, x1 + 594, y1 + 362, 1)
	    draw_set_color(c_white)
	    draw_rectangle(x1 + stabx + 1, y1 + 127, x1 + stabx + stabw, y1 + 126 + 20, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + stabx, y1 + 126, x1 + stabx + stabw, y1 + 126 + 20, 1)
	    draw_set_color(c_white)
	    draw_rectangle(x1 + stabx + 1, y1 + 146, x1 + stabx + stabw - 1, y1 + 147, 0)
	    draw_theme_color()
	    draw_text(x1 + stabx + 8, y1 + 128, str[w_midi_tab])
	} else if (theme = 1){
	    draw_sprite(spr_tabbuttons, 12, x1 + stabx - 1, y1 + 126)
	    draw_sprite_ext(spr_tabbuttons, 13, x1 + stabx + 1, y1 + 126, stabw / 2 - 1, 1, 0, -1, 1)
	    draw_sprite(spr_tabbuttons, 14, x1 + stabx + stabw - 1, y1 + 126)
	    draw_text(x1 + stabx + 8, y1 + 128, str[w_midi_tab])
	    draw_set_color(c_white)
	    draw_rectangle(x1 + 9, y1 + 149, x1 + 589, y1 + 358, 0)
	    draw_area(x1 + 9, y1 + 149, x1 + 589 + 1, y1 + 358 + 2)
	}else{
		draw_set_color(c_dark)
	    draw_rectangle(x1 + 6, y1 + 146, x1 + 594, y1 + 362, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 6, y1 + 146, x1 + 594, y1 + 362, 1)
	    draw_set_color(c_dark)
	    draw_rectangle(x1 + stabx + 1, y1 + 127, x1 + stabx + stabw, y1 + 126 + 20, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + stabx, y1 + 126, x1 + stabx + stabw, y1 + 126 + 20, 1)
	    draw_set_color(c_dark)
	    draw_rectangle(x1 + stabx + 1, y1 + 146, x1 + stabx + stabw - 1, y1 + 147, 0)
	    draw_theme_color()
	    draw_text(x1 + stabx + 8, y1 + 128, str[w_midi_tab])	
	}
	draw_theme_color()
	draw_set_halign(fa_right)
	draw_text(x1 + 590, y1 + 6, midifile)
	draw_set_font(fnt_mainbold)
	if (midi_songlength > 0) {
	    draw_text(x1 + 590, y1 + 6 + string_height(midifile), time_str(midi_songlength))
	} else {
	    draw_text(x1 + 590, y1 + 6 + string_height(midifile), "Song tempo never defined")
	}
	draw_set_font(fnt_main)
	draw_set_halign(fa_left)
	if (w_midi_tab = 0) {
	    tabs = 5
	    tabstr[0] = "Channel"
	    tabtip[0] = "The number of the channel."
	    tabw[0] = 50
	    tabstr[1] = "Patch"
	    tabtip[1] = "The patch (instrument) of the channel."
	    tabw[1] = 41
	    tabstr[2] = "Patch name"
	    tabtip[2] = "The name of the patch (instrument) of the channel."
	    tabw[2] = 260
	    tabstr[3] = "Instrument"
	    tabtip[3] = "The instrument the notes in the channel\nshould be translated to."
	    tabw[3] = 130
	    tabstr[4] = "Octave modifier"
	    tabtip[4] = "The octave modifier for all sounds in this channel."
	    tabw[4] = 100
	    for (a = 0; a < 9; a += 1) {
	        b = floor(sb_val[midi_sb1] + a)
	        if (b > midi_channels) break
	        draw_theme_color()
	        if (b = 9) draw_set_color(make_color_rgb(120, 120, 120))
	        draw_text(x1 + 12 + 4, y1 + 174 + 20 * a, string(b + 1))
	        if (b = 9) {
	            draw_text(x1 + 12 + 4 + tabw[0], y1 + 174 + 20 * a, " - ")
	            draw_text(x1 + 12 + 4 + tabw[0] + tabw[1], y1 + 174 + 20 * a, "Percussion")
	            draw_text(x1 + 12 + 4 + tabw[0] + tabw[1] + tabw[2], y1 + 174 + 20 * a, "See \"Percussion\" tab")
	            draw_text(x1 + 12 + 4 + tabw[0] + tabw[1] + tabw[2] + tabw[3], y1 + 174 + 20 * a, "-")
	        } else {
	            draw_text(x1 + 12 + 4 + tabw[0], y1 + 174 + 20 * a, string(midi_channelpatch[b] + 1))
	            draw_text(x1 + 12 + 4 + tabw[0] + tabw[1], y1 + 174 + 20 * a, midi_ins[midi_channelpatch[b], 0])
	            if (midi_channelins[b] = -1) {
	                draw_set_color(c_gray)
	                draw_text(x1 + 12 + 4 + tabw[0] + tabw[1] + tabw[2], y1 + 174 + 20 * a, "Ignore")
	            } else {
	                draw_text(x1 + 12 + 4 + tabw[0] + tabw[1] + tabw[2], y1 + 174 + 20 * a, instrument_list[| midi_channelins[b]].name)
	                popup_set_window(x1 + 8 + tabw[0] + tabw[1] + tabw[2], y1 + 170 + 20 * a, tabw[3] - 20, 20, "Click to play this sound")
	                if (mouse_rectangle(x1 + 8 + tabw[0] + tabw[1] + tabw[2], y1 + 170 + 20 * a, tabw[3] - 20, 20) && wmenu = 0) {
	                    curs = cr_handpoint
	                    if (mouse_check_button_pressed(mb_left)) {
	                        play_sound(instrument_list[| midi_channelins[b]], 45 + midi_channeloctave[b] * 12, 100 ,100, 0)
	                    }
	                }
	            }
	            if (draw_abutton(x1 + 8 + tabw[0] + tabw[1] + tabw[2] + tabw[3] - 20, y1 + 172 + 20 * a) && wmenu = 0) {
	                str = check(midi_channelins[b] = -1) + "Ignore|"
	                for (c = 0; c < ds_list_size(instrument_list); c += 1) {
	                    var ins = instrument_list[| c];
	                    str += check(midi_channelins[b] = c) + clean(ins.name) + "|"
	                }
	                menu = show_menu_ext("midiimport_ins", x1 + 8 + tabw[0] + tabw[1] + tabw[2], y1 + 190 + 20 * a, str)
	                menu.menub = b
	            }
	            str = "None"
	            if (midi_channeloctave[b]<>0) {
	                str = condstr(midi_channeloctave[b] > 0, " + ") + string(midi_channeloctave[b])
	            }
	            draw_text(x1 + 12 + 4 + tabw[0] + tabw[1] + tabw[2] + tabw[3], y1 + 174 + 20 * a, str)
	            if (draw_abutton(x1 + 8 + tabw[0] + tabw[1] + tabw[2] + tabw[3] + tabw[4] - 36, y1 + 172 + 20 * a) && wmenu = 0) {
	                str = ""
	                for (c = -3; c < 4; c += 1) {
	                    str += check(midi_channeloctave[b] = c)
	                    if (c > 0) str += "+"
	                    str += string(c)
	                    if (c < 3) str += "|"
	                }
	                menu = show_menu_ext("midiimport_octave", x1 + 8 + tabw[0] + tabw[1] + tabw[2] + tabw[3], y1 + 190 + 20 * a, str)
	                menu.menub = b
	            }
	        }
	        draw_set_color(12632256)
	        draw_line(x1 + 12, y1 + 190 + 20 * a, x1 + 586, y1 + 190 + 20 * a)
	    }
	    draw_set_color(12632256)
	    draw_line(x1 + 12, y1 + 170, x1 + 12, y1 + 170 + 20 * a)
	    draw_line(x1 + 10 + tabw[0], y1 + 170, x1 + 10 + tabw[0], y1 + 170 + 20 * a)
	    draw_line(x1 + 9 + tabw[0] + tabw[1], y1 + 170, x1 + 9 + tabw[0] + tabw[1], y1 + 170 + 20 * a)
	    draw_line(x1 + 8 + tabw[0] + tabw[1] + tabw[2], y1 + 170, x1 + 8 + tabw[0] + tabw[1] + tabw[2], y1 + 170 + 20 * a)
	    draw_line(x1 + 7 + tabw[0] + tabw[1] + tabw[2] + tabw[3], y1 + 170, x1 + 7 + tabw[0] + tabw[1] + tabw[2] + tabw[3], y1 + 170 + 20 * a)
	    draw_scrollbar(midi_sb1, x1 + 572, y1 + 171, 17, 9, midi_channels + 1, 0, 1)
	} else if (w_midi_tab = 1) {
	    tabs = 4
	    tabstr[0] = "Note"
	    tabtip[0] = "The note which represents the sound."
	    tabw[0] = 50
	    tabstr[1] = "Sound name"
	    tabtip[1] = "The name of the sound."
	    tabw[1] = 220
	    tabstr[2] = "Instrument"
	    tabtip[2] = "The instrument the sound\nshould be translated to."
	    tabw[2] = 210
	    tabstr[3] = "Pitch"
	    tabtip[3] = "The pitch of the output."
	    tabw[3] = 100
	    if (midi_percamount > 0) {
	        for (a = 0; a < 9; a += 1) {
	            b = floor(sb_val[midi_sb2] + a)
	            if (b >= midi_percamount) break
	            draw_theme_color()
	            draw_text(x1 + 12 + 4, y1 + 174 + 20 * a, string(midi_percnote[b]))
	            draw_text(x1 + 12 + 4 + tabw[0], y1 + 174 + 20 * a, midi_drum[midi_percnote[b], 0])
	            if (midi_percins[b] > -1) {
	                draw_text(x1 + 12 + 4 + tabw[0] + tabw[1], y1 + 174 + 20 * a, instrument_list[| midi_percins[b]].name)
	                popup_set_window(x1 + 8 + tabw[0] + tabw[1], y1 + 170 + 20 * a, tabw[2] - 20, 20, "Click to play this sound")
	                if (mouse_rectangle(x1 + 8 + tabw[0] + tabw[1], y1 + 170 + 20 * a, tabw[2] - 20, 20) && wmenu = 0) {
	                    curs = cr_handpoint
	                    if (mouse_check_button_pressed(mb_left)) {
	                        play_sound(instrument_list[| midi_percins[b]], midi_percpitch[b], 100 ,100, 0)
	                    }
	                }
	            } else {
	                draw_set_color(c_gray)
	                draw_text(x1 + 12 + 4 + tabw[0] + tabw[1], y1 + 174 + 20 * a, "Ignore")
	            }
	            if (draw_abutton(x1 + 8 + tabw[0] + tabw[1] + tabw[2] - 19, y1 + 172 + 20 * a) && wmenu = 0) {
	                str = check(midi_percins[b] = -1) + "Ignore|"
	                for (c = 0; c < ds_list_size(instrument_list); c += 1) {
	                    var ins = instrument_list[| c];
	                    str += check(midi_percins[b] = c) + clean(ins.name) + "|"
	                }
	                menu = show_menu_ext("midiimport_percins", x1 + 8 + tabw[0] + tabw[1], y1 + 190 + 20 * a, str)
	                menu.menub = b
	            }
	            draw_text(x1 + 12 + 4 + tabw[0] + tabw[1] + tabw[2], y1 + 174 + 20 * a, get_keyname(midi_percpitch[b], 1))
	            if (draw_abutton(x1 + 8 + tabw[0] + tabw[1] + tabw[2] + tabw[3] - 35, y1 + 172 + 20 * a) && wmenu = 0) {
	                var key, oct;
	                str = ""
	                key = 0
	                oct = 0
	                str += "Octave 0|\\|"
	                while (1) {
	                    str += check(midi_percpitch[b] = key) + condstr(key < 33 || key > 57, "(outside)$") + get_keyname(key, 1) + "|"
	                    key += 1
	                    if (key = 88) break
	                    if ((key - 3) mod 12 = 0) {
	                        oct += 1
	                        str += "/|Octave " + string(oct) + "|\\|"
	                    }
	                }
	                str += "/"
	                menu = show_menu_ext("midiimport_percpitch", x1 + 8 + tabw[0] + tabw[1] + tabw[2], y1 + 190 + 20 * a, str)
	                menu.menub = b
	            }
	            draw_set_color(12632256)
	            draw_line(x1 + 12, y1 + 190 + 20 * a, x1 + 586, y1 + 190 + 20 * a)
	        }
	        draw_set_color(12632256)
	        draw_line(x1 + 12, y1 + 170, x1 + 12, y1 + 170 + 20 * a)
	        draw_line(x1 + 10 + tabw[0], y1 + 170, x1 + 10 + tabw[0], y1 + 170 + 20 * a)
	        draw_line(x1 + 9 + tabw[0] + tabw[1], y1 + 170, x1 + 9 + tabw[0] + tabw[1], y1 + 170 + 20 * a)
	        draw_line(x1 + 8 + tabw[0] + tabw[1] + tabw[2], y1 + 170, x1 + 8 + tabw[0] + tabw[1] + tabw[2], y1 + 170 + 20 * a)
	    }
	    draw_scrollbar(midi_sb2, x1 + 572, y1 + 171, 17, 9, max(1, midi_percamount), 0, 1)
	} else {
	    tabs = 3
	    tabstr[0] = "Track number"
	    tabtip[0] = "The number of the track."
	    tabw[0] = 79
	    tabstr[1] = "Track name"
	    tabtip[1] = "The name of the track."
	    tabw[1] = 300
	    tabstr[2] = "Amount of events"
	    tabtip[2] = "The amount of events in the track."
	    tabw[2] = 200
	    for (a = 0; a < 9; a += 1) {
	        b = floor(sb_val[midi_sb3] + a)
	        if (b >= midi_tracks) break
	        draw_theme_color()
	        draw_text(x1 + 12 + 4, y1 + 174 + 20 * a, string(b + 1))
	        draw_text(x1 + 12 + 4 + tabw[0], y1 + 174 + 20 * a, midi_trackname[b])
	        draw_text(x1 + 12 + 4 + tabw[0] + tabw[1], y1 + 174 + 20 * a, string(midi_trackamount[b]))
	        draw_set_color(12632256)
	        draw_line(x1 + 12, y1 + 190 + 20 * a, x1 + 586, y1 + 190 + 20 * a)
	    }
	    draw_set_color(12632256)
	    draw_line(x1 + 12, y1 + 170, x1 + 12, y1 + 170 + 20 * a)
	    draw_line(x1 + 10 + tabw[0], y1 + 170, x1 + 10 + tabw[0], y1 + 170 + 20 * a)
	    draw_line(x1 + 9 + tabw[0] + tabw[1], y1 + 170, x1 + 9 + tabw[0] + tabw[1], y1 + 170 + 20 * a)
	    draw_line(x1 + 9 + tabw[0] + tabw[1] + tabw[2], y1 + 170, x1 + 9 + tabw[0] + tabw[1] + tabw[2], y1 + 170 + 20 * a)
	    draw_scrollbar(midi_sb3, x1 + 572, y1 + 171, 17, 9, midi_tracks, 0, 1)
	}
	xx = x1 + 588
	for (a = tabs - 1; a >= 0; a -= 1) {
	    draw_window(xx - tabw[a], y1 + 151, xx, y1 + 151 + 20)
	    popup_set_window(xx - tabw[a], y1 + 151, tabw[a], 20, tabtip[a])
	    draw_text(xx - tabw[a] + 4, y1 + 154, tabstr[a])
	    xx -= tabw[a] - 1
	}
	if (nsel > -1) w_midi_tab = nsel
	w_midi_tab += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
	if (w_midi_tab < 0) w_midi_tab = 2
	if (w_midi_tab > 2) w_midi_tab = 0
	draw_theme_color()
	if (wmenu = 1 && !mouse_check_button(mb_left)) wmenu = 0
	window_set_cursor(curs)



}
