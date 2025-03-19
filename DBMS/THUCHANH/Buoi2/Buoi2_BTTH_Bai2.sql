CREATE DATABASE DB1;
USE DB1;

CREATE TABLE SINHVIEN (
    MASV VARCHAR(10),
    HOTEN NVARCHAR(50),
    NGSINH DATE,
    DIEMTB DECIMAL(5, 2)
);

SET DATEFORMAT DMY;

INSERT INTO SINHVIEN (MASV, HOTEN, NGSINH, DIEMTB)
VALUES ('SV001', N'Nguyễn Văn Bảnh', '1990-01-15', 8.5),
       ('SV002', N'Trần Thị Nở', '1992-04-20', 6.3),
       ('SV003', N'Lê Văn Chí Phèo', '1995-10-05', 4.8),
       ('SV004', N'Nguyễn Văn Khánh', '1982-03-20', 9.2);

-- 1. Khai báo và gán giá trị họ tên và ngày sinh của sinh viên có mã 'SV004' vào biến
DECLARE @HoTen NVARCHAR(50);
DECLARE @NgaySinh DATE;

SELECT @HoTen = HOTEN, @NgaySinh = NGSINH
FROM SINHVIEN
WHERE MASV = 'SV004';
PRINT 'Sinh vien ' + @HoTen + ' co ngay sinh la: ' + CONVERT(NVARCHAR(50), @NgaySinh, 103);
-- 2. Sử dụng lệnh SELECT để in ra giá trị của biến @HoTen và @NgaySinh
DECLARE @HoTen NVARCHAR(50);
DECLARE @NgaySinh DATE;

SELECT @HoTen = HOTEN, @NgaySinh = NGSINH
FROM SINHVIEN
WHERE MASV = 'SV004';
SELECT @HoTen AS 'HoTen', @NgaySinh AS 'NgaySinh';

-- 3. Kiểm tra điểm trung bình và in thông báo tương ứng
DECLARE @DIEMTB DECIMAL(5, 2)
SET @DIEMTB = (SELECT DIEMTB FROM SINHVIEN WHERE MASV ='SV004')

IF @DIEMTB < 5
    PRINT 'Yeu';
ELSE IF @DIEMTB >= 5 AND @DIEMTB < 7
    PRINT 'Trung binh';
ELSE IF @DIEMTB >= 7 AND @DIEMTB < 8
    PRINT 'Kha';
ELSE
    PRINT 'Gioi';

-- 4. Kiểm tra tuổi của sinh viên có mã 'SV001' và xuất thông tin hoặc thông báo

DECLARE @Tuoi INT
SELECT @Tuoi = DATEDIFF(YEAR, (SELECT NGSINH FROM SINHVIEN WHERE MASV = 'SV001'), GETDATE());
IF @Tuoi > 30
	(SELECT HOTEN,DIEMTB FROM SINHVIEN WHERE MASV = 'SV001') 
ELSE
    PRINT 'Sinh vien nay duoi 30 tuoi';
-- 5. Kiểm tra nếu có sinh viên có điểm trung bình > 5 và xuất ra tổng số hoặc thông báo
IF EXISTS (SELECT 1 FROM SINHVIEN WHERE DIEMTB > 5)
    SELECT 'Tong so sinh vien tren trung binh la: ' + CAST((SELECT COUNT(*) FROM SINHVIEN WHERE DIEMTB > 5) AS NVARCHAR(10));
ELSE
    PRINT 'Khong co sinh vien tren trung binh';
