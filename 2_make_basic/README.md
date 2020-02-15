## make 유틸리티
make라는 유틸리티는 보통 현재 디렉토리에 Makefile 또는 makefile이라는 일정한 규칙을 준수해서 만든 파일 내용을 읽어서 target(목표 파일)을 만들어낸다.  
Makefile 이름을 다르게 사용하고 싶을 경우에는 아래같이 사용한다.  
~~~bash
$ make -f Makefile.linux
~~~  
멀티플랫폼 코드들은 Makefile.solaris, Makefile.freebsd, Makefile.hp 등과 같이 여러개 만들어 두기도 한다.  
아래와 같이 make <플랫폼> 식으로 컴파일한다.  
  
~~~sh
$ make linux

# Makefile
linux:
make -f Makefile.solaris
~~~  
  
## 1. Makefile
- Makefile 기본 구성  
목표: 목표를 만드는데 필요한 구성요소들..  
    목표를 달성하기 위한 명령 1  
    목표를 달성하기 위한 명령 2  
    ...  
  
make 명령을 치면 make all 이 수행된다.  
make foo1 foo2 foo3 같이 필요한 타겟만 빌드하게 할 수도 있다.  
  
~~~sh
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
~~~  
  
 - 꼬리말 규칙  
꼬리말 규칙을 지원해준다.  
makefile을 작성하다보면 .c -----> .o 의 관계가 매번 반복된다.  
한 두개일때는 모르지만, 수십 개가 넘으면 일일히 작성하기 번거로울 수 있다.  
그래서 아래처럼 사용이 가능하다.  
$<는 리다이렉션으로 입력을 받을때 사용한다.  
즉 .c.o라는 표현에서 .c 즉, C소스파일을 의미한다.  
~~~sh
.c.o:
    gcc -c ${CFLAGS} $<
~~~  
  
$<는 입력파일을 의미하고, $@는 출력파일을 의미한다.  
~~~sh
%_dbg.o: %.c
        gcc -c -g -o $@ ${CFLAG} $<

 DEBUG_OBJECTS = main_dbg.o edit_dbg.o

 edimh_dbg: $(DEBUG_OBJECTS)
        gcc -o $@ $(DEBUG_OBJECTS)
~~~  
%_dbg.o는 foobar.c파일을 빌드하면 foobar_dbg.o가 된다.  
$<: 입력파일(':'의 오른쪽에 오는 패턴)  
$@: 출력파일(':'의 왼쪽에 오는 패턴)  
$*: 입력파일에서 꼬리말(.c, .s 등)을 떼넨 파일명을 나타낸다.  
  
  
 - define  
make명령을 할때 인자로 define할 feature을 사용할 수 있다.  
make XPM=yes  
~~~sh
ifdef XPM
    LINK_DEF = -DXPM
endif
~~~  
  
 - 주의사항  
하나의 목표에 대해 여러 명령을 쓰면 안된다.  
각 명령은 각자의 서브 쉘에서 사용되기 때문이다.  
cd obj를 했다고 하더라도  
다음번 명령의 위치는 obj 디렉토리가 아니라 변함없이 현재 디렉토리이다.  
세번째 명령에서도 HOST_DIR변수를 찾으려 하지만, 두번째 명령이 종료한 후 HOST_DIR변수는 사라진다.  
~~~sh
target:
        cd obj
        HOST_DIR=/home/ 
        mv *.o $HOST_DIR
~~~  
한 쉘에서 사용하기 위해서는 세미콜론으로 각 명령을 구분한다.  
처음 두줄의 마지막에 쓰인 역슬래쉬(\)는 한 줄에 쓸 것을 나누어 쓴다는 것을 나타낸다.  
~~~sh
target:
       cd obj ; \
       HOST_DIR=/home/ ; \
       mv *.o $$HOST_DIR
~~~  
