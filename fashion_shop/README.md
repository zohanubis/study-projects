# Cửa Hàng Thời Trang Trực Tuyến (E-commerce Fashion Shop)

Dự án này là một ứng dụng thương mại điện tử dựa trên Spring Boot, được thiết kế để quản lý một cửa hàng thời trang trực tuyến. Ứng dụng bao gồm các tính năng cần thiết như quản lý sản phẩm, giỏ hàng, đơn hàng, người dùng và thanh toán. Phần back-end được xây dựng với Spring Boot và sử dụng nhiều thư viện và framework để tăng cường chức năng.

## Tính Năng

- **Quản Lý Người Dùng**: Đăng ký, đăng nhập và quản lý hồ sơ người dùng.
- **Quản Lý Sản Phẩm**: Thực hiện các thao tác CRUD với sản phẩm và danh mục.
- **Quản Lý Giỏ Hàng**: Thêm sản phẩm vào giỏ hàng, cập nhật và xóa sản phẩm.
- **Quản Lý Đơn Hàng**: Đặt hàng và xem lịch sử đơn hàng.
- **Xử Lý Thanh Toán**: Tích hợp xử lý thanh toán (giả lập).
- **Xác Thực JWT**: Xác thực an toàn bằng JSON Web Tokens (JWT).
- **REST API**: Cung cấp đầy đủ API REST để kiểm thử với Postman.

## Công Nghệ Sử Dụng

- **Java 21**: Ngôn ngữ lập trình chính.
- **Spring Boot 3.3.2**: Framework ứng dụng.
- **Spring Data JPA**: Tương tác với cơ sở dữ liệu quan hệ.
- **Spring Security**: Xác thực và phân quyền.
- **JWT (JSON Web Token)**: Xác thực bảo mật API REST.
- **MySQL**: Cơ sở dữ liệu dùng để lưu trữ thông tin người dùng, sản phẩm và đơn hàng.
- **Lombok**: Giảm mã boilerplate cho các model.
- **Swagger**: Tài liệu API.
- **Postman**: Công cụ kiểm thử API.

## Cấu Trúc Dự Án

Dự án được cấu trúc như sau:

```bash
src
├── main
│   ├── java
│   │   └── com.example.ecommerce
│   │       ├── controller        # Các controller REST
│   │       ├── model             # Các model dữ liệu (Product, Cart, Order, v.v.)
│   │       ├── repository        # Các repository JPA
│   │       ├── service           # Các dịch vụ logic nghiệp vụ
│   │       └── config            # Cấu hình ứng dụng và bảo mật
│   │       └── reponse
│   │       └── request
│   │       └── exception
│   └── resources
│       ├── application.properties # Cấu hình ứng dụng
└── test                          # Các bài test đơn vị và tích hợp
**
**


