SRCS := $(wildcard *.dsp)
BINS := $(SRCS:%.dsp=%)
SVGS := $(foreach wrd, $(BINS), $(wrd)-svn)

.PHONY : all clean

all : $(BINS)

clean :
	rm -rf *.cpp *-svg *-mdoc $(BINS) faust.*

% : %.dsp
	faust2jackconsole -midi $<

svg : $(SVGS)

$(SVGS) : $(SRCS)
	faust2svg $<

