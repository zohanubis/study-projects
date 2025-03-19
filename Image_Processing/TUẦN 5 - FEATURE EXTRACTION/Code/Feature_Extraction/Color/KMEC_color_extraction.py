import numpy as np
import cv2
from matplotlib import pyplot as plt
from sklearn.cluster import KMeans

def extract_colors(image_path, k=6):
    # Đọc hình ảnh
    img = cv2.imread(image_path)
    
    # Chuyển đổi các giá trị màu từ BGR sang RGB
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    
    # Chuyển đổi hình ảnh thành mảng 2D có 3 cột 
    pixels = img.reshape(-1, 3)
    
    # Áp dụng thuật toán KMeans để phân cụm các giá trị màu
    kmeans = KMeans(n_clusters=k)
    kmeans.fit(pixels)
    
    # Trích xuất các giá trị màu của các trung tâm cụm
    colors = kmeans.cluster_centers_.astype(int)
    
    return colors

def plot_colors(colors):

    # Tạo một biểu đồ dạng swatch với các màu được trích xuất
    plt.imshow([colors], aspect='auto')
    plt.axis('off')
    
    plt.show()

if __name__ == "__main__":
    # Đường dẫn của hình ảnh
    image_path = 'IMG/rose.jpg'
    
    # Số lượng cụm cần phân
    k = 6
    
    # Trích xuất các màu và vẽ biểu đồ
    colors = extract_colors(image_path, k)
    plot_colors(colors)
