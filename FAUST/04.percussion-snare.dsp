chair = library("chair.lib");

import("stdfaust.lib");
declare options "[midi:on]";

ctl0 = hslider("delay[midi:ctrl 11]",0.5,0.0000001,1,0.0000001) : si.smoo;
ctl1 = hslider("decay[midi:ctrl 12]",0.1,0,1,0.001) : si.smoo;
ctl2 = hslider("psi[midi:ctrl 13]",0.5,0.0001,1,0.00001) : si.smoo;

noise1 = 
	(no.noise : fi.lowpass(1, 2000) : + (10.5));

noise2 = 
	(no.noise : fi.lowpass(1, 100) : + (1) : * (0.75));

mainDecay = 
	((1 - pow(ctl1, 3)) * 0.275 ) + 0.7;

noise3 = 
	(no.noise : fi.lowpass(1, 500) : * (mainDecay/100));

// 

most(mainDtime) = 
	(
		_<:(_,_) :
		( +, _ :
			(
			// allp(gfactor, psi, deltime) = 
			chair.schmalfuss(1, noise2, noise1) :
			chair.schmalfuss(1, 0.5, 2.2) :
			chair.schmalfuss(1, 0.12, 2.5) :
			chair.schmalfuss(1, 0, noise3) :
			fi.lowpass(1, 7000) : fi.highpass(1, 200) :
			(* (-1)) : 
			max(-1) : min(1) :
			(* ( mainDecay ))),_ :
			+
		) ~ de.delay(ma.SR/5, mainDtime * 5 * ma.SR/10)
	);

process = 
	chair.dc_offset : 
	((fi.lowpass(1, 20) * 0.5) + 2.5, _) :
	most;
	
