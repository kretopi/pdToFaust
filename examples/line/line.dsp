declare name "line";
declare author "Piotr Goj";

import("stdfaust.lib");

bang = button("bang"):ba.impulsify;
start = hslider("start", 200, 0, 1000, 1) : ba.sAndH(bang);
end = hslider("end", 500, 0, 1000, 1) : ba.sAndH(bang);
duration = hslider("duration", 1, 0, 5, 0.01) : ba.sAndH(bang);


process =  line(start, end, duration, bang): os.osc;

line(start, end, duration,gate) = L
  
  		// based on en.ar function
  
	with {

	    // durations in samples
		dur = max(1, duration * ma.SR);

		// step per samples
    	step = (end - start) / dur;
 

    	// attack time (starts at gate upfront and raises infinitely)
    	atime = (raise*reset + upfront) ~ _
    	with {
    	    upfront = gate > gate';
    	    reset = gate <= gate';
    	    raise(x) = (x + (x > 0));
			};
  
		// wait for gate
		S = atime > 1;

		// line curve
		A = start + step * atime;
	
		// case up or down
		L = ba.if(end > start, A * S : min(end) * S, A * S : max(end) * S);
  
		};
