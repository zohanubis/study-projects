CREATE DATABASE QuanLi_Pizza
USE QuanLi_Pizza

CREATE TABLE NhanVien (
	MaNV VARCHAR(10) NOT NULL,
	TenNV NVARCHAR(50) NOT NULL,
	ChucVu NVARCHAR(50),
	NgayVaoLam DATE,
	Luong DECIMAL(10,2),
	SDT VARCHAR(15) UNIQUE NOT NULL,
	DiaChi NVARCHAR(50),
	PRIMARY KEY (MaNV)
);

CREATE TABLE KhachHang (
	MaKH VARCHAR(10) NOT NULL,
	TenKH NVARCHAR(50) NOT NULL,
	SDT VARCHAR(15) UNIQUE NOT NULL,
	DiaChi NVARCHAR(50) NOT NULL,
	PRIMARY KEY (MaKH)
);

CREATE TABLE DonHang (
	MaDH VARCHAR(10) NOT NULL,
	MaKH VARCHAR(10) NOT NULL,
	MaNV VARCHAR(10) NOT NULL,
	NgayDat DATE,
	NgayGiao DATE,
	TongTien DECIMAL(10,2),
	TrangThai NVARCHAR(50) DEFAULT N'Chờ xử lý',
	PRIMARY KEY (MaDH),
	FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
	FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);

CREATE INDEX idx_MaKH ON DonHang(MaKH);

CREATE TABLE ChiTietDonHang (
	MaCTDH VARCHAR(10) NOT NULL,
	MaDH VARCHAR(10) NOT NULL,
	MaSP VARCHAR(10) NOT NULL,
	SoLuong INT,
	Gia DECIMAL(10,2),
	PRIMARY KEY (MaCTDH),
	FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP),
	FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH)
);

CREATE INDEX idx_MaDH ON ChiTietDonHang(MaDH);

CREATE TABLE SanPham (
	MaSP VARCHAR(10) NOT NULL,
	TenSP NVARCHAR(50) NOT NULL,
	Gia DECIMAL(10,2),
	Size VARCHAR(10),
	MoTa NVARCHAR(50),
	PRIMARY KEY (MaSP)
);

CREATE TABLE NguyenLieu (
	MaNL VARCHAR(10) NOT NULL,
	TenNL NVARCHAR(50) NOT NULL,
	DonViTinh NVARCHAR(20),
	SoLuong INT,
	PRIMARY KEY (MaNL)
);

CREATE TABLE Kho (
	MaKho VARCHAR(10) NOT NULL,
	MaNL VARCHAR(10) NOT NULL,
	SoLuongTon INT,
	PRIMARY KEY (MaKho),
	FOREIGN KEY (MaNL) REFERENCES NguyenLieu(MaNL)
);

--Nhập Liệu
INSERT INTO SanPham (MaSP, TenSP, Gia, Size, MoTa)
VALUES
	('SPS001', N'Pizza Thịt Xông Khói', 79000, 'S', N'Pizza phô mai Mozzarella, thịt xông khói, ớt xanh, hành tây'),
	('SPS002', N'Pizza Hải Sản', 79000, 'S', N'Pizza tôm, mực, xào cay, cá ngừ, mực khô rang giòn'),
	('SPS003', N'Pizza Tứ Quý', 79000, 'S', N'Pizza tôm, sườn, nấm, thịt xông khói'),
	('SPS004', N'Pizza Bò Nướng BBQ', 89000, 'S', N'Pizza thịt bò nướng, sốt BBQ, phô mai Mozzarella'),
	('SPS005', N'Pizza Hawaii', 75000, 'S', N'Pizza phô mai Mozzarella, sốt cà chua, thịt xông khói, dứa'),
	('SPS006', N'Pizza Hải Sản 2', 85000, 'S', N'Pizza tôm, mực, xào cay, cá ngừ, mực khô rang giòn'),
------------------------------------------------------------------------------------------------------------------------
	('SPM001', N'Pizza Thịt Xông Khói', 89000, 'M', N'Pizza phô mai Mozzarella, thịt xông khói, ớt xanh, hành tây'),
	('SPM002', N'Pizza Hải Sản', 109000, 'M', N'Pizza tôm, mực, xào cay, cá ngừ, mực khô rang giòn'),
	('SPM003', N'Pizza Tứ Quý', 109000, 'M', N'Pizza tôm, sườn, nấm, thịt xông khói'),
	('SPM004', N'Pizza Bò Nướng BBQ', 115000, 'M', N'Pizza thịt bò nướng, sốt BBQ, phô mai Mozzarella'),
	('SPM005', N'Pizza Hawaii', 95000, 'M', N'Pizza phô mai Mozzarella, sốt cà chua, thịt xông khói, dứa'),
	('SPM006', N'Pizza Hải Sản 2', 110000, 'M', N'Pizza tôm, mực, xào cay, cá ngừ, mực khô rang giòn'),
------------------------------------------------------------------------------------------------------------------------
	('SPL001', N'Pizza Thịt Xông Khói', 115000, 'L', N'Pizza phô mai Mozzarella, thịt xông khói, ớt xanh, hành tây'),
	('SPL002', N'Pizza Hải Sản', 135000, 'L', N'Pizza tôm, mực, xào cay, cá ngừ, mực khô rang giòn'),
	('SPL003', N'Pizza Tứ Quý', 145000, 'L', N'Pizza tôm, sườn, nấm, thịt xông khói'),
	('SPL004', N'Pizza Bò Nướng BBQ', 155000, 'L', N'Pizza thịt bò nướng, sốt BBQ, phô mai Mozzarella'),
	('SPL005', N'Pizza Hawaii', 120000, 'L', N'Pizza phô mai Mozzarella, sốt cà chua, thịt xông khói, dứa'),
	('SPL006', N'Pizza Hải Sản 2', 145000, 'L', N'Pizza tôm, mực, xào cay, cá ngừ, mực khô rang giòn');