#!/bin/bash

# create virtual env
sv :create convert

# prepare YOLOv7
if [ ! -d "yolov7" ]
then
	git clone https://github.com/WongKinYiu/yolov7.git
else
	echo "yolov7 is NOT cloned as yolov7 directory already exists"
	exit
fi

mkdir -p outputs
cd outputs

# download weight file
if [ ! -f "yolov7.pt" ]
then
	wget https://github.com/WongKinYiu/yolov7/releases/download/v0.1/yolov7.pt
else
	echo "yolov7 weight file is NOT downloaded as it already exists"
	exit
fi
