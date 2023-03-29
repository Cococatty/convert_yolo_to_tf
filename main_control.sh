#!/bin/bash

# Help
Help()
{
	# Display Help
	echo "Add description of the script functions here."
	echo
	echo "Syntax: main_control.sh [-h|-e|-A]"
	echo "options:"
	echo "-A, --all		Perform all tasks required to complete the conversion for official YOLOv7 model to be in TFLite format"
	echo "-e, --export-pt		Export YOLOv7 model file in PyTorch format"
	echo "-tf, --onnx-to-tf		Onnx to TensorFlow format"
	echo "-tflite, --tf-to-tflite		TensorFlow to TensorFlowLite format"
	echo
}

# Prepare Step
Prepare()
{
	sh ./prepare_material.sh
}

ExportOnnx()
{
	Prepare
	cd yolov7
	sv convert python3 export.py --weights ../outputs/yolov7.pt --grid --end2end --simplify --topk-all 100 --iou-thres 0.65 --conf-thres 0.35 --img-size 640 640 --max-wh 640
}

OnnxToTF()
{
	Prepare
	cd outputs
	sv convert onnx-tf convert -i yolov7.onnx -o .
}

TFToTFLite()
{
	Prepare
	sv convert python3 convert_tf_to_tflite.py
}


# Main program
while [ $# -gt 0 ]; do
	case "$1" in
		-h|--help) # display Help
			Help
			exit;;
		-p|--prepare)
			Prepare
			exit;;
		-e|--export-pt) # export model file to PyTorch
			ExportOnnx
			exit;;
		-tf|--onnx-to-tf) # convert onnx model to TensorFlow
			OnnxToTF
			exit;;
		-tflite|--tf-to-tflite) # convert TF model file to TFLite
			TFToTFLite
			exit;;
		-A|--all) # perform all tasks
			ExportOnnx
			# Convert to ONNX to TF
			OnnxToTF
			# Conver the TensorFlow model to TFLite
			TFToTFLite
			exit;;
		\?) # Invalid option
			echo "Error: Invalid option"
			exit;;
	esac
done
