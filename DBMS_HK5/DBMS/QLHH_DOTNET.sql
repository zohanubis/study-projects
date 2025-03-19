CREATE DATABASE QLHH_DOTNET
USE QLHH_DOTNET

CREATE TABLE NhaCC (
    MaNCC VARCHAR(10) PRIMARY KEY,
    TenNCC NVARCHAR(50),
    DiaChi NVARCHAR(50)
);

CREATE TABLE Kho (
    MaKho VARCHAR(10) PRIMARY KEY,
    TenKho NVARCHAR(50),
    DiaChiKho NVARCHAR(50)
);

CREATE TABLE KhachHang (
    MaKH VARCHAR(10) PRIMARY KEY,
    TenKH NVARCHAR(50),
    DiaChiKH NVARCHAR(50)
);

CREATE TABLE PhieuNhap (
    SoPN INT PRIMARY KEY,
    NgayNhap DATE,
    MaNCC VARCHAR(10),
    FOREIGN KEY (MaNCC) REFERENCES NhaCC(MaNCC)
);

CREATE TABLE PhieuXuat (
    SoPX INT PRIMARY KEY,
    NgayXuat DATE,
    MaKH VARCHAR(10),
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);

CREATE TABLE Hang (
    MaHang VARCHAR(10) PRIMARY KEY,
    TenHang NVARCHAR(50),
    DonVi NVARCHAR(50),
    DonGia DECIMAL(18, 2)
);

CREATE TABLE ChiTietPhieuNhap (
    SoPN INT,
    MaHang VARCHAR(10),
    SLNhap INT,
    PRIMARY KEY (SoPN, MaHang),
    FOREIGN KEY (SoPN) REFERENCES PhieuNhap(SoPN),
    FOREIGN KEY (MaHang) REFERENCES Hang(MaHang)
);

CREATE TABLE ChiTietPhieuXuat (
    SoPX INT,
    MaHang VARCHAR(10),
    SLXuat INT,
    PRIMARY KEY (SoPX, MaHang),
    FOREIGN KEY (SoPX) REFERENCES PhieuXuat(SoPX),
    FOREIGN KEY (MaHang) REFERENCES Hang(MaHang)
);

CREATE TABLE Chua (
    TonKho INT,
    MaKho VARCHAR(10),
    MaHang VARCHAR(10),
    PRIMARY KEY (MaKho, MaHang),
    FOREIGN KEY (MaKho) REFERENCES Kho(MaKho),
    FOREIGN KEY (MaHang) REFERENCES Hang(MaHang)
);

INSERT INTO NhaCC (MaNCC, TenNCC, DiaChi)
VALUES 
    ('NCC001', N'CellPhones', N'123 ABC Street, City A'),
    ('NCC002', N'Điện Máy Xanh', N'456 XYZ Street, City B'),
    ('NCC003', N'FPT', N'789 DEF Street, City C');
INSERT INTO Kho (MaKho, TenKho, DiaChiKho)
VALUES ('KHO001', N'Tên kho 1', N'Địa chỉ kho 1'),
       ('KHO002', N'Tên kho 2', N'Địa chỉ kho 2');
--Bảng Hàng 
INSERT INTO Hang (MaHang, TenHang, DonVi, DonGia)
VALUES 
    ('H001', N'Điện thoại iPhone X', N'Cái', 10000000),
    ('H002', N'Điện thoại Samsung Galaxy S21', N'Cái', 12000000),
    ('H003', N'Laptop Dell XPS 13', N'Cái', 20000000),
    ('H004', N'Laptop HP Spectre x360', N'Cái', 18000000),
    ('H005', N'Mouse Logitech MX Master 3', N'Cái', 1000000),
    ('H006', N'Bàn phím Mechanical Corsair K70', N'Cái', 2000000),
    ('H007', N'Tai nghe Sony WH-1000XM4', N'Cái', 3000000),
    ('H008', N'Ổ cứng di động WD My Passport 1TB', N'Cái', 1500000),
    ('H009', N'Chuột không dây Microsoft Surface Arc', N'Cái', 800000),
    ('H010', N'Balo Laptop Samsonite', N'Cái', 500000);