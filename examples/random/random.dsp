declare name "Random";
declare author "Piotr Goj";

import("stdfaust.lib");

bang = button("bang") : ba.impulsify;						// bang

										
random(number, bang) = (((no.noise + 1) / 2) * number) : int : ba.sAndH(bang);	// generate number from 0 to number value after pressing bang button 																	

process = random(30, bang) + 50 : ba.midikey2hz : os.osc <: _, _;		// connections between objects, <: _, _ (stereo)
