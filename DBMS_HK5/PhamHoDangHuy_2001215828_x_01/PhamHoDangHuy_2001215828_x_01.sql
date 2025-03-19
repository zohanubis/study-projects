-- Câu 1a: Tạo Cơ sở dữ liệu
CREATE DATABASE QL_THUENHA
ON PRIMARY
(
    NAME = QLTN_PRIMARY,
    FILENAME = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_01\QLTN_PRIMARY.mdf',
    SIZE = 5MB,
    MAXSIZE = 10MB,
    FILEGROWTH = 10%
)
LOG ON
(
    NAME = QLTN_LOG,
    FILENAME = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_01\QLTN_LOG.ldf',
    SIZE = 3MB,
    MAXSIZE = 5MB,
    FILEGROWTH = 15%
);

-- Chuyển đến cơ sở dữ liệu mới tạo
USE QL_THUENHA;
----------------
CREATE TABLE NHA (
    MANHA VARCHAR(10),
    SONHA VARCHAR(10),
    DUONG NVARCHAR(50),
    PHUONG NVARCHAR(50),
    QUAN NVARCHAR(50),
    TIENTHUE FLOAT,
    MOTA NVARCHAR(50),
    TINHTRANG NVARCHAR(50)
	CONSTRAINT PK_NHA PRIMARY KEY (MANHA)

);
-- Bảng KHACHHANG
CREATE TABLE KHACHHANG (
    MAKH VARCHAR(10),
    HOTENKH NVARCHAR(50),
    NGAYSINH DATE,
    PHAI NVARCHAR(10),
    DIACHI NVARCHAR(50),
    DTHOAI NVARCHAR(50),
    KHANANGTHUE FLOAT,
	CONSTRAINT PK_KHACHHANG PRIMARY KEY (MAKH)

);

-- Bảng HOPDONG
CREATE TABLE HOPDONG (
    SOHD VARCHAR(10),
    MANHA VARCHAR(10),
    MAKH VARCHAR(10),
    NGAYLAP DATE,
    NGAYBD DATE,
    THOIHANTHUE INT, -- tháng
    TRIGIAHD FLOAT,
	CONSTRAINT PK_HOPDONG PRIMARY KEY (SOHD),
    CONSTRAINT FK_HOPDONG_NHA FOREIGN KEY (MANHA) REFERENCES NHA(MANHA),
    CONSTRAINT FK_HOPDONG_KHACHHANG FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH),
);

-----------TRIGGER
--Câu 2: (1.5 điểm)
--a. Viết trigger thực hiện kiểm tra khi lập mới một hợp đồng thì trị giá của hợp đồng tự động--được cập nhật theo quy định: Trị giá hợp đồng = Thời hạn thuê * tiền thuê căn nhà.
-- Trigger cho bảng HOPDONG
CREATE TRIGGER TRG_UPDATE_TRIGIAHD
ON HOPDONG
AFTER INSERT
AS
BEGIN
    UPDATE HOPDONG
    SET TRIGIAHD = inserted.THOIHANTHUE * (SELECT TIENTHUE FROM NHA WHERE MANHA = inserted.MANHA)
    FROM HOPDONG
    INNER JOIN inserted ON HOPDONG.SOHD = inserted.SOHD;
END;

--b. Nhập dữ liệu cho các bảng trên. (ít nhất 3 dòng cho mỗi bảng).
INSERT INTO NHA (MANHA, SONHA, DUONG, PHUONG, QUAN, TIENTHUE, MOTA, TINHTRANG)
VALUES
('NHA001', '123A', N'Đường A', N'Phường B', N'Quận 1', 500, N'Mô tả nhà 1', N'Có'),
('NHA002', '456B', N'Đường X', N'Phường Y', N'Quận 1', 600, N'Mô tả nhà 2', N'Có'),
('NHA003', '789C', N'Đường M', N'Phường N', N'Quận 2', 700, N'Mô tả nhà 3', N'Có');

INSERT INTO KHACHHANG (MAKH, HOTENKH, NGAYSINH, PHAI, DIACHI, DTHOAI, KHANANGTHUE)
VALUES
('KH001', N'Nguyễn Văn An', '1990-01-01', N'Nam', N'Sài Gòn', '0901234567', 1000),
('KH002', N'Trần Thị Vân', '1985-05-15', N'Nữ', N'Sài Gòn', '0912345678', 800),
('KH003', N'Lê Văn Tam', '2000-12-31', N'Nam', N'Sài Gòn', '0987654321', 1200);

INSERT INTO HOPDONG (SOHD, MANHA, MAKH, NGAYLAP, NGAYBD, THOIHANTHUE)
VALUES
('HD001', 'NHA001', 'KH001', '2023-01-01', '2023-02-01', 6),
('HD002', 'NHA002', 'KH002', '2023-02-01', '2023-03-01', 9),
('HD003', 'NHA003', 'KH003', '2023-03-01', '2023-04-01', 12);
SELECT * FROM HOPDONG

--Câu 3: (2.0 điểm)
--Viết thủ tục nhập vào mã căn nhà, trả về số lượng hợp đồng đã thuê căn nhà đó. Viết lệnh gọi--thực hiện thủ tục.
CREATE PROCEDURE LaySoLuongHD
    @MaNha VARCHAR(10)
AS
BEGIN
    SELECT COUNT(*) AS N'Số Lượng HĐ'
    FROM HOPDONG
    WHERE MANHA = @MaNha;
END;

DECLARE @MaNha VARCHAR(10) = 'NHA001';
EXEC LaySoLuongHD @MaNha;

--Câu 4: (2.0 điểm)
--Viết hàm nhập vào mã khách hàng, trả về địa chỉ và giá thuê các căn nhà mà khách hàng đó--có thể thuê. Viết lệnh gọi thực hiện hàm.CREATE FUNCTION TraThongTinCanNhaKHThue
    (@MaKH VARCHAR(10))
RETURNS TABLE
AS
RETURN
(
    SELECT NHA.MANHA, SONHA, DUONG, PHUONG, QUAN, TIENTHUE
    FROM HOPDONG
    INNER JOIN NHA ON HOPDONG.MANHA = NHA.MANHA
    WHERE HOPDONG.MAKH = @MaKH
);
DECLARE @MaKH VARCHAR(10) = 'KH001'; 
SELECT * FROM TraThongTinCanNhaKHThue(@MaKH);

--Câu 5: (1.0 điểm)
--a. Viết lệnh tạo và gán quyền cho các nhóm quyền
CREATE ROLE KhachHangRole;
CREATE ROLE NhanVienRole;

GRANT SELECT ON NHA TO KhachHangRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON KHACHHANG TO NhanVienRole;
GRANT SELECT, INSERT, UPDATE ON NHA TO NhanVienRole;
GRANT SELECT, INSERT ON HOPDONG TO NhanVienRole;

--b. Tạo tài khoản đăng nhập
CREATE LOGIN [Lan] WITH PASSWORD = 'gauyeu'
CREATE LOGIN [Hong] WITH PASSWORD = 'thocon'
CREATE LOGIN [Cuc] WITH PASSWORD = 'cucdep'

--c. Tạo user và gán vào nhóm quyền
CREATE USER Lan FOR LOGIN Lan WITH DEFAULT_SCHEMA = dbo;
CREATE USER Hong FOR LOGIN Hong WITH DEFAULT_SCHEMA = dbo;
CREATE USER Cuc FOR LOGIN Cuc WITH DEFAULT_SCHEMA = dbo;

ALTER ROLE KhachHangRole ADD MEMBER Hong;
ALTER ROLE KhachHangRole ADD MEMBER Cuc;
ALTER ROLE NhanVienRole ADD MEMBER Lan;

--Câu 6a: Thêm dòng dữ liệu vào bảng KHACHHANG và thực hiện backup.
-- Thêm dòng dữ liệu vào bảng KHACHHANG
INSERT INTO KHACHHANG (MAKH, HOTENKH, NGAYSINH, PHAI, DIACHI, DTHOAI, KHANANGTHUE)
VALUES ('KH004', N'Nguyen Thi D', '1988-06-20', N'Nữ', N'Dia chi D', '0978765432', 900);

-- Full Backup tại thời điểm t1
BACKUP DATABASE QL_THUENHA TO DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_01\Backup\QL_THUENHA_FULL_BACKUP.bak';
ALTER DATABASE QL_THUENHA SET RECOVERY FULL;
-- Log Backup tại thời điểm t2
BACKUP LOG QL_THUENHA TO DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_01\Backup\QL_THUENHA_LOG_BACKUP_t2.bak';

-- Differential Backup tại thời điểm t3
BACKUP DATABASE QL_THUENHA TO DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_01\Backup\QL_THUENHA_DIFF_BACKUP_t3.bak' WITH DIFFERENTIAL;

-- Log Backup tại thời điểm t4
BACKUP LOG QL_THUENHA TO DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_01\Backup\QL_THUENHA_LOG_BACKUP_t4.bak';

--Câu 6b: Viết lệnh phục hồi CSDL khi sự cố xảy ra.
-- Đặt cơ sở dữ liệu trong chế độ phục hồi
ALTER DATABASE QL_THUENHA SET RECOVERY FULL;

-- Phục hồi từ Full Backup tại thời điểm t1
RESTORE DATABASE QL_THUENHA FROM DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_01\Backup\QL_THUENHA_FULL_BACKUP.bak' WITH NORECOVERY;

-- Phục hồi từ Log Backup tại thời điểm t2
RESTORE LOG QL_THUENHA FROM DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_01\Backup\QL_THUENHA_LOG_BACKUP_t2.bak' WITH RECOVERY;

-- Phục hồi từ Differential Backup tại thời điểm t3
RESTORE DATABASE QL_THUENHA FROM DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_01\Backup\QL_THUENHA_DIFF_BACKUP_t3.bak' WITH RECOVERY;

-- Phục hồi từ Log Backup tại thời điểm t4
RESTORE LOG QL_THUENHA FROM DISK = 'D:\DATABASE\PhamHoDangHuy_2001215828_x_01\Backup\QL_THUENHA_LOG_BACKUP_t4.bak' WITH RECOVERY;


