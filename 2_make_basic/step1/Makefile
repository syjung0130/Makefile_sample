
all: main

main: main.o hey.o haha.o
	gcc -o main main.o hey.o haha.o

main.o: main.c hey.o haha.o
	gcc -c main.c

hey.o: hey.c
	gcc -c hey.c

haha.o: haha.c
	gcc -c haha.c

clean:
	rm -rf *.o
	rm -rf main