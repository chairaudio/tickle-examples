chair = library("chair.lib");

de = library("delays.lib");
fi = library("filters.lib");
no = library("noises.lib");
ma = library("maths.lib");

process = 
	chair.dc_offset : 
  // 1. DC as an envelope
  // 2. Clean signal
 	// We'll take the output of the 2nd outlet unchanged all the way down to the last sum;
 	// and work on the signal on the 1st bus

	(fi.lowpass(1, 20),_) :
	(* (0.5),_) : 

	// This is where the magic happens.
	// What is delread in pd is ( ... ~ _ ) this loop in faust.
	// The opening braces is the beginning of the loop
	// and the ~-Symbol is forking the signal to feed it back as an additional input to the block.
	((no.noise:fi.lowpass(1,2000): * (0.5)), (no.noise:fi.lowpass(1,100): + (1) : * (0.75)),_,_) :
	((chair.allp,_,_) :
	(((_,2.2, 0.5) : chair.allp),_,_) :
	(((_,2.5, 0.14) : chair.allp),_,_) :
	(((_,4, 1) : chair.allp),_,_) :
	(fi.lowpass(1,2000),_,_) :
	(fi.highpass(1,200),_,_) :
	(* (-1),_,_) :
	(* (0.98),_,_) :
	(+,_) :
	de.fdelay4(ma.SR/5)) ~ _; 
