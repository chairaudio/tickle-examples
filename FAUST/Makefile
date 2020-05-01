
dspsrc  := $(wildcard *.dsp)
cppsrc  := $(dspsrc:.dsp=.cpp)
#plugins	:= $(dspsrc:%.dsp=%~.pd_linux)
svg 	:= $(dspsrc:.dsp=-svg)
jconsole 	:= $(dspsrc:.dsp=)
#xml 	:= $(dspsrc:.dsp=.dsp.xml)
#pd 	:= $(dspsrc:.dsp=.pd)

all: $(jconsole) $(svg)

graphics: $(svg)

standalones: $(jconsole)

clean:
	rm -Rf *~ $(svg) $(jconsole)

%-svg: %.dsp
	faust2svg $< 

% : %.dsp
	faust2jackconsole -midi $<

install:
	install -d build
	install $(jconsole) build/
	rm $(jconsole)

#%.cpp %-svg: %.dsp
#	faust -xml -svg -sd -a puredata.cpp $< -o $@

#%~.pd_linux: %.cpp
#	g++ -shared -fPIC -Dmydsp=$(@:%~.pd_linux=%) -o $@ $<

#%.pd: %.dsp.xml
#	faust2pd -s $<
