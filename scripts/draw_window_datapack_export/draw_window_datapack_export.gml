function draw_window_datapack_export() {
	// draw_window_datapack_export()
	var x1, y1, a, b, c, d, str, nsel, tabs, tabstr, tabw, tabtip, menun, menua, menub, block, blocks, c1, c2;
	curs = cr_default
	x1 = floor(window_width / 2 - 275)
	y1 = floor(window_height / 2 - 215)
	draw_window(x1, y1, x1 + 550, y1 + 430)
	draw_set_font(fnt_mainbold)
	draw_text(x1 + 8, y1 + 8, "数据包导出")
	draw_set_font(fnt_main) 

	b = 8
	str[0] = "设置"
	str[1] = "视觉效果"
	nsel = -1
	menun = -1
	for (a = 0; a < 2; a += 1) {
	    c = mouse_rectangle(x1 + b, y1 + 28, string_width(str[a]) + 12, 18)
	    if (selected_tab_dat = a) {
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
	//Background panel
	if (theme = 0) {
	    draw_set_color(c_white)
	    draw_rectangle(x1 + 6, y1 + 46, x1 + 494 + 50, y1 + 392, 0) 
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 6, y1 + 46, x1 + 494 + 50, y1 + 392, 1)
	    draw_set_color(c_white)
	    draw_rectangle(x1 + stabx, y1 + 26, x1 + stabx + stabw, y1 + 26 + 20, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + stabx, y1 + 26, x1 + stabx + stabw, y1 + 26 + 20, 1)
	    draw_set_color(c_white)
	    draw_rectangle(x1 + stabx + 1, y1 + 46, x1 + stabx + stabw - 1, y1 + 47, 0)
	    draw_theme_color()
	    draw_text(x1 + stabx + 8, y1 + 28, str[selected_tab_dat])
	} else if(theme = 1){
	    draw_sprite(spr_tabbuttons, 12, x1 + stabx - 1, y1 + 26)
	    draw_sprite_ext(spr_tabbuttons, 13, x1 + stabx + 1, y1 + 26, stabw / 2 - 1, 1, 0, -1, 1)
	    draw_sprite(spr_tabbuttons, 14, x1 + stabx + stabw - 1, y1 + 26)
	    draw_text(x1 + stabx + 8, y1 + 28, str[selected_tab_dat])
	}else{
		draw_set_color(c_dark)
	    draw_rectangle(x1 + 6, y1 + 46, x1 + 494 + 50, y1 + 392, 0) 
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 6, y1 + 46, x1 + 494 + 50, y1 + 392, 1)
	    draw_set_color(c_dark)
	    draw_rectangle(x1 + stabx, y1 + 26, x1 + stabx + stabw, y1 + 26 + 20, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + stabx, y1 + 26, x1 + stabx + stabw, y1 + 26 + 20, 1)
	    draw_set_color(c_dark)
	    draw_rectangle(x1 + stabx + 1, y1 + 46, x1 + stabx + stabw - 1, y1 + 47, 0)
	    draw_theme_color()
	    draw_text(x1 + stabx + 8, y1 + 28, str[selected_tab_dat])
	}
	if (nsel > -1) selected_tab_dat = nsel
	selected_tab_dat += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
	if (selected_tab_dat < 0) selected_tab_dat = 1
	if (selected_tab_dat > 1) selected_tab_dat = 0
	if (selected_tab_dat = 0) {
		draw_sprite(spr_datapack_exp, 2, x1 + 66, y1 + -40)
		draw_theme_color()

		//Name
		draw_text(x1 + 16, y1 + 208, "命名:")
		if (song_name != "") dat_name = song_name
		else if (filename != "") dat_name = string_copy(filename_name(filename), 1, string_length(filename_name(filename))-4)
		else dat_name = ""
		dat_name = draw_inputbox(50,x1 + 16, y1 + 225,145,dat_name,"此名字将被用于指令"+br+"用于在游戏内播放音乐.")

		//Namespace
		draw_set_color(c_gray)
		if ((string_path(dat_name) != "") && (string_path(dat_namespace) != "")) draw_theme_color()
		draw_text(x1 + 16, y1 + 255, "命名空间:")
		draw_theme_color()
		dat_namespace = draw_inputbox(51,x1 + 16, y1 + 272,145,dat_namespace,"(可选) 使用此选项可自定义命名空间."+br+"如果留空,将使用歌曲名称.")

		//Path
		draw_set_color(c_gray)
		if ((string_path(dat_name) != "") && (string_path(dat_namespace) != "") && dat_getpath(dat_path) != "") draw_theme_color()
		draw_text(x1 + 16, y1 + 301, "Path:")
		draw_theme_color()
		dat_path = draw_inputbox(52,x1 + 16, y1 + 318,145,dat_path,"(可选) 歌曲相对于主文件夹 'functions'"+br+"的路径. 你可以使用 '/' 来添加子文件夹.")

		//Preview
		draw_text(x1 + 16, y1 + 348, "指令预览:")
		draw_set_font(fnt_mainbold)
		if (string_path(dat_name) = "") draw_set_color(c_gray)
		draw_text(x1 + 16, y1 + 365, dat_preview(dat_name, dat_namespace, dat_path))
		draw_set_font(fnt_main)
		draw_theme_color()

		//Source
		draw_text(x1 + 187, y1 + 208, "声音源轨道")
		if (draw_radiobox(x1 + 192, y1 + 228, dat_source = "ambient", "环境", "由 '环境' 轨道控制")) dat_source = "ambient"
		if (draw_radiobox(x1 + 192, y1 + 247, dat_source = "block", "方块", "由 '方块' 轨道控制")) dat_source = "block"
		if (draw_radiobox(x1 + 192, y1 + 266, dat_source = "hostile", "敌对生物", "由 '敌对生物' 轨道控制")) dat_source = "hostile"
		if (draw_radiobox(x1 + 192, y1 + 285, dat_source = "master", "主音量", "由 '主音量' 轨道控制")) dat_source = "master"
		if (draw_radiobox(x1 + 192, y1 + 304, dat_source = "music", "音乐", "由 '音乐' 轨道控制")) dat_source = "music"
		if (draw_radiobox(x1 + 264, y1 + 228, dat_source = "neutral", "中立生物", "由 '中立生物' 轨道控制")) dat_source = "neutral"
		if (draw_radiobox(x1 + 264, y1 + 247, dat_source = "player", "玩家", "由 '玩家' 轨道控制")) dat_source = "player"
		if (draw_radiobox(x1 + 264, y1 + 266, dat_source = "record", "音符盒", "由 '唱片机/音符盒' 轨道控制")) dat_source = "record"
		if (draw_radiobox(x1 + 264, y1 + 285, dat_source = "voice", "语音", "由 '声音/语音' 轨道控制")) dat_source = "voice"
		if (draw_radiobox(x1 + 264, y1 + 304, dat_source = "weather", "天气", "由 '天气' 轨道控制")) dat_source = "weather"

		//Export as ZIP
		if (draw_checkbox(x1 + 192, y1 + 334, dat_usezip, "导出为压缩文件", "是否将资源包导出为压缩文件."+br+"不勾选将会保存成文件夹.")) dat_usezip=!dat_usezip

		//Locked layers
		if (draw_checkbox(x1 + 362, y1 + 213, dat_includelocked, "包含锁定轨道", "是否导出锁定轨道到资源包.")) dat_includelocked=!dat_includelocked

		//Out-of-range notes
		if (draw_checkbox(x1 + 362, y1 + 238, dat_includeoutofrange, "包含超范围音符", "是否包含不被Minecraft原版所支持的两个八度以外的音符"+br+"= 你需要一个额外资源包,可从下面获取.")) dat_includeoutofrange = !dat_includeoutofrange

		//Radius
		if (draw_checkbox(x1 + 362, y1 + 263, dat_enableradius, "附近能听到", "是否让在范围内多所有玩家"+br+"听到音乐.")) dat_enableradius = !dat_enableradius
		if(dat_enableradius) { 
			dat_radius = median(16, draw_dragvalue(6, x1 + 490, y1 + 283, dat_radius, 2),100000) 
			dat_radiusvalue = 1 + (dat_radius - 16) * 0.06
		}
		else draw_set_color(c_gray) draw_text(x1 + 490, y1 + 283, dat_radius)
		draw_text(x1 + 380, y1 + 283, "范围 (方块):")
		popup_set_window(x1 + 380, y1 + 279, 125, 21, "玩家能听到音乐的范围")
		draw_theme_color()

		//Looping
		if (draw_checkbox(x1 + 362, y1 + 313, dat_enablelooping, "开启循环", "开启后,将会在歌曲结束的时候"+br+"重新播放.")) dat_enablelooping = !dat_enablelooping
		if(dat_enablelooping) { 
			loopstart = median(0, draw_dragvalue(7, x1 + 490, y1 + 333, loopstart, 0.5), obj_controller.enda)
		}
		else draw_set_color(c_gray) draw_text(x1 + 490, y1 + 333, loopstart)
		draw_text(x1 + 380, y1 + 333, "循环:")
		popup_set_window(x1 + 380, y1 + 329, 125, 21, "歌曲在结束时将会重新播放的次数")
		draw_theme_color()
	
		//Get extra notes button
		if (draw_button2(x1 + 380, y1 + 362, 152, "获取额外音符资源包", !dat_includeoutofrange)) {
			datapack_getextranotes()
		}
	
	} else {
		if (draw_checkbox(x1 + 33, y1 + 55, dat_visualizer, "启用视觉效果", "提示:请使用虚空世界否则音符盒将会被积累起来!")) dat_visualizer=!dat_visualizer
		//Type
		draw_sprite(spr_datapack_exp, 1, x1 + 125, y1 + 55)
		draw_text(x1 + 33, y1 + 75, "视觉效果类型")
		if (draw_radiobox(x1 + 33, y1 + 95, dat_vis_type = "Arc", "音弧(Arc)", "使用Arc效果.")) dat_vis_type = "Arc"
		if (draw_radiobox(x1 + 33, y1 + 115, dat_vis_type = "Fall", "下落(Fall)", "使用Fall效果.")) dat_vis_type = "Fall"
		if (draw_radiobox(x1 + 33, y1 + 135, dat_vis_type = "Rise", "上升", "使用Rise效果.")) dat_vis_type = "Rise"
		if (draw_radiobox(x1 + 33, y1 + 155, dat_vis_type = "Bounce", "弹跳(Bounce)", "使用Bounce效果.")) dat_vis_type = "Bounce"
		if (draw_radiobox(x1 + 33, y1 + 175, dat_vis_type = "Piano Roll", "钢琴窗(Piano Roll)", "使用Piano Roll效果.")) dat_vis_type = "Piano Roll"
		if (draw_radiobox(x1 + 33, y1 + 195, dat_vis_type = "Fountain", "喷泉(Fountain)", "使用Fountain效果.")) dat_vis_type = "Fountain"
		if (draw_radiobox(x1 + 33, y1 + 215, dat_vis_type = "Rittai Onkyou", "下落式音游(Rittai Onkyou)", "使用Rittai Onkyou效果.")) dat_vis_type = "Rittai Onkyou"
		if (draw_checkbox(x1 + 33, y1 + 235, dat_glow, "使用发光", "是否向每一个音符盒添加发光效果.")) dat_glow=!dat_glow
		draw_text(x1 + 33, y1 + 255, "生成高度:")
		dat_yval = median(0, draw_dragvalue(11, x1 + 33, y1 + 275, dat_yval, 0.5), 255)
		draw_text(x1 + 33, y1 + 295, "在地图的坐标:")
		draw_text(x1 + 33, y1 + 318, "X 轴坐标:")
		dat_xval = draw_inputbox(53,x1 + 83, y1 + 315,40,dat_xval,"X value")
		draw_text(x1 + 33, y1 + 338, "Z 轴坐标:")
		dat_zval = draw_inputbox(54,x1 + 83, y1 + 335,40,dat_zval,"Z value")
		//Get note block textures button
		if (draw_button2(x1 + 13, y1 + 360, 152, "获取音符盒材质包")) {
			datapack_getinstextures()
		}
	}
	if (wmenu = 1 && !mouse_check_button(mb_left)) wmenu = 0

	//Submit button
	if (draw_button2(x1 + 470, y1 + 398, 72, "Export", false)) {
		if(string_lettersdigits(dat_name) != "") {
			if(string_count("/", dat_getpath(dat_path)) >= 5) {
				message("路径只能包含五个文件夹以内", "错误")
			} else {
				datapack_export()
			}
		}else{
			message("请输入一个可用的名字","错误")
		}
	}

	//Remember changes
	if (draw_checkbox(x1 + 12, y1 + 404, dat_remember, "记住更变", "在您下次导出时\n将会使用这些设置.") && wmenu = 0) dat_remember = !dat_remember

	//Use default
	if (draw_button2(x1 + 310, y1 + 398, 72, "使用默认值") && wmenu = 0) {
	    if (question("您 确 定 吗?", "确认")) dat_reset(1)
	}

	//Cancel button
	if (draw_button2(x1 + 390, y1 + 398, 72, "取消", false)) {
		window = 0
	}



}
