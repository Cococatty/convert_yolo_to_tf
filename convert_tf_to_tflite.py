import tensorflow as tf


converter = tf.lite.TFLiteConverter.from_saved_model('outputs')
tflite_model = converter.convert()


with open('outputs/yolov7.tflite', 'wb') as f:
  f.write(tflite_model)
