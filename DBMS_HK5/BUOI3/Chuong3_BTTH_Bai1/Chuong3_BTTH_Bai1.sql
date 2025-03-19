CREATE DATABASE Chuong3_BTTH_Bai1
USE Chuong3_BTTH_Bai1

CREATE TABLE DMKhach (
    MaKhach VARCHAR(10) PRIMARY KEY,
    TenKhach NVARCHAR(50),
    DiaChi NVARCHAR(50),
	DienThoai VARCHAR(15)
	
);

CREATE TABLE DMHang (
    MaHang VARCHAR(10) PRIMARY KEY,
    TenHang NVARCHAR(50),
    DVT NVARCHAR(10),
	SoLuong INT
);

CREATE TABLE HoaDonBan (
    SoHD VARCHAR(10) PRIMARY KEY,
    MaKhach VARCHAR(10),
    NgayHD DATE DEFAULT GETDATE(),
    DienGiai NVARCHAR(255),
    FOREIGN KEY (MaKhach) REFERENCES DMKhach(MaKhach)
);

CREATE TABLE ChiTietHoaDon (
    SoHD VARCHAR(10),
    MaHang VARCHAR(10),
    SoLuong INT,
    DonGia DECIMAL(18, 2),
    PRIMARY KEY (SoHD, MaHang),
    FOREIGN KEY (SoHD) REFERENCES HoaDonBan(SoHD),
    FOREIGN KEY (MaHang) REFERENCES DMHang(MaHang)
);
---Ràng buộc--
ALTER TABLE ChiTietHoaDon
ADD CONSTRAINT CHK_SoLuong_DonGia_Positive
CHECK (SoLuong > 0 AND DonGia > 0);

-- Ràng buộc giá trị cho cột DVT
ALTER TABLE DMHang
ADD CONSTRAINT CHK_DVT_Values
CHECK (DVT IN (N'Túi', N'Cái'));

ALTER TABLE DMKhach
ADD CONSTRAINT CHK_DienThoai_Unique_Format
CHECK (DienThoai LIKE '[0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]');


--===========================================================================|
--==============================NHẬP LIỆU====================================|
INSERT INTO DMHang (MaHang, TenHang, DVT,SoLuong)
VALUES
('MH01', N'Bột giặt Omo', N'Túi',20),
('MH02', N'Bột giặt Tide', N'Túi',30),
('MH03', N'Đèn bàn Rạng Đông', N'Cái',50),
('MH04', N'Nồi cơm điện SHARP 3041', N'Cái',15),
('MH05', N'Bàn chải đánh răng PS', N'Cái',20),
('MH06', N'Nồi cơm điện PANASONIC 2097', N'Cái',10),
('MH07', N'Bàn chải đánh răng Colgate', N'Cái',30);

INSERT INTO DMKhach (MaKhach, TenKhach, DiaChi, DienThoai)
VALUES
('KH01', N'Nguyễn Thanh Tùng', N'Hồ Chí Minh', '9-9091-2233'),
('KH02', N'Lê Nhật Nam', N'Hồ Chí Minh', '9-1234-2134'),
('KH03', N'Nguyễn Thị Thanh', N'Cà Mau', '9-2222-3333'),
--Lỗi KH04 sai định dạng nó sẽ không vào
('KH05', N'Trần Minh Quang', N'Đồng Nai', '9-2222-5555'),
('KH06', N'Lê Văn Hải', N'Hồ Chí Minh', '9-1234-4321'),
('KH07', N'Dương Văn Hai', N'Đồng Nai', '9-1111-0000'),
('KH04', N'Lê Thị Lan', N'Bình Dương', '9-1111-111189');

INSERT INTO HoaDonBan (SoHD, MaKhach, NgayHD, DienGiai)
VALUES
('HD01', 'KH01', GETDATE(), NULL),
('HD02', 'KH02', '2016-12-15', NULL),
('HD03', 'KH05', '2017-10-18', NULL),
('HD04', 'KH01', GETDATE(), NULL),
('HD05', 'KH02', '2015-11-27', NULL);

INSERT INTO ChiTietHoaDon (SoHD, MaHang, SoLuong, DonGia)
VALUES
('HD01', 'MH01', 2, 3000),
('HD01', 'MH02', 2, 2500),
('HD02', 'MH01', 3, 3000),
('HD03', 'MH02', 3, 2500),
('HD03', 'MH03', 1, 9000),
('HD03', 'MH01', 3, 3000),
('HD04', 'MH04', 1, 2400),
('HD05', 'MH06', 1, 2000),
('HD05', 'MH01', 5, 3000);


-- Thực hiện Full Backup và lưu với tên DB_QLBH_Full.bak
BACKUP DATABASE Chuong3_BTTH_Bai1
TO DISK = 'D:\DATABASE\BUOI3\Chuong3_BTTH_Bai1\DB_QLBH_Full.bak'
WITH INIT;
--4.1. Đưa ra mã hàng, tên hàng không được bán trong năm 2016.
SELECT MH.MaHang, MH.TenHang
FROM DMHang MH
WHERE MH.MaHang NOT IN (SELECT DISTINCT CTHD.MaHang
                        FROM ChiTietHoaDon CTHD
                        INNER JOIN HoaDonBan HD ON CTHD.SoHD = HD.SoHD
                        WHERE YEAR(HD.NgayHD) = 2016);
--4.2. Đưa ra danh sách khách hàng có địa chỉ ở Hồ Chí Minh và từng mua hàng trong năm 2015.
SELECT DISTINCT KH.MaKhach, KH.TenKhach
FROM DMKhach KH
INNER JOIN HoaDonBan HD ON KH.MaKhach = HD.MaKhach
INNER JOIN ChiTietHoaDon CTHD ON HD.SoHD = CTHD.SoHD
INNER JOIN DMHang MH ON CTHD.MaHang = MH.MaHang
WHERE KH.DiaChi = N'Hồ Chí Minh' AND YEAR(HD.NgayHD) = 2015;

--4.3. Đưa ra số lượng đã bán tương ứng của từng mặt hàng.
SELECT MH.MaHang, MH.TenHang, SUM(CTHD.SoLuong) AS SoLuongDaBan
FROM DMHang MH
LEFT JOIN ChiTietHoaDon CTHD ON MH.MaHang = CTHD.MaHang
GROUP BY MH.MaHang, MH.TenHang;
--4.4. Mặt hàng nào được bán với số lượng nhiều nhất.
SELECT TOP 1 MH.MaHang, MH.TenHang, SUM(CTHD.SoLuong) AS TongSoLuongDaBan
FROM DMHang MH
LEFT JOIN ChiTietHoaDon CTHD ON MH.MaHang = CTHD.MaHang
GROUP BY MH.MaHang, MH.TenHang
ORDER BY TongSoLuongDaBan DESC;
--4.5. Danh sách những khách hàng chưa từng mua hàng.
SELECT KH.MaKhach, KH.TenKhach
FROM DMKhach KH
WHERE KH.MaKhach NOT IN (SELECT DISTINCT HD.MaKhach
                        FROM HoaDonBan HD);

--4.6. Danh sách những mặt hàng chưa từng được bán.
SELECT MH.MaHang, MH.TenHang
FROM DMHang MH
WHERE MH.MaHang NOT IN (SELECT DISTINCT CTHD.MaHang
                        FROM ChiTietHoaDon CTHD);
--4.7. Đưa ra số lượng tồn (Số lượng trong DMHang – Số Lượng bán trong ChiTietHoaDon) tương ứng của từng mặt hàng.
SELECT 
    MH.MaHang,
    MH.TenHang,
    MH.SoLuong - ISNULL(SUM(CTHD.SoLuong), 0) AS SoLuongTon
FROM 
    DMHang MH
LEFT JOIN 
    ChiTietHoaDon CTHD ON MH.MaHang = CTHD.MaHang
GROUP BY 
    MH.MaHang, MH.TenHang, MH.SoLuong;

--5. Viết lệnh sao lưu cơ sở dữ liệu với phương thức Transaction Log Backup, lưu với tên DB_QLBH_Tran.trn (lần 1)
BACKUP LOG Chuong3_BTTH_Bai1 TO DISK = 'D:\DATABASE\BUOI3\DB_QLBH_Bai1_Tran.trn' WITH INIT
--6. Thêm 1 cột ThanhTien trong bảng HoaDonBan kiểu decimal 1 số lẻ thập phân
ALTER TABLE HoaDonBan
ADD ThanhTien DECIMAL(18, 1)

CREATE TRIGGER UpdateThanhTienTrigger
ON ChiTietHoaDon
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Cập nhật ThanhTien trong HoaDonBan
    UPDATE HoaDonBan
    SET ThanhTien = CTHD.SoLuong * CTHD.DonGia
    FROM HoaDonBan HD
    INNER JOIN inserted CTHD ON HD.SoHD = CTHD.SoHD;
END;

BACKUP DATABASE Chuong3_BTTH_Bai1
TO DISK = 'D:\DATABASE\BUOI3\Chuong3_BTTH_Bai1\DB_QLBH_Diff.bak'
WITH DIFFERENTIAL, INIT;

INSERT INTO ChiTietHoaDon (SoHD, MaHang, SoLuong, DonGia)
VALUES
	('HD03', 'MH04',6,2400),
	('HD04', 'MH02',4,2500),
	('HD05', 'MH03',6,9000);

BACKUP DATABASE Chuong3_BTTH_Bai1
TO DISK = 'D:\DATABASE\BUOI3\Chuong3_BTTH_Bai1\DB_QLBH_Diff.bak'
WITH DIFFERENTIAL, INIT;

UPDATE HoaDonBan
SET ThanhTien = CTHD.SoLuong * CTHD.DonGia
FROM HoaDonBan HD
INNER JOIN ChiTietHoaDon CTHD ON HD.SoHD = CTHD.SoHD;

BACKUP LOG Chuong3_BTTH_Bai1 TO DISK = 'D:\DATABASE\BUOI3\DB_QLBH_Bai1_Tran.trn' WITH INIT;


UPDATE DMKhach
SET DiaChi = N'Kiên Giang'
WHERE MaKhach = 'KH03';

USE master;
DROP DATABASE Chuong3_BTTH_Bai1;

-- Lưu ý: Trước khi thực hiện phục hồi, hãy chắc chắn rằng bạn có bản sao lưu đầy đủ.
USE master;
RESTORE DATABASE Chuong3_BTTH_Bai1
FROM DISK = 'D:\DATABASE\BUOI3\Chuong3_BTTH_Bai1\DB_QLBH_Full.bak'
WITH REPLACE;

-- Sau đó, thực hiện phục hồi transaction log backups (nếu có).
RESTORE LOG Chuong3_BTTH_Bai1
FROM DISK = 'D:\DATABASE\BUOI3\DB_QLBH_Bai1_Tran.trn' WITH NORECOVERY;

-- Hoặc phục hồi differential backup (nếu có).
RESTORE DATABASE Chuong3_BTTH_Bai1
FROM DISK = 'D:\DATABASE\BUOI3\Chuong3_BTTH_Bai1\DB_QLBH_Diff.bak'
WITH NORECOVERY;

-- Kết thúc bằng lệnh phục hồi với NORECOVERY hoặc RECOVERY tùy vào trường hợp.
RESTORE DATABASE Chuong3_BTTH_Bai1 WITH RECOVERY;

