chair = library("chair.lib");

import("stdfaust.lib");
declare options "[midi:on]";

ctl0 = hslider("delay[midi:ctrl 11]",0.5,0.0000001,1,0.0000001) : si.smoo;
ctl1 = hslider("decay[midi:ctrl 12]",0.5,0,1,0.001) : si.smoo;
ctl2 = hslider("psi[midi:ctrl 13]",0.5,0.0001,1,0.00001) : si.smoo;

process = 
	// allp(decay, gfactor, deltime)
	chair.dc_offset : (_* ctl0, _) : chair.allp(ctl1, ctl2);
