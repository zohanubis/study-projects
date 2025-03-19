import cv2
import numpy as np
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
from sklearn.datasets import fetch_openml

# Load dữ liệu MNIST từ scikit-learn
mnist = fetch_openml('mnist_784', version=1)
X = mnist.data.astype('float32')
y = mnist.target.astype('int64')

# Chuẩn hóa dữ liệu về khoảng [0, 1]
X /= 255.0

# Chia dữ liệu thành tập huấn luyện và tập kiểm tra
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Khởi tạo mô hình SVM
model = SVC(kernel='rbf')

# Huấn luyện mô hình
model.fit(X_train, y_train)

# Dự đoán nhãn cho tập kiểm tra
y_pred = model.predict(X_test)

# Đánh giá độ chính xác của mô hình
accuracy = accuracy_score(y_test, y_pred)
print("Accuracy:", accuracy)

# Kiểm tra dự đoán trên một ảnh cụ thể
index = np.random.randint(0, len(X_test))
sample_image = X_test[index].reshape(28, 28) * 255.0
sample_image = sample_image.astype(np.uint8)
predicted_label = model.predict([X_test[index]])

print("Predicted label:", predicted_label[0])
cv2.imshow("Sample Image", sample_image)
cv2.waitKey(0)  # Đợi cho đến khi một phím bất kỳ được nhấn
cv2.destroyAllWindows()
