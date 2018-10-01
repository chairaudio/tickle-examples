# VCV Rack

Welcome to the VCV Rack examples for the Tickle instrument.

VCV Rack is a virtual Eurorack modular synthesizer. It is free open source software by Andrew Belt. Many modules already come included with it (the "fundamental" package) and many more are available for free or paid from contributing developers.
https://vcvrack.com/


## About these examples

At some point, we will have an official Tickle module in VCV Rack, but not just yet.
For now you can bridge the input of the hardware via a Pd-patch which you will find in the `Pd` folder of these examples.

Use _Jack_ (Linux, Mac, Win), _Soundflower_ (Mac) or _LoopBeAudio_ (Win) to route the 6 audio channels into VCV Rack. 
Please check if you are able to send the full +/- 15V CV range over the virtual audio bridge. If not you might need to scale and rescale.

The are: Excitation, envelope, gate, x, y, DC-offset.

If you find any issues or would like to contribute, please get in touch via the issue tracker on gitlab/github or by email max@chair.audio
