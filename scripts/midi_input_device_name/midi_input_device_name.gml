function midi_input_device_name(argument0) {
	//  midi_input_device_name(device)
	//      device      Number of the device

	//  Returns the name of a connected MIDI input device.

	//  By David "Davve" Norgren for MIDI input - www.stuffbydavid.com

	return external_call(lib_midi_input_device_name, argument0);



}
