# GCC  
about gcc, gcc command options  

# Makefile_sample
Makefile sample

## build docker image
mkdir build  
docker build -t linux-makefile:imx-1 .  
  
## run docker container
docker run -it --volume="$(PWD):/workdir/build" linux-makefile:imx-1
  
## 참고 url
https://wiki.kldp.org/KoreanDoc/html/gcc_and_make/gcc_and_make.html#toc3  
http://doc.kldp.org/KoreanDoc/html/GNU-Make/GNU-Make.html#toc2  