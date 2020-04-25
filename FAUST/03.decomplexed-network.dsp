chair = library("chair.lib");

import("stdfaust.lib");
declare options "[midi:on]";

g(x) =
	(x, _, x, _, x, _, x,_) : (*,*,*,*);

ctl0 = hslider("delay[midi:ctrl 11]",0.5,0.0000001,1,0.0000001) : si.smoo;
ctl1 = hslider("decay[midi:ctrl 12]",0.5,0,1,0.001) : si.smoo;
ctl2 = hslider("psi[midi:ctrl 13]",0.5,0.0001,1,0.00001) : si.smoo;

mx(psi,damp) = 
	(cos(psi),_, sin(psi) * (-1),_, sin(psi),_, cos(psi),_) : (*,*,*,*) : g(damp);

process = 
	((_,chair.x,_) : (+,+) : (_,_) <: mx((ctl2 * ma.PI),(1-(ctl1/10))) : (+,+)) ~ 
	(de.delay(ma.SR/5, ctl0*5*ma.SR/1000),de.delay(ma.SR/5, 5*ma.SR/1000)) ;
