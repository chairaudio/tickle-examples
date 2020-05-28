chair = library("chair.lib");

import("stdfaust.lib");
declare options "[midi:on]";

delay = hslider("delay[midi:ctrl 11]",0.5,0.0000001,1,0.0000001) : si.smoo;
decay = hslider("decay[midi:ctrl 12]",0.5,0,1,0.001) : si.smoo;
theta = hslider("theta[midi:ctrl 13]",0.5,0.0001,1,0.00001) : si.smoo;

// This is the 
process = chair.schmalfuss(delay, theta, decay);
