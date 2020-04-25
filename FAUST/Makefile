#sources = *.dsp

TARGETS = 01.percussion-snare 02.unitary-delay-network 03.decomplexed-network

#jackconsole : %.cpp
#	faust -a jack-console.cpp -o 01.percussion-snare.cpp 01.percussion-snare.dsp 
#	g++ -lpthread `pkg-config --cflags --libs jack` -Wfatal-errors -O3 -mfpmath=sse -msse -msse2 -msse3 -ffast-math 01.percussion-snare.cpp -o 01.percussion-snare-jackconsole
#	g++ -lpthread `pkg-config --cflags --libs jack` -Wfatal-errors -O3 -mfpmath=sse -msse -msse2 -msse3 -ffast-math $< -o $@
#	install -d build
#	install 01.percussion-snare-jackconsole build/01.percussion-snare-jackconsole
#	rm 01.percussion-snare-jackconsole

#%.cpp : $(sources)
#	faust -a jack-console.cpp -o $@.cpp $<

#oldsvg : 01.percussion-snare.dsp 
#	faust -svg 01.percussion-snare.dsp > /dev/null
#jackconsole : 01.percussion-snare.dsp 02.unitary-delay-network.dsp 03.decomplexed-network.dsp

.PHONY : all clean

all : $(TARGETS)

clean:
	rm -rf *.cpp *-svg *-mdoc $(TARGETS)

jackconsole :
	faust2jackconsole -midi $<

svg : $(sources)
#	faust -svg $< > /dev/null
	faust2svg $<

