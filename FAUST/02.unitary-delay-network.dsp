chair = library("chair.lib");

import("stdfaust.lib");
declare options "[midi:on]";

delay = hslider("delay[midi:ctrl 11]",0.5,0.0000001,1,0.0000001) : si.smoo;
decay = hslider("decay[midi:ctrl 12]",0.5,0,1,0.001) : si.smoo;
theta = hslider("theta[midi:ctrl 13]",0.5,0.0001,1,0.00001) : si.smoo;

	// udn(deltime, theta, gfactor) 
	// Two inputs, one for each of the delaylines.
	// In this case the dc-offset is feeding the second delay,
	// which can be seen as the imaginary part of the signal.
	// In this patch the delay lies between 0 and 5 milliseconds,
	// but the maxdelay time for the udn in the chair.lib
	// is set to 20 hundrets of a second.
	// In applications where memory matters,
	// this value might want to be changed in the library.
process = chair.dc_offset : chair.udn(delay, theta, decay);
