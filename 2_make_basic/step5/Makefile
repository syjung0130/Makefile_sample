# using shell in Makefile

# make XPM=yes: for user build option..
ifdef XPM
	LINK_DEF=-DXPM
endif

# MACRO
INC_DIR=./
CFLAGS=-O4 -I=${INC_DIR}
OBJECTS=main.o hey.o haha.o

all: main

# if you did not use '\', each command runs in seperated shell.
# if you use command in same shell, must use '\'.
# to separate each command, add ';' to the end of command.
main: $(OBJECTS)
	gcc -o $@ ${CFLAGS} main.o hey.o haha.o; \
	cd ..; \
	echo $(pwd); \
	cd -; \
	echo $(pwd); \
	echo "build out complete !"

%.o: %.c
	gcc -c ${CFLAGS} $<; \
	echo "build c sources !"

clean:
	rm -rf *.o
	rm -rf main
