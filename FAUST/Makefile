jackconsole: 01.percussion-snare.dsp 
	faust -a jack-console.cpp -o 01.percussion-snare.cpp 01.percussion-snare.dsp 
	g++ -lpthread `pkg-config --cflags --libs jack` -Wfatal-errors -O3 -mfpmath=sse -msse -msse2 -msse3 -ffast-math 01.percussion-snare.cpp -o 01.percussion-snare-jackconsole
	install -d build
	install 01.percussion-snare-jackconsole build/01.percussion-snare-jackconsole
	rm 01.percussion-snare-jackconsole

svg: 01.percussion-snare.dsp 
	faust -svg 01.percussion-snare.dsp > /dev/null
clean:
	rm -f *.cpp
	rm -rf *-svg
	rm -rf *-mdoc
