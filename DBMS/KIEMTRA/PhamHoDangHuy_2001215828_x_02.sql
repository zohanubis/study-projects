-- Câu 1a: Tạo cơ sở dữ liệu QL_DATHANG
CREATE DATABASE QL_DATHANG
ON PRIMARY
    (NAME = 'QLDH_PRIMARY',
    FILENAME = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_02\QLDH_PRIMARY.mdf',
    SIZE = 5MB,
    MAXSIZE = 10MB,
    FILEGROWTH = 10%)
LOG ON
    (NAME = 'QLDH_LOG',
    FILENAME = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_02\QLDH_LOG.ldf',
    SIZE = 3MB,
    MAXSIZE = 5MB,
    FILEGROWTH = 15%);

-- Sử dụng cơ sở dữ liệu QL_DATHANG
USE QL_DATHANG;

-- Câu 1b: Tạo bảng KHACHHANG
CREATE TABLE KHACHHANG (
    MAKH VARCHAR(10),
    TENKH NVARCHAR(255),
    DCHI NVARCHAR(255),
    DTHOAI NVARCHAR(20),
	CONSTRAINT PK_KHACHHANG  PRIMARY KEY (MAKH)
);

-- Tạo bảng MATHANG
CREATE TABLE MATHANG (
    MAMH VARCHAR(10),
    TENMH NVARCHAR(255),
    DVT NVARCHAR(20),
    DONGIA DECIMAL(18, 2),
    SLTON INT,
	CONSTRAINT PK_MATHANG  PRIMARY KEY (MAMH)

);

-- Tạo bảng DATHANG
CREATE TABLE DATHANG (
    MADH VARCHAR(10),
    NGAYDH DATE,
    NGAYGIAODK DATE,
    MAKH VARCHAR(10),
    THANHTIEN DECIMAL(18, 2),
    TINHTRANG NVARCHAR(50),
	CONSTRAINT PK_DATHANG  PRIMARY KEY (MADH),
    CONSTRAINT FK_DATHANG_KHACHANG FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH)
);

-- Tạo bảng CTDH
CREATE TABLE CTDH (
    MADH VARCHAR(10),
    MAMH VARCHAR(10),
    SLDAT INT,
    DGDAT DECIMAL(18, 2),
    CONSTRAINT PK_CTDH PRIMARY KEY (MADH, MAMH),
    CONSTRAINT FK_CTHD_KHACHANG FOREIGN KEY (MADH) REFERENCES DATHANG(MADH),
    CONSTRAINT FK_CTHD_MATHANG FOREIGN KEY (MAMH) REFERENCES MATHANG(MAMH)
);
-- Câu 2a: Viết trigger
CREATE TRIGGER TRG_CTDH_INSERT
ON CTDH
AFTER INSERT
AS
BEGIN
    -- Cập nhật đơn giá đặt chính là đơn giá hiện hành của mặt hàng
    UPDATE CTDH
    SET DGDAT = MATHANG.DONGIA
    FROM CTDH
    INNER JOIN MATHANG ON CTDH.MAMH = MATHANG.MAMH
    WHERE CTDH.MADH IN (SELECT MADH FROM INSERTED);

    -- Tính lại thành tiền của đơn đặt hàng
    UPDATE DATHANG
    SET THANHTIEN = (
            SELECT SUM(SLDAT * DGDAT)
            FROM CTDH
            WHERE CTDH.MADH = DATHANG.MADH
            GROUP BY MADH
        )
    FROM DATHANG
    WHERE DATHANG.MADH IN (SELECT MADH FROM INSERTED);
END;

-- Câu 2b: Nhập dữ liệu
INSERT INTO KHACHHANG (MAKH, TENKH, DCHI, DTHOAI) VALUES
('KH01', N'Nguyễn Văn A', N'123 Đường ABC', '0123456789'),
('KH02', N'Trần Thị B', N'456 Đường XYZ', '0987654321'),
('KH03', N'Lê Văn C', N'789 Đường LMN', '0123456789');

INSERT INTO MATHANG (MAMH, TENMH, DVT, DONGIA, SLTON) VALUES
('MH01', N'Sản phẩm A', N'Cái', 10.5, 100),
('MH02', N'Sản phẩm B', N'Hộp', 25.0, 50),
('MH03', N'Sản phẩm C', N'Kg', 15.75, 75);

INSERT INTO DATHANG (MADH, NGAYDH, NGAYGIAODK, MAKH, THANHTIEN, TINHTRANG) VALUES
('DH01', '2023-01-01', '2023-01-05', 'KH01', 0, N'Đang xử lý'),
('DH02', '2023-02-01', '2023-02-10', 'KH02', 0, N'Chưa xác nhận'),
('DH03', '2023-03-01', '2023-03-15', 'KH03', 0, N'Đã giao hàng');

INSERT INTO CTDH (MADH, MAMH, SLDAT, DGDAT) VALUES
('DH01', 'MH01', 5, 0),
('DH01', 'MH02', 3, 0),
('DH02', 'MH02', 2, 0),
('DH02', 'MH03', 4, 0),
('DH03', 'MH01', 10, 0),
('DH03', 'MH03', 8, 0);

SELECT * FROM DATHANG

--Câu 3: (2.0 điểm)--Viết thủ tục nhập vào mã đơn hàng; trả về tên, địa chỉ và điện thoại của khách đã đặt đơn đặt--hàng đó. Viết lệnh gọi thực hiện thủ tục.
CREATE PROCEDURE TraThongTinKhachHang
    @MaHD VARCHAR(10)
AS
BEGIN
    SELECT KHACHHANG.TENKH, KHACHHANG.DCHI, KHACHHANG.DTHOAI
    FROM KHACHHANG
    INNER JOIN DATHANG ON KHACHHANG.MAKH = DATHANG.MAKH
    WHERE DATHANG.MADH = @MaHD;
END;
EXEC TraThongTinKhachHang 'DH01'

--Câu 4: (2.0 điểm)--Viết hàm nhập vào mã đơn hàng; trả về mã mặt hàng, tên mặt hàng của các mặt hàng trong--đơn hàng đó. Viết lệnh gọi thực hiện hàm.
CREATE FUNCTION TraThongTinHangBoiMaDH
    (@MaDH VARCHAR(10))
RETURNS TABLE
AS
RETURN
(
    SELECT CTDH.MAMH, MATHANG.TENMH
    FROM CTDH
    INNER JOIN MATHANG ON CTDH.MAMH = MATHANG.MAMH
    WHERE CTDH.MADH = @MaDH
);
SELECT * FROM dbo.TraThongTinHangBoiMaDH('DH01');

--Câu 5: (1.0 điểm)--a. Viết lệnh tạo và gán quyền cho các nhóm quyền sau:
--Nhóm quyền Quyền
--Khách hàng Xem thông tin các mặt hàng.
--Nhân viên Xem thông tin, thêm, xóa, sửa khách hàng.
--Xem thông tin, thêm, xóa, sửa đơn đặt hàng (table DATHANG,CTDH)

-- Tạo nhóm quyền
CREATE ROLE KhachHangRole;
CREATE ROLE NhanVienRole;

-- Gán quyền cho nhóm quyền KhachHangRole
GRANT SELECT ON MATHANG TO KhachHangRole;

-- Gán quyền cho nhóm quyền NhanVienRole
GRANT SELECT, INSERT, UPDATE, DELETE ON KHACHHANG TO NhanVienRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON DATHANG TO NhanVienRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON CTDH TO NhanVienRole;

--b. Viết lệnh tạo các tài khoản đăng nhập
-- Tạo tài khoản đăng nhập
CREATE LOGIN Mai WITH PASSWORD = 'maimap', DEFAULT_DATABASE = QL_DATHANG;
CREATE LOGIN Dao WITH PASSWORD = 'daotet', DEFAULT_DATABASE = QL_DATHANG;
CREATE LOGIN Tho WITH PASSWORD = 'thogia', DEFAULT_DATABASE = QL_DATHANG;

--c. Viết lệnh tạo các user tương ứng với tên đăng nhập và thuộc các nhóm quyền
-- Tạo user và gán vào nhóm quyền tương ứng
CREATE USER Mai FOR LOGIN Mai WITH DEFAULT_SCHEMA = dbo;
CREATE USER Dao FOR LOGIN Dao WITH DEFAULT_SCHEMA = dbo;
CREATE USER Tho FOR LOGIN Tho WITH DEFAULT_SCHEMA = dbo;

-- Gán user vào nhóm quyền
ALTER ROLE KhachHangRole ADD MEMBER Dao;
ALTER ROLE KhachHangRole ADD MEMBER Tho;

ALTER ROLE NhanVienRole ADD MEMBER Mai;


-- Thêm dữ liệu vào bảng KHACHHANG
INSERT INTO KHACHHANG (MAKH, TENKH, DCHI, DTHOAI) VALUES
('KH04', N'Nguyễn Thị D', N'456 Đường UVW', '0123456789');

-- Backup Full tại thời điểm t1
BACKUP DATABASE QL_DATHANG TO DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_02\Backup\QL_DATHANG_Full_t1.bak';

-- Thêm dữ liệu vào bảng KHACHHANG
INSERT INTO KHACHHANG (MAKH, TENKH, DCHI, DTHOAI) VALUES
('KH05', N'Lê Văn E', N'789 Đường XYZ', '0987654321');

-- Backup Differential tại thời điểm t2
BACKUP DATABASE QL_DATHANG TO DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_02\Backup\QL_DATHANG_Diff_t2.bak' WITH DIFFERENTIAL;

-- Thêm dữ liệu vào bảng KHACHHANG
INSERT INTO KHACHHANG (MAKH, TENKH, DCHI, DTHOAI) VALUES
('KH06', N'Trần Thị F', N'101 Đường LMN', '0123456789');

-- Backup Log tại thời điểm t3
BACKUP LOG QL_DATHANG TO DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_02\Backup\QL_DATHANG_Log_t3.bak';

-- Thêm dữ liệu vào bảng KHACHHANG
INSERT INTO KHACHHANG (MAKH, TENKH, DCHI, DTHOAI) VALUES
('KH07', N'Phạm Văn G', N'202 Đường ABC', '0987654321');

-- Backup Log tại thời điểm t4
BACKUP LOG QL_DATHANG TO DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_02\Backup\QL_DATHANG_Log_t4.bak';

ALTER DATABASE QL_DATHANG SET RECOVERY FULL;
--Câu 6b: Lệnh phục hồi CSDL khi sự cố xảy ra
-- Lệnh phục hồi CSDL từ Full Backup tại thời điểm t1
RESTORE DATABASE QL_DATHANG FROM DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_02\Backup\QL_DATHANG_Full_t1.bak' WITH REPLACE, NORECOVERY;

-- Lệnh phục hồi Differential Backup tại thời điểm t2
RESTORE DATABASE QL_DATHANG FROM DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_02\Backup\QL_DATHANG_Diff_t2.bak' WITH NORECOVERY;

-- Lệnh phục hồi Log Backup tại thời điểm t3
RESTORE LOG QL_DATHANG FROM DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_02\Backup\QL_DATHANG_Log_t3.bak' WITH NORECOVERY;

-- Lệnh phục hồi Log Backup tại thời điểm t4
RESTORE LOG QL_DATHANG FROM DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_02\Backup\QL_DATHANG_Log_t4.bak' WITH RECOVERY;
