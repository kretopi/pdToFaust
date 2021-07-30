declare name "counter";
declare author "Piotr Goj";

import("stdfaust.lib");

// button
bang = button("bang") : ba.impulsify;

// list midi notes
notes = (60, 62, 64, 65, 67, 69, 71, 72);

// count from 0 to 7
counter = _~+(bang) : ma.modulo(_, 8);

// take from list 
playNotes = ba.listInterp(notes, counter);

// convert midi to frequency and play sinwave
process = playNotes : ba.midikey2hz : os.osc <: _, _;