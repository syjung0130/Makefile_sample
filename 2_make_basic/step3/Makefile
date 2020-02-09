# gnu make( $<, $@, %.o: %c)

all: main

main: main.o hey.o haha.o
	gcc -o $@ main.o hey.o haha.o

%.o: %.c
	gcc -c $<

clean:
	rm -rf *.o
	rm -rf main