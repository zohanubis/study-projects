import tkinter as tk
from tkinter import filedialog
import cv2
from matplotlib import pyplot as plt
from skimage.feature import hog
from skimage import exposure

def extract_features(image_path, feature_type='canny'):
    # Đọc ảnh từ đường dẫn
    image = cv2.imread(image_path)
    
    # Rút trích đặc trưng dựa trên loại đặc trưng được chỉ định
    if feature_type == 'canny':
        # Chuyển ảnh sang grayscale để xử lý
        gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        # Rút trích đặc trưng sử dụng phép biến đổi Canny
        features = cv2.Canny(gray_image, 100, 200)
    elif feature_type == 'hog':
        # Chuyển ảnh sang grayscale để xử lý
        gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        # Rút trích đặc trưng sử dụng HOG
        features, _ = hog(gray_image, orientations=8, pixels_per_cell=(16, 16), cells_per_block=(1, 1), visualize=True)
        features = exposure.rescale_intensity(features, in_range=(0, 10))
    else:
        raise ValueError("Unsupported feature type")
    
    return features

def select_image(feature_type):
    # Mở cửa sổ để chọn tệp ảnh
    file_path = filedialog.askopenfilename()
    
    if file_path:
        # Rút trích đặc trưng từ ảnh và hiển thị kết quả
        features = extract_features(file_path, feature_type)
        plt.imshow(features, cmap='gray')
        plt.title('Extracted Features')
        plt.axis('off')
        plt.show()

# Tạo cửa sổ Tkinter
root = tk.Tk()
root.title("Image Feature Extractor")

# Tạo nút để chọn ảnh sử dụng Canny
select_canny_button = tk.Button(root, text="Select Image (Canny)", command=lambda: select_image('canny'))
select_canny_button.pack(padx=20, pady=10)

# Tạo nút để chọn ảnh sử dụng HOG
select_hog_button = tk.Button(root, text="Select Image (HOG)", command=lambda: select_image('hog'))
select_hog_button.pack(padx=20, pady=10)

# Chạy vòng lặp chính của ứng dụng
root.mainloop()
