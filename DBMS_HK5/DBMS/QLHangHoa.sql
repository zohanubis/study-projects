CREATE DATABASE QL_HangHoa

USE QL_HangHoa

CREATE TABLE ChatLieu (
    MaChatLieu VARCHAR(10) PRIMARY KEY,
    TenChatLieu NVARCHAR(50)
);
GO

CREATE TABLE Hang (
    MaHang VARCHAR(10) PRIMARY KEY,
    TenHang NVARCHAR(50),
    MaChatLieu VARCHAR(10) FOREIGN KEY REFERENCES ChatLieu(MaChatLieu),
    SoLuong INT,
    DonGiaNhap DECIMAL(18, 2),
    DonGiaBan DECIMAL(18, 2),
    Hinh VARCHAR(MAX),
    GhiChu TEXT
);
GO
 
INSERT INTO ChatLieu (MaChatLieu, TenChatLieu)
VALUES ('CL001', N'Nhựa'),
       ('CL002', N'Bông'),
       ('CL003', N'Sành');


INSERT INTO Hang (MaHang, TenHang, MaChatLieu, SoLuong, DonGiaNhap, DonGiaBan, Hinh, GhiChu)
VALUES 
    ('MH001', N'Nhựa 1', 'CL001', 10, 5000.00, 8000.00, 'path_to_image1.jpg', N'Ghi chú 1'),
    ('MH002', N'Nhựa 2', 'CL001', 15, 4000.00, 7000.00, 'path_to_image2.jpg', N'Ghi chú 2'),
    ('MH003', N'Nhựa 3', 'CL001', 20, 3000.00, 6000.00, 'path_to_image3.jpg', N'Ghi chú 3');


INSERT INTO Hang (MaHang, TenHang, MaChatLieu, SoLuong, DonGiaNhap, DonGiaBan, Hinh, GhiChu)
VALUES 
    ('MH004', N'Bông 1', 'CL002', 12, 6000.00, 9000.00, 'path_to_image4.jpg', N'Ghi chú 4'),
    ('MH005', N'Bông 2', 'CL002', 18, 7000.00, 10000.00, 'path_to_image5.jpg', N'Ghi chú 5'),
    ('MH006', N'Bông 3', 'CL002', 25, 5000.00, 8000.00, 'path_to_image6.jpg', N'Ghi chú 6');


INSERT INTO Hang (MaHang, TenHang, MaChatLieu, SoLuong, DonGiaNhap, DonGiaBan, Hinh, GhiChu)
VALUES 
    ('MH007', N'Sành 1', 'CL003', 8, 10000.00, 15000.00, 'path_to_image7.jpg', N'Ghi chú 7'),
    ('MH008', N'Sành 2', 'CL003', 10, 11000.00, 16000.00, 'path_to_image8.jpg', N'Ghi chú 8'),
    ('MH009', N'Sành 3', 'CL003', 13, 9000.00, 14000.00, 'path_to_image9.jpg', N'Ghi chú 9');
