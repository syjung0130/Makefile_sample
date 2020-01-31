FROM ubuntu:16.04

RUN sed -i s/archive.ubuntu.com/ftp.daumkakao.com/g /etc/apt/sources.list
RUN apt-get update 


RUN apt-get install -y make 
RUN apt-get install -y git unzip 
RUN apt-get install -y wget
RUN apt-get install -y vim

RUN apt-get install -y build-essential

VOLUME /workdir/build
WORKDIR /workdir/build

CMD ["/bin/bash"]
