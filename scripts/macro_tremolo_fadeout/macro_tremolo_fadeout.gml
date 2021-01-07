function macro_tremolo_fadeout() {
	// macro_tremolo_fadeout()
	var c, d , e, f, str, total_vals, total_cols, val, replength, colcount, decr, inc, tremolo_duration, prevlength, previous_colsegment, current_colsegment;
	str = selection_code
	if (selected = 0) return 0
	arr_temp = selection_to_array(str)
	total_vals = string_count("|", str)
	//show_debug_message("total vals is "+string(total_vals))
	total_cols = string_count("-1", str)
	//show_debug_message("total cols is "+string(total_cols))
	val = 0
	c = 0
	colcount = 0
	prevlength = 0
	previous_colsegment = 0
	for (d = 0; d < total_cols; d++;) {
		e = 0
		while arr_temp[val] != -1 {
			arr_col[e] = arr_temp[val]
			val++
			e++
		}
		if arr_temp[val] = -1 arr_col[e] = -1
		val++
	//	show_debug_message(string(val) + " values processed." )
		e++
	//	show_debug_message("arr_col now stores " + string(array_to_selection(arr_col, e)))
		if val >= total_vals { //dump col into arr_data and break
			for (var b = 0; b < e; b++) {
				if b = 0 arr_col[b] = 1
				arr_data[c] = arr_col[b]
				c++
			}
			break
		}
		if arr_temp[val] >= 1 replength = real(arr_temp[val] / trem_spacing)
	//	show_debug_message("repeat length is " + replength)
		arr_temp[val] = 1
		for (var a = 0; a < replength; a++) {
			for (var b = 0; b < e; b++) {
				if b = 0 arr_col[b] = trem_spacing
				arr_data[c] = arr_col[b]
				c++
			}
		}
	    // show_debug_message("End loop. arr_data is now " + string(array_to_selection(arr_data, c)))
		colcount++
		current_colsegment = string_count("-1", string(array_to_selection(arr_data, c))) - previous_colsegment
		tremolo_duration = (real(array_length_1d(arr_data)) - prevlength) // Calculate Fade-In
		f = 0
		if fade_auto = 1 {
			if (current_colsegment - 4 > 0) decr = 100 / (current_colsegment - 4)
			else if (current_colsegment - 2 > 0) decr = 100 / (current_colsegment - 2)
			else decr = 100 / current_colsegment
		} else decr = leg_dec
		inc = decr
		while (f < tremolo_duration) {
			f += 4
			if  (100 - decr >= 20) arr_data[f + prevlength] = 100 - decr
			else if fade_auto = 1 arr_data[f + prevlength] = 20
			else arr_data[f + prevlength] = leg_sus
			f += 3
			while arr_data[f + prevlength] != -1 {
				f += 3
				if  (100 - decr >= 20) arr_data[f + prevlength] = 100 - decr
				else if fade_auto = 1 arr_data[f + prevlength] = 20
				else arr_data[f + prevlength] = leg_sus
				f += 3
			}
			decr = decr + inc
			f ++
		}
		prevlength = real(array_length_1d(arr_data))
		previous_colsegment += current_colsegment
		decr = 0
		inc = 0
	}
	arr_data[0] = 0
	//show_debug_message("Out of loop. arr_data has been changed to " + string(array_to_selection(arr_data, c)))
	str = array_to_selection(arr_data, c)
	arr_data = 0
	selection_load(selection_x,selection_y,str,true)
	if(!keyboard_check(vk_alt)) selection_place(false)
	selection_code_update()


}
