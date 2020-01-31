# Makefile_sample
Makefile sample

## build docker image
mkdir build  
docker build -t linux-makefile:imx-1 .  
  
## run docker container
docker run -it --volume="$(PWD):/workdir/build" linux-makefile:imx-1
  
