# using MACRO
# make XPM=yes: for user build option..
ifdef XPM
	LINK_DEF=-DXPM
endif

# MACRO
INC_DIR=./
CFLAGS=-O4 -I=${INC_DIR}
OBJECTS=main.o hey.o haha.o

all: main

main: $(OBJECTS)
	gcc -o $@ ${CFLAGS} main.o hey.o haha.o

%.o: %.c
	gcc -c ${CFLAGS} $<

clean:
	rm -rf *.o
	rm -rf main
