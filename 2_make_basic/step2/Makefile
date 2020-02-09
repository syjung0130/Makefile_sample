
all: main

main: main.o hey.o haha.o
	gcc -o main main.o hey.o haha.o

.c.o:
	gcc -c $<

clean:
	rm -rf *.o
	rm -rf main