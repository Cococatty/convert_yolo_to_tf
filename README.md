# About this Repository
This repository aims to demostrate how to convert [YOLOv7 PyTorch model file](https://github.com/WongKinYiu/yolov7) to TFLite, with steps adapoted from [Converting YOLO V7 to Tensorflow Lite for Mobile Deployment](https://medium.com/geekculture/converting-yolo-v7-to-tensorflow-lite-for-mobile-deployment-ebc1103e8d1e).


# Perform Conversions
## Sequential Steps
1. Convert PyTorch model to ONNX model
2. Convert ONNX model to TensorFlow model
3. Convert TensorFlow model to TensorFlow lite

## Perform the entire conversion
In a terminal window, run:
```sh ./main_control.sh -A```

## PyTorch to ONNX
In a terminal window, run:
```sh ./main_control.sh -e```

## ONNX to TensorFlow
In a terminal window, run:
```sh ./main_control.sh -tf```

## TensorFlow to TFLite
In a terminal window, run:
```sh ./main_control.sh -tflite```

# Run Inferences (with one Yolov7 image)
```sv python3 inference_with_tflite.py```

# For Help and Information
In a terminal window, run:
```sh ./main_control.sh --help```

# Thanks and Credit
Thanks to both [WongKinYiu](https://github.com/WongKinYiu) and [Vikas Kumar Ojha](https://vikasojha894.medium.com/) for sharing their great work which allow me to have another AI exploration!
