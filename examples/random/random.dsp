import("stdfaust.lib");

bang = button("bang") : ba.impulsify;						// bang

random = (((no.noise + 1) / 2) * 30) : int + 50 : ba.sAndH(bang);		// ((no.noise + 1) / 2) * 30) generates float point numbers from 0 to 30,
										// int convert it to integer, then add 50.
																		

process = random : ba.midikey2hz : os.osc <: _, _;				// connections between objects, <: _, _ (stereo)
