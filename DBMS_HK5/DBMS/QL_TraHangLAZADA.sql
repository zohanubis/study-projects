CREATE DATABASE QL_TraHangLazda
USE QL_TraHangLazda

CREATE TABLE USERS
(
	MAUSERS INT NOT NULL, 
	USERNAME NVARCHAR(50),
	USERROLE NVARCHAR(30),
	_NAME NVARCHAR(30),
	DOB NVARCHAR(30),
	MOBILE INT, 
	EMAIL NVARCHAR(30), 
	PASS NVARCHAR(30)
)
CREATE TABLE CuaHang (
    MaCuaHang VARCHAR(10) PRIMARY KEY,
    TenCuaHang NVARCHAR(255) NOT NULL,
    DiaChi NVARCHAR(255) NOT NULL,
    SoDienThoai VARCHAR(15) NOT NULL
);
CREATE TABLE KhachHang (
    MaKhachHang VARCHAR(10) PRIMARY KEY,
    Ten NVARCHAR(255) NOT NULL,
    DiaChi NVARCHAR(255) NOT NULL,
    SoDienThoai VARCHAR(15) NOT NULL
);
CREATE TABLE SanPham (
    MaSanPham VARCHAR(10) PRIMARY KEY,
    TenSanPham NVARCHAR(255) NOT NULL,
    MoTa TEXT,
    Gia FLOAT NOT NULL,
	MaCuaHang VARCHAR(10),
	CONSTRAINT FK_CuaHang_SanPham FOREIGN KEY (MaCuaHang) REFERENCES CuaHang(MaCuaHang)
);
CREATE TABLE DonViVanChuyen (
    MaDonVi VARCHAR(10) PRIMARY KEY,
    TenDonVi NVARCHAR(255) NOT NULL,
    ThongTinLienHe VARCHAR(255) 
);

CREATE TABLE Kho (
    MaKho VARCHAR(10) PRIMARY KEY,
    TenKho NVARCHAR(255) NOT NULL,
    DiaChi NVARCHAR(255) NOT NULL,
    Hotline VARCHAR(15) NOT NULL,
    GioLamViec VARCHAR(255) NOT NULL
);

CREATE TABLE ThongTinDonHang (
    MaDonHang VARCHAR(10) PRIMARY KEY,
    MaKhachHang VARCHAR(10),
    MaSanPham VARCHAR(10),
    MaCuaHang VARCHAR(10),
    SoLuong INT,
    NgayBan DATE,
    GhiChu TEXT,
	TongTienHoaDon FLOAT,
	TrangThai NVARCHAR(50),
    CONSTRAINT FK_KhachHang_ThongTinDonHang FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    CONSTRAINT FK_SanPham_ThongTinDonHang FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham),
    CONSTRAINT FK_CuaHang_ThongTinDonHang FOREIGN KEY (MaCuaHang) REFERENCES CuaHang(MaCuaHang)
);

CREATE TABLE DonTraHang (
    MaDonTra VARCHAR(10) PRIMARY KEY,
    MaDonHang VARCHAR(10),
    MaKhachHang VARCHAR(10),
    MaSanPham VARCHAR(10),
    MaDonVi VARCHAR(10),
    MaKho VARCHAR(10),
    ThoiGianDuKienDenKho DATE CHECK (ThoiGianDuKienDenKho > GETDATE() OR ThoiGianDuKienDenKho IS NULL),
    TinhTrang NVARCHAR(255) NOT NULL,
    MaCuaHang VARCHAR(10),
    CONSTRAINT FK_DonHang_DonTraHang FOREIGN KEY (MaDonHang) REFERENCES ThongTinDonHang(MaDonHang),
    CONSTRAINT FK_KhachHang_DonTraHang FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    CONSTRAINT FK_SanPham_DonTraHang FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham),
    CONSTRAINT FK_DonViVanChuyen_DonTraHang FOREIGN KEY (MaDonVi) REFERENCES DonViVanChuyen(MaDonVi),
    CONSTRAINT FK_Kho_DonTraHang FOREIGN KEY (MaKho) REFERENCES Kho(MaKho),
    CONSTRAINT FK_CuaHang_DonTraHang FOREIGN KEY (MaCuaHang) REFERENCES CuaHang(MaCuaHang)
);

-------------------------------------------------------------------------------------------------
INSERT INTO USERS (MAUSERS, USERNAME, USERROLE, _NAME, DOB, MOBILE, EMAIL, PASS)
VALUES
    (4, 'user3', N'Nhân Viên Bán Hàng', N'Trương Thị L', '1993-03-18', 0321456789, 'user3@example.com', 'hashed_password_4'),
    (5, 'user4', N'Nhân Viên Bán Hàng', N'Hoàng Văn M', '1994-05-05', 0987654321, 'user4@example.com', 'hashed_password_5'),
    (6, 'user5', N'Nhân Viên Bán Hàng', N'Lê Thị N', '1996-07-30', 0369518274, 'user5@example.com', 'hashed_password_6'),
    (7, 'user6', N'Nhân Viên Bán Hàng', N'Võ Văn O', '1997-11-12', 0789654321, 'user6@example.com', 'hashed_password_7'),
    (8, 'user7', N'Nhân Viên Bán Hàng', N'Huỳnh Thị P', '1998-09-25', 0968745123, 'user7@example.com', 'hashed_password_8'),
    (9, 'user8', N'Nhân Viên Bán Hàng', N'Phạm Thanh Q', '1999-12-15', 0321847569, 'user8@example.com', 'hashed_password_9'),
    (10, 'user9', N'Nhân Viên Bán Hàng', N'Nguyễn Thị R', '1991-10-20', 0987123456, 'user9@example.com', 'hashed_password_10');

INSERT INTO CuaHang (MaCuaHang, TenCuaHang, DiaChi, SoDienThoai)
VALUES
	('DT001', N'Thế giới di động', N'52 Lê Lợi, Phường Bến Thành, Quận 1, TP.HCM', '1800-1060'),
	('DT002', N'FPT Shop', N'194 Trần Quang Khải, Phường Tân Định, Quận 1, TP.HCM', '1800-6606'),
	('DT003', N'Laptop88', N'135 Nguyễn Thị Minh Khai, Phường 6, Quận 3, TP.HCM', '1900-575757'),
	('DT004', N'Máy tính Trần Anh', N'110 Nguyễn Văn Cừ, Phường Nguyễn Cư Trinh, Quận 1, TP.HCM', '1800-6655'),
	('DT005', N'Hnam Mobile', N'108 Trần Hưng Đạo, Phường 6, Quận 5, TP.HCM', '1900-555555'),
	('DM001', N'Hệ thống siêu thị điện máy Chợ Lớn', N'429 Nguyễn Trãi, Phường 8, Quận 5, TP.HCM', '1800-1061'),
	('DM002', N'MediaMart', N'335 Trần Hưng Đạo, Phường 1, Quận 5, TP.HCM', '1900-6686'),
	('DM003', N'Panasonic Center', N'200-202 Nguyễn Thị Minh Khai, Phường 6, Quận 3, TP.HCM', '1800-6655'),
	('DM004', N'Samsung Brandshop', N'52 Lê Lợi, Phường Bến Thành, Quận 1, TP.HCM', '1800-5888'),
	('DM005', N'LG Electronics', N'194 Trần Quang Khải, Phường Tân Định, Quận 1, TP.HCM', '1800-6666');

INSERT INTO CuaHang (MaCuaHang, TenCuaHang, DiaChi, SoDienThoai)
VALUES
	('DT006', N'CellphoneS', N'123 Nguyễn Văn Cừ, Q.1, Hà Nội', '024 3820 1234'),
	('DT007', N'Hoàng Hà Mobile', N'456 Trần Hưng Đạo, Q.5, Hà Nội', '024 3820 5678'),
	('DT008', N'FPT Shop', N'789 Lê Lợi, Q.10, Hà Nội', '024 3820 9012'),
	('DT009', N'Viettel Store', N'102 Xuân Thủy, Q.Cầu Giấy, Hà Nội', '024 3820 1234'),
	('DT010', N'TrangAnhMobile', N'204 Bà Triệu, Q.Hai Bà Trưng, Hà Nội', '024 3820 5678'),
	('DM006',N'Điện Máy Xanh','Số 26, Hai Bà Trưng, Hoàn Kiếm, Hà Nội','(024) 3627 1111'),
	('DM007',N'Thế Giới Di Động','Số 10, Nguyễn Lương Bằng, Đống Đa, Hà Nội','(024) 3627 2222'),
	('DM008',N'MediaMart','Số 20, Thái Hà, Đống Đa, Hà Nội','(024) 3627 3333'),
	('DM009',N'Panasonic','Số 55, Trần Hưng Đạo, Hoàn Kiếm, Hà Nội','(024) 3627 4444'),
	('DM010',N'LG','Số 100, Cầu Giấy, Cầu Giấy, Hà Nội','(024) 3627 5555');

-- Khu vực Hồ Chí Minh
INSERT INTO SanPham (MaSanPham, TenSanPham, MoTa, Gia, MaCuaHang)
VALUES
    ('HCMSP001', N'Samsung Galaxy A52', N'Smartphone Samsung Galaxy A52', 8000000, 'DT001'),
    ('HCMSP002', N'iPhone SE', N'Smartphone Apple iPhone SE', 9000000, 'DT001'),
    ('HCMSP003', N'OPPO A74', N'Smartphone OPPO A74', 7500000, 'DT001'),
    ('HCMSP004', N'Vivo V21', N'Smartphone Vivo V21', 8500000, 'DT002'),
    ('HCMSP005', N'Xiaomi Redmi Note 10 Pro', N'Smartphone Xiaomi Redmi Note 10 Pro', 7500000, 'DT002'),
    ('HCMSP006', N'Samsung Galaxy Tab S7', N'Tablet Samsung Galaxy Tab S7', 12000000, 'DT002'),
    ('HCMSP007', N'Dell XPS 13', N'Laptop Dell XPS 13', 18000000, 'DT003'),
    ('HCMSP008', N'Asus ROG Strix G15', N'Laptop Asus ROG Strix G15', 22000000, 'DT003'),
    ('HCMSP009', N'Lenovo Legion Y540', N'Laptop Lenovo Legion Y540', 16000000, 'DT003'),
    ('HCMSP010', N'Sony 65" 4K Smart TV', N'Tivi Sony 65 inch 4K Smart TV', 28000000, 'DT004'),
    ('HCMSP011', N'LG 43" 4K Smart TV', N'Tivi LG 43 inch 4K Smart TV', 15000000, 'DT004'),
    ('HCMSP012', N'Samsung Top Mount Refrigerator 350L', N'Tủ lạnh Samsung dung tích 350L', 9000000, 'DT004'),
    ('HCMSP013', N'Canon EOS M50', N'Máy ảnh Canon EOS M50', 12000000, 'DT005'),
    ('HCMSP014', N'Sony Playstation 5', N'Console Sony Playstation 5', 16000000, 'DT005'),
    ('HCMSP015', N'Samsung Galaxy Watch Active2', N'Đồng hồ thông minh Samsung Galaxy Watch Active2', 5000000, 'DT005'),
    ('HCMSP016', N'Sony 55" 4K Smart TV', N'Tivi Sony 55 inch 4K Smart TV', 25000000, 'DM001'),
    ('HCMSP017', N'LG 50" 4K Smart TV', N'Tivi LG 50 inch 4K Smart TV', 18000000, 'DM001'),
    ('HCMSP018', N'Panasonic Washing Machine 8kg', N'Máy giặt Panasonic dung tích 8kg', 7000000, 'DM001'),
    ('HCMSP019', N'Fujifilm X-T4', N'Máy ảnh Fujifilm X-T4', 16000000, 'DM002'),
    ('HCMSP020', N'Nintendo Switch', N'Console Nintendo Switch', 8000000, 'DM002'),
    ('HCMSP021', N'JBL Charge 4', N'Loa di động JBL Charge 4', 2500000, 'DM002'),
    ('HCMSP022', N'Panasonic 65" 4K Smart TV', N'Tivi Panasonic 65 inch 4K Smart TV', 30000000, 'DM003'),
    ('HCMSP023', N'Panasonic Refrigerator 400L', N'Tủ lạnh Panasonic dung tích 400L', 10000000, 'DM003'),
    ('HCMSP024', N'Panasonic Microwave Oven', N'Lò vi sóng Panasonic', 4000000, 'DM003'),
    ('HCMSP025', N'Samsung Galaxy Tab S6', N'Tablet Samsung Galaxy Tab S6', 11000000, 'DM004'),
    ('HCMSP026', N'Samsung Gear Fit 2 Pro', N'Đồng hồ thông minh Samsung Gear Fit 2 Pro', 3500000, 'DM004'),
    ('HCMSP027', N'Samsung Refrigerator 300L', N'Tủ lạnh Samsung dung tích 300L', 8000000, 'DM004'),
    ('HCMSP028', N'LG 65" 4K Smart TV', N'Tivi LG 65 inch 4K Smart TV', 32000000, 'DM005'),
    ('HCMSP029', N'LG Soundbar SK10Y', N'Loa thanh LG Soundbar SK10Y', 9000000, 'DM005'),
    ('HCMSP030', N'LG Washing Machine 10kg', N'Máy giặt LG dung tích 10kg', 11000000, 'DM005');
-- Khu vực Hà Nội
INSERT INTO SanPham (MaSanPham, TenSanPham, MoTa, Gia, MaCuaHang)
VALUES
    ('HNSP001', N'Samsung Galaxy A52', N'Smartphone Samsung Galaxy A52', 8000000, 'DT006'),
    ('HNSP002', N'iPhone SE', N'Smartphone Apple iPhone SE', 9000000, 'DT006'),
    ('HNSP003', N'OPPO A74', N'Smartphone OPPO A74', 7500000, 'DT006'),
    ('HNSP004', N'Vivo V21', N'Smartphone Vivo V21', 8500000, 'DT007'),
    ('HNSP005', N'Xiaomi Redmi Note 10 Pro', N'Smartphone Xiaomi Redmi Note 10 Pro', 7500000, 'DT007'),
    ('HNSP006', N'Samsung Galaxy Tab S7', N'Tablet Samsung Galaxy Tab S7', 12000000, 'DT007'),
    ('HNSP007', N'Dell XPS 13', N'Laptop Dell XPS 13', 18000000, 'DT008'),
    ('HNSP008', N'Asus ROG Strix G15', N'Laptop Asus ROG Strix G15', 22000000, 'DT008'),
    ('HNSP009', N'Lenovo Legion Y540', N'Laptop Lenovo Legion Y540', 16000000, 'DT008'),
    ('HNSP010', N'Sony 65" 4K Smart TV', N'Tivi Sony 65 inch 4K Smart TV', 28000000, 'DT009'),
    ('HNSP011', N'LG 43" 4K Smart TV', N'Tivi LG 43 inch 4K Smart TV', 15000000, 'DT009'),
    ('HNSP012', N'Samsung Top Mount Refrigerator 350L', N'Tủ lạnh Samsung dung tích 350L', 9000000, 'DT009'),
    ('HNSP013', N'Canon EOS M50', N'Máy ảnh Canon EOS M50', 12000000, 'DT010'),
    ('HNSP014', N'Sony Playstation 5', N'Console Sony Playstation 5', 16000000, 'DT010'),
    ('HNSP015', N'Samsung Galaxy Watch Active2', N'Đồng hồ thông minh Samsung Galaxy Watch Active2', 5000000, 'DT010'),
    ('HNSP016', N'Sony 55" 4K Smart TV', N'Tivi Sony 55 inch 4K Smart TV', 25000000, 'DM006'),
    ('HNSP017', N'LG 50" 4K Smart TV', N'Tivi LG 50 inch 4K Smart TV', 18000000, 'DM006'),
    ('HNSP018', N'Panasonic Washing Machine 8kg', N'Máy giặt Panasonic dung tích 8kg', 7000000, 'DM006'),
    ('HNSP019', N'Fujifilm X-T4', N'Máy ảnh Fujifilm X-T4', 16000000, 'DM007'),
    ('HNSP020', N'Nintendo Switch', N'Console Nintendo Switch', 8000000, 'DM007'),
    ('HNSP021', N'JBL Charge 4', N'Loa di động JBL Charge 4', 2500000, 'DM007'),
    ('HNSP022', N'Panasonic 65" 4K Smart TV', N'Tivi Panasonic 65 inch 4K Smart TV', 30000000, 'DM008'),
    ('HNSP023', N'Panasonic Refrigerator 400L', N'Tủ lạnh Panasonic dung tích 400L', 10000000, 'DM008'),
    ('HNSP024', N'Panasonic Microwave Oven', N'Lò vi sóng Panasonic', 4000000, 'DM008'),
    ('HNSP025', N'Samsung Galaxy Tab S6', N'Tablet Samsung Galaxy Tab S6', 11000000, 'DM009'),
    ('HNSP026', N'Samsung Gear Fit 2 Pro', N'Đồng hồ thông minh Samsung Gear Fit 2 Pro', 3500000, 'DM009'),
    ('HNSP027', N'Samsung Refrigerator 300L', N'Tủ lạnh Samsung dung tích 300L', 8000000, 'DM009'),
    ('HNSP028', N'LG 65" 4K Smart TV', N'Tivi LG 65 inch 4K Smart TV', 32000000, 'DM010'),
    ('HNSP029', N'LG Soundbar SK10Y', N'Loa thanh LG Soundbar SK10Y', 9000000, 'DM010'),
    ('HNSP030', N'LG Washing Machine 10kg', N'Máy giặt LG dung tích 10kg', 11000000, 'DM010');

INSERT INTO DonViVanChuyen (MaDonVi, TenDonVi, ThongTinLienHe)
VALUES
    ('DV001', N'Giao Hàng Nhanh', '0123456789'),
    ('DV002', N'Viettel Post', '0123456790'),
    ('DV003', N'Ninja Van', '0123456781'),
    ('DV004', N'J&T Express', '0123456782'),
    ('DV005', N'Grab Express', '0123456783'),
    ('DV006', N'AhaMove', '0123456784'),
    ('DV007', N'GHN', '0123456785'),
    ('DV008', N'Giao Hàng Tiết Kiệm', '0123456786'),
    ('DV009', N'DHL', '0123456787'),
    ('DV010', N'FedEx', '0123456788');


INSERT INTO KhachHang (MaKhachHang, Ten, DiaChi, SoDienThoai)
VALUES
    ('KHHCM001', N'Lê Quang Hà', N'75 Đường Nguyễn Huệ, Quận 1, Hồ Chí Minh', '0123456781'),
    ('KHHCM002', N'Nguyễn Thành Danh',N'56, Đường Mai Chí Thọ, Quận 2, Hồ Chí Minh', '0123456782'),
    ('KHHCM003', N'Lý Ngọc Sơn', N'9 Đường Nguyễn Tri Phương, Quận 3, Hồ Chí Minh', '0123456783'),
    ('KHHCM004', N'Trần Anh Mai', N'1 Đường Nguyễn Tất Thành, Quận 4, Hồ Chí Minh', '0123456784'),
    ('KHHCM005', N'Lâm Thắng', N'333, Đường Trần Hưng Đạo, Quận 5, Hồ Chí Minh', '0123456785'),
    ('KHHN001', N'Phạm Thị Hương', N'Hàng Bạc, Quận Hoàn Kiếm, Hà Nội', '0987654321'),
    ('KHHN002', N'Nguyễn Văn Hoàng', N'111 Liễu Giai, Quận Ba Đình, Hà Nội, Hà Nội', '0987654322'),
    ('KHHN003', N'Trần Đức Minh', N'223 Hàng Khay, Quận Hoàn Kiếm, Hà Nội', '0987654323'),
    ('KHHN004', N'Đỗ Thị Thùy Trang', N'101 Đường Xã Đàn, Quận Đống Đa, Hà Nội', '0987654324'),
    ('KHHN005', N'Lê Thị Minh Anh', N'202 Đường Âu Cơ, Quận Tây Hồ, Hà Nội', '0987654325');

INSERT INTO Kho (MaKho, TenKho, DiaChi, Hotline, GioLamViec)
VALUES	('HNK001', N'Kho Hà Đông', N'Số 103, đường Vạn Phúc, phường Vạn Phúc, quận Hà Đông, Hà Nội.', '1900 6509', '8h - 22h'),
		('HNK002', N'Kho Nam Từ Liêm', N'Số 55 đường K2, phường Cầu Diễn, quận Nam Từ Liêm, Hà Nội.', '1900 6509', '8h - 22h'),
		('HNK003', N'Kho Long Biên', N'Số 1 đường Huỳnh Tấn Phát, khu công nghiệp Sài Đồng, phường Thạch Bàn, quận Long Biên, Hà Nội.', '1900 6509', '8h - 22h');

INSERT INTO Kho (MaKho, TenKho, DiaChi, Hotline, GioLamViec)
VALUES	('HCMK001', N'Kho Quận 11', N'Số 185 – 189 đường Âu Cơ, phường 14, quận 11, TP Hồ Chí Minh.', '1900 6509', '8h - 22h'),
		('HCMK002', N'Kho Gò Vấp', N'Số 260, hẻm 262, đường Quang Trung, phường 10, quận Gò Vấp, TP Hồ Chí Minh.', '1900 6509', '8h - 22h'),
		('HCMK003', N'Kho Quận 1', N'Số nhà 2BIS, đường Nguyễn Thị Minh Khai, phường Đa Kao, quận 1, TP Hồ Chí Minh.', '1900 6509', '8h - 22h');
INSERT INTO ThongTinDonHang (MaDonHang, MaKhachHang, NgayBan, GhiChu, MaCuaHang, MaSanPham, SoLuong ,TongTienHoaDon,TrangThai)
VALUES
    ('DH001', 'KHHCM001', '2023-09-20', N'Giao Hàng Nhanh', 'DT001','HCMSP001',2,16000000,N'Giao Hàng Thành Công'),
    ('DH002', 'KHHCM001', '2023-09-21', N'Viettel Post', 'DT001','HCMSP002',1,18000000,N'Giao Hàng Thành Công'),
    ('DH003', 'KHHCM002', '2023-09-22', N'Ninja Van', 'DT003','HCMSP007',1,18000000,N'Giao Hàng Thành Công'),
    ('DH004', 'KHHCM002', '2023-09-22', N'Ninja Van', 'DT003','HCMSP008',2,44000000,N'Giao Hàng Thành Công');

INSERT INTO ThongTinDonHang (MaDonHang, MaKhachHang, NgayBan, GhiChu, MaCuaHang, MaSanPham, SoLuong ,TongTienHoaDon,TrangThai)
VALUES
	('DH005', 'KHHCM003', '2023-09-23', N'GHTK', 'DT001','HCMSP001',2,16000000,N'Đang Vận Chuyển'),
	('DH006', 'KHHCM004', '2023-09-23', N'GKTK', 'DT002','HCMSP006',2,24000000,N'Giao Hàng Thất Bại'),
INSERT INTO DonTraHang (MaDonTra, MaDonHang, MaKhachHang, MaSanPham, MaDonVi, MaKho, ThoiGianDuKienDenKho, TinhTrang, MaCuaHang)
VALUES
    ('DT001', 'DH001', 'KHHCM001', 'HCMSP001', 'DV001', 'HCMK001', '2023-09-25', N'Thành Công', 'DT001'),
    ('DT002', 'DH002', 'KHHCM002', 'HCMSP005', 'DV002', 'HCMK001', '2023-09-26', N'Chưa Thành Công', 'DT002'),
    ('DT003', 'DH003', 'KHHCM003', 'HCMSP008', 'DV003', 'HCMK003', '2023-09-27', N'Thành Công', 'DT003');

--


CREATE PROCEDURE TimKiemHoaDon
    @TimHoaDon NVARCHAR(255)
AS
BEGIN
    SELECT *
    FROM ThongTinDonHang
    WHERE MaDonHang LIKE '%' + @TimHoaDon + '%';
END;

CREATE PROCEDURE LayThongTinDonHang
AS
BEGIN
    SELECT
        ThongTinDonHang.MaDonHang,
		ThongTinDonHang.MaKhachHang,
		KhachHang.Ten AS TenKhachHang,
        ThongTinDonHang.SoLuong,
        ThongTinDonHang.NgayBan,
        ThongTinDonHang.GhiChu,
        ThongTinDonHang.TongTienHoaDon,
        ThongTinDonHang.TrangThai
    FROM
        ThongTinDonHang
    INNER JOIN
        KhachHang ON ThongTinDonHang.MaKhachHang = KhachHang.MaKhachHang;
END;
DROP FUNCTION GetDonHangInfoWithCustomerName;

CREATE PROCEDURE LayThongTinDonHangTheoTenKhachHang
    @TenKhachHang NVARCHAR(255)
AS
BEGIN
    SELECT
        ThongTinDonHang.MaDonHang,
        ThongTinDonHang.MaKhachHang,
        KhachHang.Ten AS TenKhachHang,
        ThongTinDonHang.SoLuong,
        ThongTinDonHang.NgayBan,
        ThongTinDonHang.GhiChu,
        ThongTinDonHang.TongTienHoaDon,
        ThongTinDonHang.TrangThai
    FROM
        ThongTinDonHang
    INNER JOIN
        KhachHang ON ThongTinDonHang.MaKhachHang = KhachHang.MaKhachHang
    WHERE
        KhachHang.Ten LIKE '%' + @TenKhachHang + '%';
END;

CREATE PROCEDURE GetFullDonHangInfoWithFilter
    @MaDonHangFilter VARCHAR(10) = NULL
AS
BEGIN
    SELECT
        ThongTinDonHang.MaDonHang,
        ThongTinDonHang.MaKhachHang,
        KhachHang.Ten AS TenKhachHang,
        SanPham.TenSanPham AS TenSanPham,
        ThongTinDonHang.SoLuong,
        ThongTinDonHang.NgayBan,
        ThongTinDonHang.GhiChu,
        ThongTinDonHang.TongTienHoaDon,
        ThongTinDonHang.TrangThai
    FROM
        ThongTinDonHang
    INNER JOIN
        KhachHang ON ThongTinDonHang.MaKhachHang = KhachHang.MaKhachHang
    INNER JOIN
        SanPham ON ThongTinDonHang.MaSanPham = SanPham.MaSanPham
    WHERE
        ThongTinDonHang.MaDonHang LIKE '%' + ISNULL(@MaDonHangFilter, '') + '%';
END;
EXEC GetFullDonHangInfoWithFilter @MaDonHangFilter = 'DH001';



CREATE PROCEDURE GetDonHangInfoByTrangThai
    @TrangThaiFilter NVARCHAR(50) = NULL
AS
BEGIN
    SELECT
        ThongTinDonHang.MaDonHang,
        ThongTinDonHang.MaKhachHang,
        KhachHang.Ten AS TenKhachHang,
        SanPham.TenSanPham AS TenSanPham,
        ThongTinDonHang.SoLuong,
        ThongTinDonHang.NgayBan,
        ThongTinDonHang.GhiChu,
        ThongTinDonHang.TongTienHoaDon,
        ThongTinDonHang.TrangThai
    FROM
        ThongTinDonHang
    INNER JOIN
        KhachHang ON ThongTinDonHang.MaKhachHang = KhachHang.MaKhachHang
    INNER JOIN
        SanPham ON ThongTinDonHang.MaSanPham = SanPham.MaSanPham
    WHERE
        (@TrangThaiFilter IS NULL OR ThongTinDonHang.TrangThai = @TrangThaiFilter);
END;

