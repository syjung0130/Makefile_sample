
## 자주 사용하는 gcc 옵션들
### -o 옵션(output파일을 만든다) 
~~~sh
/workdir/build# gcc -o main hello.c main.c
/workdir/build# ./main 
hello~
~~~


### -c옵션(컴파일)
 - -c 옵션을 사용해서 object파일을 만든다  
 - object파일을 만들고 -o 옵션을 사용해서 실행파일(output)을 만들도록 할 수 있다  
~~~sh
/workdir/build# gcc -c hello.c main.c
/workdir/build# ll
total 24
drwxr-xr-x 7 root root  224 Jan 31 05:33 ./
drwxr-xr-x 3 root root 4096 Jan 31 05:19 ../
-rw-r--r-- 1 root root   81 Jan 31 05:31 hello.c
-rw-r--r-- 1 root root   67 Jan 31 05:30 hello.h
-rw-r--r-- 1 root root 1496 Jan 31 05:33 hello.o
-rw-r--r-- 1 root root   82 Jan 31 05:32 main.c
-rw-r--r-- 1 root root 1376 Jan 31 05:33 main.o

/workdir/build# gcc -o main hello.o main.o 
/workdir/build# ./main
hello~
~~~  
  
  
### gcc
gcc 컴파일러의 parameter로 .o를 전달하고 있다.  
이는 gcc 가 C만 컴파일하는 것이 아니라 컴파일러를 실행하는 실행파일이기 때문에 가능하다.  
C언어는 기본적으로 아래의 과정을 거쳐야만 실행파일이 생성된다.  
 - 컴파일(cc1): (.c --> .o)  
 - 링크(ld). : (.o --> 실행파일)  
  
gcc 는 확장자를 보고 알아서 컴파일과 링크를 수행하도록 설계되어있다.  
즉, gcc는 컴파일러와 링크를 불러주는 대리인이다.  
  
### -I 옵션(헤더파일 include)
 - 헤더파일이 위치한 곳을 지정하는 옵션  
 - <>를 쓴 경우, /usr/include를 기준으 파일을 찾아 include한다.  
 - ""를 쓴 경우, 현재 디렉토리에서 파일을 찾아 include한다.  
 - -I옵션은 여러번 사용이 가능하고, 주어진 순서대로 파일을 탐색한다.  
 - 예제코드 참고(haha.c, haha.h, main_haha.c)  
~~~sh
/workdir/build# gcc -c haha.c main_haha.c -I./
/workdir/build# gcc -o main_haha haha.o main_haha.o 
/workdir/build# ./main_haha 
~~~  
  
### -l 옵션(링킹할 라이브러리 지정)
 - 링킹할 라이브러리를 지정하는 옵션이다.  
 - shared object를 링킹하기 위해서는 별도의 옵션을 추가해주어야한다.  
 - 링킹할 라이브러리가 libmyhey.a라면 -lmyhey 이런 식으로 옵션을 붙여주면 된다.  
  
### -L 옵션(라이브러리 위치 지정)
 - 링킹할 라이브러리의 경로를 지정하는 옵션이다.  
 - 리눅스에서 라이브러리를 찾을 때는 기본적으로 /lib, /usr/lib, /usr/local/lib 경로에서만 찾지만,  
 특정경로에 있는 만든 라이브러리를 링킹할 경우, -L옵션을 사용해서 경로를 지정해주면 된다.  
 - -L<디렉토리명> 처럼 사용하며, 예를 들어, 현재 디렉토리를 링킹할 경우, -L./ 이렇게 사용하면 된다.  
  
### 라이브러리
여기서는 .a(static library)를 예로 들어서 보자.  
a 는 archive의 약자로, "모음"이라는 뜻이다.  
실제로 아래 명령으로 libc를 보면, 다른 object들의 모음인 것을 알 수 있다.  
그리고 라이브러리는 이 오브젝트들에 index를 붙여서 관리한다.  
~~~sh
/workdir/build# ar t libc.a
~~~  
  
### static library 사용 예제
예제코드: hey.h, hey.c main_hey.c  
~~~sh
/workdir/build# gcc -c hey.c -I./
/workdir/build# ar r libhey.a hey.o 
ar: creating libhey.a
/workdir/build# ar s libhey.a 
/workdir/build# ar t libhey.a 
hey.o

/workdir/build# gcc -o main_hey main_hey.c -I./ -L./ -lhey
root@f6df67fb98e7:/workdir/build# ./main_hey 
hey~
root@f6df67fb98e7:/workdir/build# 
~~~  
  
