CREATE DATABASE Buoi1_QLTV_Bai2 ON PRIMARY
(
    NAME = DB_PRIMARY,
    FILENAME = 'D:\VIsual Studio Code - Github\DBMS\THUCHANH\Buoi1\Bai2_QLTV\db_primary.mdf',
    SIZE = 3MB,
    MAXSIZE = 10MB,
    FILEGROWTH = 10%
),
(
    NAME = DB_SECOND1_1,
    FILENAME = 'D:\VIsual Studio Code - Github\DBMS\THUCHANH\Buoi1\Bai2_QLTV\DB_second1_1.ndf',
    SIZE = 3MB,
    MAXSIZE = 5MB,
    FILEGROWTH = 10%
),
(
    NAME = DB_SECOND1_2,
    FILENAME = 'D:\VIsual Studio Code - Github\DBMS\THUCHANH\Buoi1\Bai2_QLTV\DB_second1_2.ndf',
    SIZE = 3MB,
    MAXSIZE = 5MB,
    FILEGROWTH = 10%
),
(
    NAME = DB_SECOND1_3,
    FILENAME = 'D:\VIsual Studio Code - Github\DBMS\THUCHANH\Buoi1\Bai2_QLTV\DB_second1_3.ndf',
    SIZE = 3MB,
    MAXSIZE = 5MB,
    FILEGROWTH = 5%
)
LOG ON
(
    NAME = DB_Log,
    FILENAME = 'D:\VIsual Studio Code - Github\DBMS\THUCHANH\Buoi1\Bai2_QLTV\DB_Log.ldf',
    SIZE = 1MB,
    MAXSIZE = 5MB,
    FILEGROWTH = 15%
);
USE Buoi1_QLTV_Bai2

CREATE TABLE SACH
(
    MASH VARCHAR(10) PRIMARY KEY,
    TENSH NVARCHAR(50),
    TACGIA NVARCHAR(50),
    LOAI NVARCHAR(50),
    TINHTRANG NVARCHAR(50)
);

CREATE TABLE DOCGIA
(
    MADG VARCHAR(10) PRIMARY KEY,
    TENDG NVARCHAR(50),
    TUOI INT,
    PHAI NVARCHAR(3),
    DIACHI NVARCHAR(50)
);

CREATE TABLE MUONSACH
(
    MADG VARCHAR(10),
    MASH VARCHAR (10),
    NGAYMUON DATE,
    NGAYTRA DATE,
	CONSTRAINT FK_MUONSACH_DOCGIA FOREIGN KEY (MADG) REFERENCES DOCGIA(MADG),
    CONSTRAINT FK_MUONSACH_SACH FOREIGN KEY (MASH) REFERENCES SACH(MASH)
);

SET DATEFORMAT DMY
--b) Thay đổi cấu trúc

ALTER TABLE DOCGIA
ALTER COLUMN PHAI NVARCHAR(5);

ALTER TABLE DOCGIA
ADD DIENTHOAI NVARCHAR(12),
    EMAIL NVARCHAR(50);

ALTER TABLE SACH
ADD NHAXUATBAN NVARCHAR(20);

ALTER TABLE DOCGIA
ADD CONSTRAINT CHK_TUOI CHECK (TUOI > 15);

ALTER TABLE DOCGIA
ADD CONSTRAINT CHK_PHAI CHECK (PHAI = N'Nam' OR PHAI = N'Nữ');

ALTER TABLE SACH
ADD CONSTRAINT CHK_LOAI CHECK (LOAI IN (N'Khoa học tự nhiên', N'Xã hội', N'Kinh tế', N'Truyện'));

-- Xóa ràng buộc kiểm tra tuổi
ALTER TABLE DOCGIA
DROP CONSTRAINT CHK_TUOI;

-- Xóa ràng buộc kiểm tra phái
ALTER TABLE DOCGIA
DROP CONSTRAINT CHK_PHAI;

-- Tạo lại ràng buộc kiểm tra tuổi
ALTER TABLE DOCGIA
ADD CONSTRAINT CHK_TUOI CHECK (TUOI > 15);

-- Tạo lại ràng buộc kiểm tra phái
ALTER TABLE DOCGIA
ADD CONSTRAINT CHK_PHAI CHECK (PHAI = N'Nam' OR PHAI = N'Nữ');

ALTER TABLE SACH
ADD CONSTRAINT DF_TINHTRANG DEFAULT 'Chưa mượn' FOR TINHTRANG;

ALTER TABLE DOCGIA
ADD CONSTRAINT DF_DIACHI DEFAULT 'Chưa xác định' FOR DIACHI;

ALTER TABLE SACH
ADD CONSTRAINT UQ_TENSH UNIQUE (TENSH);

--Kiểm tra ràng buộc có chạy ?

-- Thêm độc giả có tuổi đúng
INSERT INTO DOCGIA (MADG, TENDG, TUOI, PHAI, DIACHI)
VALUES ('DG001', 'Người trẻ', 20, N'Nam', 'Địa chỉ 1');

-- Thử thêm độc giả có tuổi không hợp lệ
INSERT INTO DOCGIA (MADG, TENDG, TUOI, PHAI, DIACHI)
VALUES ('DG002', 'Người trẻ', 12, N'Nữ', 'Địa chỉ 2');
-- Kết quả: Lỗi vì tuổi không hợp lệ

-- Thêm độc giả với phái đúng
INSERT INTO DOCGIA (MADG, TENDG, TUOI, PHAI, DIACHI)
VALUES ('DG003', 'Nam nhi', 25, N'Nam', 'Địa chỉ 3');

-- Thử thêm độc giả với phái không hợp lệ
INSERT INTO DOCGIA (MADG, TENDG, TUOI, PHAI, DIACHI)
VALUES ('DG004', 'Nữ nhi', 22, N'Không xác định', 'Địa chỉ 4');
-- Kết quả: Lỗi vì phái không hợp lệ

-- Thêm sách với loại sách hợp lệ
INSERT INTO SACH (MASH, TENSH, TACGIA, LOAI, TINHTRANG, NHAXUATBAN)
VALUES ('SH001', 'Sách Khoa học', 'Tác giả A', N'Khoa học tự nhiên', 'Chưa mượn', 'NXB XYZ');

-- Thử thêm sách với loại sách không hợp lệ
INSERT INTO SACH (MASH, TENSH, TACGIA, LOAI, TINHTRANG, NHAXUATBAN)
VALUES ('SH002', 'Sách Xã hội', 'Tác giả B', N'N/A', 'Chưa mượn', 'NXB ABC');
-- Kết quả: Lỗi vì loại sách không hợp lệ

--String or binary data would be truncated in table 'DB_QLTHUVIEN_Bai2.dbo.DOCGIA', column 'MADG'. Truncated value: 'D'.
-- Bị giới hạn giá trị nhập vào
