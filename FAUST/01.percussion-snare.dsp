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
	(+ (2.947),_) : 

	// This is where the magic happens.
	// What is delread in pd is ( ... ~ _ ) this loop in faust.
	// The opening braces is the beginning of the loop
	// and the ~-Symbol is forking the signal to feed it back as an additional input to the block.
	((no.noise:fi.lowpass(1,2000): * (10.5)), (no.noise:fi.lowpass(1,100): + (1) : * (0.75)),_,_) :
	((_,chair.x,_,_) :
	(chair.x,_,_,_) :
	(_,chair.x,_,_) :
	(chair.allp,_,_) :
	(((0.5, 2.2, _) : chair.allp),_,_) :
	(((0.14, 2.5, _) : chair.allp),_,_) :
	(((1, 4, _) : chair.allp),_,_) :
	(fi.lowpass(1,7000),_,_) :
	(fi.highpass(1,200),_,_) :
	(* (-1),_,_) :
	(* (0.99),_,_) :
	(chair.x,(_<:(_,_))) :
	(_,+,_) :
	//de.fdelay4(ma.SR/5),_) ~ _ : (!,_); 
	de.delay(ma.SR/5),_) ~ _ : (!,_); 
