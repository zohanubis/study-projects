CREATE DATABASE QL_TraHang

USE QL_TraHang

CREATE TABLE SanPham (
    MaSanPham INT PRIMARY KEY,
    TenSanPham VARCHAR(255) NOT NULL,
    MoTa TEXT,
    Gia FLOAT NOT NULL
);

CREATE TABLE KhachHang (
    MaKhachHang INT PRIMARY KEY,
    Ten VARCHAR(255) NOT NULL,
    DiaChi VARCHAR(255) NOT NULL,
    SoDienThoai VARCHAR(15) NOT NULL
);

CREATE TABLE DonViVanChuyen (
    MaDonVi INT PRIMARY KEY,
    TenDonVi VARCHAR(255) NOT NULL,
    ThongTinLienHe VARCHAR(255)
);

CREATE TABLE Kho (
    MaKho INT PRIMARY KEY,
    DiaChi VARCHAR(255) NOT NULL,
    Hotline VARCHAR(15) NOT NULL,
    GioLamViec VARCHAR(255) NOT NULL
);

CREATE TABLE DonTraHang (
    MaDonTra INT PRIMARY KEY,
    MaKhachHang INT,
    MaSanPham INT,
    MaDonVi INT,
    MaKho INT,
    ThoiGianDuKienDenKho DATE,
    TinhTrang VARCHAR(255) NOT NULL,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham),
    FOREIGN KEY (MaDonVi) REFERENCES DonViVanChuyen(MaDonVi),
    FOREIGN KEY (MaKho) REFERENCES Kho(MaKho)
);

CREATE TABLE THONGTINDONHANG (
    MaDonHang INT PRIMARY KEY,
    MaKhachHang INT,
    NgayBan DATE,
    GhiChu TEXT,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
);
INSERT INTO SanPham (MaSanPham, TenSanPham, MoTa, Gia)
VALUES
(1, 'Dien thoai iPhone 12', 'Mau den, 128GB', 20000000),
(2, 'Laptop Dell XPS 13', 'RAM 16GB, SSD 512GB', 25000000),
(3, 'Tivi Samsung 50 inch', '4K UHD', 12000000),
(4, 'May lanh LG 1.5HP', 'Tiet kiem dien', 9000000),
(5, 'Tu lanh Toshiba 300L', 'Cong nghe Inverter', 8000000),
(6, 'May giat Panasonic 9KG', 'Cong nghe ECONAVI', 7000000),
(7, 'Tai nghe Sony WH-1000XM4', 'Chong on', 6000000),
(8, 'Dien thoai Samsung Galaxy S21', 'Mau xanh, 128GB', 18000000),
(9, 'Tablet iPad Air 2020', 'Mau bac, 64GB', 15000000),
(10, 'May anh Canon EOS M50', 'Lens kit 15-45mm', 14000000);

INSERT INTO KhachHang (MaKhachHang, Ten, DiaChi, SoDienThoai)
VALUES
(1, 'Nguyen Van A', '123 Dong Da, Ha Noi', '0123456789'),
(2, 'Tran Thi B', '456 Le Loi, TP.HCM', '0123456790'),
(3, 'Pham Van C', '789 Tran Hung Dao, Da Nang', '0123456781'),
(4, 'Le Thi D', '101 Ba Trieu, Ha Noi', '0123456782'),
(5, 'Hoang Van E', '202 Nguyen Du, TP.HCM', '0123456783'),
(6, 'Nguyen Thi F', '303 Le Duan, Da Nang', '0123456784'),
(7, 'Pham Van G', '404 Tran Phu, Ha Noi', '0123456785'),
(8, 'Le Thi H', '505 Phan Dinh Phung, TP.HCM', '0123456786'),
(9, 'Hoang Van I', '606 Nguyen Trai, Da Nang', '0123456787'),
(10, 'Nguyen Thi J', '707 Tran Duy Hung, Ha Noi', '0123456788');

INSERT INTO DonViVanChuyen (MaDonVi, TenDonVi, ThongTinLienHe)
VALUES
(1, 'Giao hang nhanh', '0123456789'),
(2, 'Viettel Post', '0123456790'),
(3, 'Ninja Van', '0123456781'),
(4, 'J&T Express', '0123456782'),
(5, 'Grab Express', '0123456783'),
(6, 'AhaMove', '0123456784'),
(7, 'GHN', '0123456785'),
(8, 'Kerry Express', '0123456786'),
(9, 'DHL', '0123456787'),
(10, 'FedEx', '0123456788');

INSERT INTO Kho (MaKho, DiaChi, Hotline, GioLamViec)
VALUES 
(1, 'So 180 duong Nguyen Thi Minh Khai, quan 1, TP. Ho Chi Minh', '1900-1022', '8h00 – 17h00, tu thu 2 den thu 7'),
(2, 'So 101A duong Le Trong Tan, quan Binh Tan, TP. Ho Chi Minh', '1900-1022', '8h00 – 17h00, tu thu 2 den thu 7'),
(3, 'So 222A duong Nguyen Trai, quan Thanh Xuan, Ha Noi', '1900-1022', '8h00 – 17h00, tu thu 2 den thu 7'),
(4, 'So 94A duong Ngoc Lam, quan Long Bien, Ha Noi', '1900-1022', '8h00 – 17h00, tu thu 2 den thu 7'),
(5, 'So 116 duong Nguyen Chi Thanh, quan Hai Chau, Da Nang', '1900-1022', '8h00 – 17h00, tu thu 2 den thu 7');

INSERT INTO DonTraHang (MaDonTra, MaKhachHang, MaSanPham, MaDonVi, MaKho, ThoiGianDuKienDenKho, TinhTrang)
VALUES
(1, 1, 1, 1, 1, '2023-09-10', 'Dang van chuyen'),
(2, 2, 2, 2, 2, '2023-09-11', 'Dang van chuyen'),
(3, 3, 3, 3, 3, '2023-09-12', 'Da nhan'),
(4, 4, 4, 4, 1, '2023-09-13', 'Dang van chuyen'),
(5, 5, 5, 5, 4, '2023-09-14', 'Da nhan'),
(6, 6, 6, 6, 3, '2023-09-15', 'Dang van chuyen'),
(7, 7, 7, 7, 1, '2023-09-16', 'Dang van chuyen'),
(8, 8, 8, 8, 2, '2023-09-17', 'Da nhan'),
(9, 9, 9, 9, 2, '2023-09-18', 'Dang van chuyen'),
(10, 10, 10, 5, 1, '2023-09-19', 'Da nhan');

INSERT INTO THONGTINDONHANG (MaDonHang, MaKhachHang, NgayBan, GhiChu)
VALUES
(1, 1, '2023-09-10', 'Đơn hàng điện thoại'),
(2, 2, '2023-09-11', 'Đơn hàng laptop'),
(3, 3, '2023-09-12', 'Đơn hàng TV'),
(4, 4, '2023-09-13', 'Đơn hàng máy lạnh'),
(5, 5, '2023-09-14', 'Đơn hàng tủ lạnh'),
(6, 6, '2023-09-15', 'Đơn hàng máy giặt'),
(7, 7, '2023-09-16', 'Đơn hàng tai nghe'),
(8, 8, '2023-09-17', 'Đơn hàng điện thoại'),
(9, 9, '2023-09-18', 'Đơn hàng máy tính bảng'),
(10, 10, '2023-09-19', 'Đơn hàng máy ảnh');

-- Thêm thông tin đơn hàng vào bảng THONGTINDONHANG
INSERT INTO THONGTINDONHANG (MaDonHang, MaKhachHang, NgayBan, GhiChu)
VALUES
(1, 1, '2023-09-20', 'Đơn hàng điện thoại iPhone 12'),
(2, 2, '2023-09-21', 'Đơn hàng laptop Dell XPS 13'),
(3, 3, '2023-09-22', 'Đơn hàng tivi Samsung 50 inch'),
(4, 4, '2023-09-23', 'Đơn hàng máy lạnh LG 1.5HP'),
(5, 5, '2023-09-24', 'Đơn hàng tủ lạnh Toshiba 300L'),
(6, 6, '2023-09-25', 'Đơn hàng máy giặt Panasonic 9KG'),
(7, 7, '2023-09-26', 'Đơn hàng tai nghe Sony WH-1000XM4'),
(8, 8, '2023-09-27', 'Đơn hàng điện thoại Samsung Galaxy S21'),
(9, 9, '2023-09-28', 'Đơn hàng máy tính bảng iPad Air 2020'),
(10, 10, '2023-09-29', 'Đơn hàng máy ảnh Canon EOS M50');

-- Xem dữ liệu từ bảng SanPham
SELECT * FROM SanPham;

-- Xem dữ liệu từ bảng KhachHang
SELECT * FROM KhachHang;

-- Xem dữ liệu từ bảng DonViVanChuyen
SELECT * FROM DonViVanChuyen;

-- Xem dữ liệu từ bảng Kho
SELECT * FROM Kho;

-- Xem dữ liệu từ bảng DonTraHang
SELECT * FROM DonTraHang;

