import numpy as np
import tensorflow as tf
from tensorflow.keras import layers, models

# Chuẩn bị dữ liệu
(x_train, y_train), (x_test, y_test) = tf.keras.datasets.mnist.load_data()
x_train, x_test = x_train / 255.0, x_test / 255.0 # Chuẩn hóa dữ liệu

# Thêm một chiều cho dữ liệu ảnh (để phù hợp với đầu vào của CNN)
x_train = np.expand_dims(x_train, -1)
x_test = np.expand_dims(x_test, -1)

# Xây dựng mô hình CNN
model = models.Sequential([
    layers.Conv2D(32, (3, 3), activation='relu', input_shape=(28, 28, 1)),
    layers.MaxPooling2D((2, 2)),
    layers.Conv2D(64, (3, 3), activation='relu'),
    layers.MaxPooling2D((2, 2)),
    layers.Conv2D(128, (3, 3), activation='relu'),
    layers.Flatten(),
    layers.Dense(64, activation='relu'),
    layers.Dense(10, activation='softmax') # 10 lớp đầu ra tương ứng với 10 số từ 0 đến 9
])

# Compile mô hình
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Huấn luyện mô hình
model.fit(x_train, y_train, epochs=5, validation_data=(x_test, y_test))

# Đánh giá hiệu suất của mô hình trên tập dữ liệu kiểm tra
test_loss, test_acc = model.evaluate(x_test, y_test)
print('Test accuracy:', test_acc)
