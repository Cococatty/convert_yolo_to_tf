import tensorflow as tf
print(tf.__version__)

converter = tf.lite.TFLiteConverter.from_saved_model('~/resources/yolov7/outputs')
tflite_model = converter.convert()

with open('~/resources/yolov7/outputs/yolov7_model.tflite', 'wb') as f:
  f.write(tflite_model)
