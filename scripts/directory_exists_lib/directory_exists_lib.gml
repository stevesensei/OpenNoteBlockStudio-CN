function directory_exists_lib(argument0) {
	// directory_exists_lib(dir)

	if (argument0 = "")
	    return 0

	return external_call(lib_directory_exists, argument0)



}
