#!/bin/sh
docker run -it --volume="$PWD/build:/workdir/build" linux-makefile:imx-1
