function draw_window_songinfo() {
	// draw_window_songinfo()
	var x1, y1, a, b, n, str, w, h, yy, w1, w2, w3, w4, w5, w6, col, r, g, b, str2, cut;
	with (obj_popup) instance_destroy()
	global.popup = 0
	if (song_name = "" && window = w_songinfo) {window = 0 return 0}
	col[0] = 16728176
	col[1] = 16737419
	col[2] = 16737419

	str[0] = song_name
	if (str[0] = "") str[0] = "Untitled song"

	str[1] = song_author
	str[2] = song_orauthor
	str[3] = song_midi
	draw_set_font(fnt_info_big)
	w = max(string_width(str[0]) + 32, 400)
	draw_set_font(fnt_info_med_bold)
	w2 = string_width(str[1])
	w4 = string_width(str[2])
	draw_set_font(fnt_mainbold)
	w6 = string_width(str[3])
	draw_set_font(fnt_info_med)
	w1 = string_width("Created by ")
	w3 = string_width("Originally created by ")
	draw_set_font(fnt_main)
	w5 = string_width("Imported from ")
	w = max(w1 + w2 + 32, w)
	w = max(w3 + w4 + 32, w)
	w = max(w5 + w6 + 32, w)
	draw_set_font(fnt_main)
	var songdescwrap, songdeschei;
	songdescwrap = string_word_wrap(song_desc, 216)
	songdeschei = string_height(songdescwrap)

	h = songdeschei + 90
	if (song_desc != "")
	    h += 32
	if (str[1] != "")
	    h += 16
	if (str[2] != "")
	    h += 16
	if (song_midi != "")
	    h += 10
	if (window = w_songinfoedit)
	    h += 32
	x1 = floor(window_width / 2 - w / 2)
	y1 = floor(window_height / 2 - h / 2)
	draw_window(x1, y1, x1 + w, y1 + h)

	draw_set_font(fnt_info_big)
	draw_set_halign(fa_center)
	draw_theme_color()
	draw_text(x1 + floor(w / 2) + 1, y1 + 16 + 1, str[0])
	draw_set_color(col[0])
	draw_text(x1 + floor(w / 2), y1 + 16, str[0])
	draw_set_font(fnt_info_med)
	draw_theme_color()
	yy = y1 + 16
	if (song_author != "") {
	    yy += 32
	    draw_text(x1 + floor(w / 2 - w2 / 2), yy, "Created by ")
	    draw_set_font(fnt_info_med_bold)
	    draw_text(x1 + floor(w / 2 + w1 / 2) + 1, yy + 1, str[1])
	    draw_set_color(col[1])
	    draw_text(x1 + floor(w / 2 + w1 / 2), yy, str[1])
	    if (song_orauthor != "") {
	        yy += 20
	        draw_set_font(fnt_info_med)
	        draw_theme_color()
	        draw_text(x1 + floor(w / 2 - w4 / 2), yy, "Originally created by ")
	        draw_set_font(fnt_info_med_bold)
	        draw_text(x1 + floor(w / 2 + w3 / 2) + 1, yy + 1, str[2])
	        draw_set_color(col[2])
	        draw_text(x1 + floor(w / 2 + w3 / 2), yy, str[2])
	    }
	}
	draw_theme_color()
	if (song_midi != "") {
	    draw_set_font(fnt_main)
		a = string_width("Imported from ")
		draw_set_font(fnt_mainbold)
		b = string_width(song_midi)
		draw_set_font(fnt_mainbold)
		draw_text(x1 + floor(w / 2 + a / 2), y1 + h - 34 - 32 * (window = w_songinfoedit), string(song_midi))
		draw_set_font(fnt_main)
		draw_text(x1 + floor(w / 2 - b / 2), y1 + h - 34 - 32 * (window = w_songinfoedit), "Imported from ")
	}
	draw_set_font(fnt_main) 
	draw_text(x1 + floor(w / 2), y1 + h - 20 - 32 * (window = w_songinfoedit), condstr(window = w_songinfo, "Click anywhere to dismiss") + condstr(window = w_songinfoedit, "This message is shown when the file is opened."))
	draw_set_halign(fa_left)
	if (song_desc != "") {
	    yy += 35
	    if (theme = 0) {
	        draw_set_color(c_white)
	        draw_rectangle(x1 + floor(w / 2) - 118, yy, x1 + floor(w / 2) + 118, yy + 16 + songdeschei, 0)
	        draw_set_color(make_color_rgb(137, 140, 149))
	        draw_rectangle(x1 + floor(w / 2) - 118, yy, x1 + floor(w / 2) + 118, yy + 16 + songdeschei, 1)
	    } else {
	        draw_frame(x1 + floor(w / 2) - 118, yy, x1 + floor(w / 2) + 118, yy + 16 + songdeschei)
	    }
	    draw_theme_color()
	    draw_text(x1 + floor(w / 2) - 110, yy + 8, songdescwrap)
	}

	if (window = w_songinfoedit) {
	    if (draw_button2(x1 + floor(w / 2) - 70, y1 + h - 30, 70, "Edit")) window = w_properties
	    if (draw_button2(x1 + floor(w / 2) + 5, y1 + h - 30, 70, "OK")) window = 0
	} else {
	    if (mouse_check_button_pressed(mb_left)) window = w_releasemouse
	}



}
