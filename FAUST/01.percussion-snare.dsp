chair = library("chair.lib");

fi = library("filters.lib");
no = library("noises.lib");

process = 
	chair.dc_offset : 
      // 1. DC as an envelope
      // 2. Clean signal
			// We'll take the output of the 2nd outlet unchanged all the way down to the last sum;
			// and work on the signal on the 1st bus
	(fi.lowpass(1, 20),_) :
	((_,* (0.5),_) : 
	(+,_) :
	(_,(no.noise:fi.lowpass(1,2000): * (0.5)), (no.noise:fi.lowpass(1,100): + (1) : * (0.75)),_) :
	(chair.allp, _ ) :
	(* (-1),_) :
	+) ~ _; 
