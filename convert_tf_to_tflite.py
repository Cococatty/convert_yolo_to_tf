import tensorflow as tf
print(tf.__version__)

converter = tf.lite.TFLiteConverter.from_saved_model('outputs')
tflite_model = converter.convert()

with open('outputs/yolov7_model.tflite', 'wb') as f:
  f.write(tflite_model)
