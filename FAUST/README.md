# FAUST

Welcome to the FAUST examples for the Tickle instrument.

FAUST is a powerful audio programming environment with a focus on physical modelling. Faust is Free Software and can be used directly in the browser. FAUST code can be compiled to be used as standalon application of plugins for a plenthora of different hosts, arcitectures and plugin standards.  
http://faust.grame.fr/editor/ http://faust.grame.fr/compiler

http://faust.grame.fr/


## About these examples

Here will be some examples, for now look inside the `Pd` folder where you can find an example with FAUST DSP code using `faustgen~` for Pd.

If you would like to contribute, please get in touch via the issue tracker on gitlab/github or by email `max@chair.audio`

### CHAIR snare drum

This is the state of the port of Philipps snare drum from pd to faust. At the time the code should easily compile to a jack-console binary by typing 'make' in the console inside the directory.

The executable is installed in a build directory at the same place. So if you don't want, or cannot execute files from that place, you'll have to move it somewhere else.

What is lacking at the moment is the control interface. I want to implement it through midi. I'll dig into it later, most likely tomorrow.
