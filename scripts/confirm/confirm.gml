function confirm() {
	// confirm(gameend)

	var a, gameend;
	playing = 0
	if (argument_count > 0)
	    gameend = argument[0]
	else
	    gameend = 0
	a = 0

	if (changed) {
	    if (filename = "") {
	        if (!gameend)
	            a = message_yesnocancel("Do you want to save the song?", "Confirm")
	        else
	            a = question("Do you want to save the song before quitting?", "Confirm")
	        if (a = 1)
	            if (!save_song(""))
	                return -1
	    } else {
	        if (!gameend)
	            a = message_yesnocancel("Do you want to save the changes made in " + filename_name(filename) + "?", "Confirm")
	        else
	            a = question("Do you want to save the changes made in " + filename_name(filename) + " before quitting?", "Confirm")
	        if (a = 1)
	            if (!save_song(filename))
	                return -1
	    }
	}

	return a



}
