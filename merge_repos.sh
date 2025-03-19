#!/bin/bash

# Danh sách repo cần gộp
repos=(
  "https://github.com/zohanubis/-Develop_smart_applications.git"
  "https://github.com/zohanubis/fashion_shop.git"
  "https://github.com/zohanubis/DBMS_HK5.git"
  "https://github.com/zohanubis/Image_Processing.git"
  "https://github.com/zohanubis/LapTrinhJava.git"
)

# Kiểm tra nếu đang ở trong repo git hợp lệ
if [ ! -d ".git" ]; then
  echo "❌ Thư mục hiện tại không phải là một repo Git hợp lệ!"
  exit 1
fi

# Lặp qua từng repo để clone vào thư mục tương ứng
for repo in "${repos[@]}"; do
  folder_name=$(basename "$repo" .git)  # Lấy tên repo làm thư mục

  echo "📂 Đang clone repo: $repo vào thư mục $folder_name..."
  
  # Clone repo vào thư mục riêng
  git clone "$repo" "$folder_name"

  if [ $? -ne 0 ]; then
    echo "⚠️ Lỗi khi clone repo: $repo"
    continue
  fi

  # Di chuyển vào thư mục vừa clone
  cd "$folder_name"

  # Xóa thư mục .git để tránh xung đột trong repo tổng hợp
  rm -rf .git
  
  cd ..
done

echo "✅ Đã gộp tất cả repo vào thư mục tổng hợp thành công!"
