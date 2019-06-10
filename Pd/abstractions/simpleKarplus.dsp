declare name "KarplusStrong";
declare description "Simple call of the Karplus-Strong model for the Faust physical modeling library";
declare license "MIT";
declare copyright "(c)Romain Michon, CCRMA (Stanford University), GRAME";

import("stdfaust.lib") ;
myKarplus = _*gate : pm.ks( (freq : pm.f2l), damping )
with{
	f = hslider("v:karplus/h:[0]params/[1]freq[style:knob]",440,50,1000,0.01);
	bend = hslider("v:karplus/h:[0]params/[1]bend[style:knob][hidden:1][midi:pitchwheel]"
	,1,0,10,0.01) : si.polySmooth(gate,0.999,1);
	s = hslider("v:karplus/h:[0]params/[1]sustain[hidden:1][midi:ctrl 64][style:knob]"
	,0,0,1,1);
	damping = hslider("v:karplus/h:[0]params/[1]damping[midi:ctrl 1][style:knob]"
	,0.01,0,1,0.01) : si.smoo;
	t = button("v:karplus/[1]gate");

	gate = t+s : min(1);
	freq = f*bend;
};

process = myKarplus;
