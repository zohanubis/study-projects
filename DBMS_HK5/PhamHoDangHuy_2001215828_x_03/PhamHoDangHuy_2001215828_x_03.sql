CREATE DATABASE QL_XEKHACH
ON PRIMARY
  (NAME = QLXK_PRIMARY,
   FILENAME = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_03\QLXK_PRIMARY.mdf',
   SIZE = 5MB,
   MAXSIZE = 10MB,
   FILEGROWTH = 10%)
LOG ON
  (NAME = QLXK_LOG,
   FILENAME = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_03\QLXK_LOG.ldf',
   SIZE = 5MB,
   MAXSIZE = 10MB,
   FILEGROWTH = 10%);

USE QL_XEKHACH;

-- b. Tạo bảng trong CSDL
CREATE TABLE TUYENXE (
    MATUYEN VARCHAR(10) PRIMARY KEY,
    TENTUYEN NVARCHAR(30),
    DIEMDON NVARCHAR(30),
    DIEMTRA NVARCHAR(30)
);

CREATE TABLE KHACHHANG (
    MAKH VARCHAR(10) PRIMARY KEY,
    TENKH NVARCHAR(30),
    NGAYSINH DATE,
    DIACHI NVARCHAR(30),
    SODT NVARCHAR(20)
);

CREATE TABLE CHUYENXE (
    MACHUYEN VARCHAR(10) PRIMARY KEY,
    MATUYEN VARCHAR(10) REFERENCES TUYENXE(MATUYEN),
    NGAYDI DATE,
    TGKH TIME,
    TGKT TIME,
    DONGIAVE DECIMAL(18, 2),
    SLGHE INT
);

CREATE TABLE VE (
    MAVE VARCHAR(10) PRIMARY KEY,
    MAKH VARCHAR(10) REFERENCES KHACHHANG(MAKH),
    SOGHE INT,
    MACHUYEN VARCHAR(10) REFERENCES CHUYENXE(MACHUYEN),
    KHOILUONG DECIMAL(18, 2),
    PHUTHU DECIMAL(18, 2),
    THANHTIEN DECIMAL(18, 2)
);

--Câu 2: (1.5 điểm)--a. Viết trigger kiểm tra khi bán vé thì cập nhật phụ thu 50.000 đồng nếu khối lượng hành lý--của khách hàng từ 10kg trở lên, các trường hợp còn lại phụ thu bằng 0. Sau đó tính thành tiền--= đơn giá vé + phụ thu
CREATE TRIGGER Trig_BanVe
ON VE
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE VE
    SET PHUTHU = IIF((SELECT KHOILUONG FROM inserted) >= 10, 50000, 0),
        THANHTIEN = (SELECT DONGIAVE FROM CHUYENXE WHERE CHUYENXE.MACHUYEN = (SELECT MACHUYEN FROM inserted)) +
                    IIF((SELECT KHOILUONG FROM inserted) >= 10, 50000, 0)
    FROM VE
    INNER JOIN inserted ON VE.MAVE = inserted.MAVE;
END;
GO

ENABLE TRIGGER Trig_BanVe ON VE;

-- Bảng TUYENXE
INSERT INTO TUYENXE VALUES ('T1', N'Tuyến 1', N'A', N'B');
INSERT INTO TUYENXE VALUES ('T2', N'Tuyến 2', N'C', N'D');
INSERT INTO TUYENXE VALUES ('T3', N'Tuyến 3', N'E', N'F');

-- Bảng KHACHHANG
INSERT INTO KHACHHANG VALUES ('KH1', N'Nguyen Van A', '1990-01-01', N'123 Main St', N'123456789');
INSERT INTO KHACHHANG VALUES ('KH2', N'Tran Thi B', '1985-05-15', N'456 Broad St', N'987654321');
INSERT INTO KHACHHANG VALUES ('KH3', N'Le Van C', '1995-08-20', N'789 Market St', N'111222333');
-- Bảng CHUYENXE
INSERT INTO CHUYENXE VALUES ('CX1', 'T1', '2023-01-10', '08:00', '10:00', 100000, 50);
INSERT INTO CHUYENXE VALUES ('CX2', 'T2', '2023-02-15', '09:30', '11:30', 120000, 40);
INSERT INTO CHUYENXE VALUES ('CX3', 'T3', '2023-03-20', '12:00', '14:00', 150000, 30);

-- Bảng VE
INSERT INTO VE (MAVE, MAKH, SOGHE, MACHUYEN, KHOILUONG, PHUTHU, THANHTIEN)
VALUES ('V1', 'KH1', 25, 'CX1', 15.5, 0, 0);

INSERT INTO VE (MAVE, MAKH, SOGHE, MACHUYEN, KHOILUONG, PHUTHU, THANHTIEN)
VALUES ('V2', 'KH2', 35, 'CX2', 8.5, 50000,0);

INSERT INTO VE (MAVE, MAKH, SOGHE, MACHUYEN, KHOILUONG, PHUTHU, THANHTIEN)
VALUES ('V3', 'KH3', 20, 'CX3', 12, 0,0);

SELECT * FROM VE

--Câu 3: (2.0 điểm)
--Viết thủ tục truyền vào mã chuyến xe, xuất ra danh sách các vé đã bán. Viết lệnh thực thi thủ tục.
CREATE PROCEDURE DanhSachVeDaBan
    @MaChuyenXe VARCHAR(10)
AS
BEGIN
    SELECT V.*, KH.TENKH, CX.NGAYDI
    FROM VE V
    JOIN KHACHHANG KH ON V.MAKH = KH.MAKH
    JOIN CHUYENXE CX ON V.MACHUYEN = CX.MACHUYEN
    WHERE V.MACHUYEN = @MaChuyenXe;
END;

-- Lệnh thực thi thủ tục (ví dụ với mã chuyến xe là 'CX1')
EXEC DanhSachVeDaBan 'CX1';

--Câu 4: (2.0 điểm)
--Viết hàm thống kê tổng số vé đã bán và tổng tiền thu được của từng tuyến trong khoảng thời--gian từ ngày đến ngày. Viết lệnh gọi thực hiện hàm.-- Câu 4: Hàm
CREATE FUNCTION ThongKeVeTotalDate
(
    @FromDate DATE,
    @ToDate DATE
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        TUYENXE.MATUYEN,
        TUYENXE.TENTUYEN,
        COUNT(VE.MAVE) AS TongSoVeBan,
        SUM(VE.THANHTIEN) AS TongTienThuDuoc
    FROM
        TUYENXE
    LEFT JOIN
        CHUYENXE ON TUYENXE.MATUYEN = CHUYENXE.MATUYEN
    LEFT JOIN
        VE ON CHUYENXE.MACHUYEN = VE.MACHUYEN
    WHERE
        CHUYENXE.NGAYDI BETWEEN @FromDate AND @ToDate
    GROUP BY
        TUYENXE.MATUYEN, TUYENXE.TENTUYEN
);

-- Lệnh gọi thực hiện hàm (ví dụ với khoảng thời gian từ '2023-01-01' đến '2023-12-31')
SELECT * FROM ThongKeVeTotalDate('2023-01-01', '2023-12-31');

--Câu 5: (2 điểm) Viết lệnh T-SQL thực hiện các yêu cầu sau đây:
--a. Sao lưu cơ sở dữ liệu theo lịch trình sau đây:
ALTER DATABASE QL_XEKHACH SET RECOVERY FULL;
-- T1: Sao lưu Full
BACKUP DATABASE QL_XEKHACH TO DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_03\Backup\QL_XEKHACH_Full.bak';

-- T2: Sao lưu Log
BACKUP LOG QL_XEKHACH TO DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_03\Backup\QL_XEKHACH_Log1.trn';

-- T3: Sao lưu Log
BACKUP LOG QL_XEKHACH TO DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_03\Backup\QL_XEKHACH_Log2.trn';

-- T4: Sao lưu Differential
BACKUP DATABASE QL_XEKHACH TO DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_03\Backup\QL_XEKHACH_Diff.bak' WITH DIFFERENTIAL;

-- T5: Sao lưu Log
BACKUP LOG QL_XEKHACH TO DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_03\Backup\QL_XEKHACH_Log3.trn';

-- T6: Sao lưu Log (đối với trường hợp sự cố)
BACKUP LOG QL_XEKHACH TO DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_03\Backup\QL_XEKHACH_Log4.trn';

--b. Giả sử sự cố xảy ra sau khi thực hiện câu a, Hãy viết lệnh phục hồi co sở dữ liệu sao cho
--ít mất dữ liệu nhất. (Lưu ý: Tại mỗi thời điểm Ti (i≥1) sinh viên tự thêm một dòng dữ liệu
--vào bảng KHACHHANG để đảm bảo có sự thay đổi dữ liệu trong cơ sở dữ liệu).

-- Phục hồi đến thời điểm T3
RESTORE DATABASE QL_XEKHACH FROM DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_03\Backup\QL_XEKHACH_Log2.trn' WITH NORECOVERY;

-- Phục hồi đến thời điểm T4 (Sao lưu Differential)
RESTORE DATABASE QL_XEKHACH FROM DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_03\Backup\QL_XEKHACH_Diff.bak' WITH RECOVERY;

-- Phục hồi các giao dịch Log sau sự cố
RESTORE LOG QL_XEKHACH FROM DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_03\Backup\QL_XEKHACH_Log3.trn' WITH RECOVERY;
RESTORE LOG QL_XEKHACH FROM DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_03\Backup\QL_XEKHACH_Log4.trn' WITH RECOVERY;


-- a. Tạo các tài khoản đăng nhập
CREATE LOGIN nhanvien1 WITH PASSWORD = 'MaSoSinhVien1';
CREATE LOGIN khachhang1 WITH PASSWORD = 'MaSoSinhVien2';

-- b. Tạo các tài khoản người dùng
USE QL_XEKHACH;

CREATE USER nhanvien1 FOR LOGIN nhanvien1;
CREATE USER khachhang1 FOR LOGIN khachhang1;

-- c. Tạo và cấp quyền cho các nhóm quyền
USE QL_XEKHACH;

-- Nhóm quyền Nhanvien
CREATE ROLE Nhanvien;
GRANT SELECT, INSERT ON CHUYENXE TO Nhanvien;
GRANT SELECT, INSERT ON KHACHHANG TO Nhanvien;
GRANT SELECT, INSERT ON VE TO Nhanvien;

-- Nhóm quyền Khachhang
CREATE ROLE Khachhang;
GRANT SELECT ON TUYENXE TO Khachhang;
GRANT SELECT ON CHUYENXE TO Khachhang;

-- d. Thêm người dùng vào nhóm quyền
USE QL_XEKHACH;

ALTER ROLE Nhanvien ADD MEMBER nhanvien1;
ALTER ROLE Khachhang ADD MEMBER khachhang1;
