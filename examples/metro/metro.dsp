declare name "metro";
declare author "Piotr Goj";

import("stdfaust.lib");

metroSlider = hslider("metro", 60, 30, 240, 1);	// metro slider	

metro = ba.beat(metroSlider);	// [metro]

// attack and release use in envelope
attack = 0.001;
release = 0.2;
process = en.ar(attack, release, metro) * no.noise <: _, _;
