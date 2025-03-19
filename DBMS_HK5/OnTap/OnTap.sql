CREATE DATABASE DB_ONTAP
ON PRIMARY
(
	name = 'DB_PRIMARY',
	filename ='D:\DATABASE\OnTap\db_primary.mdf',
	size = 10MB, --Kích thước ban đầu
	maxsize = 30MB, -- Kích thước tối đa
	filegrowth = 10% -- Tỉ lệ tăng trưởng
),
--FILEGROUP : gồm mdf,ndf,ldf
FILEGROUP group1
(
	name = 'DB_SECOND',
	filename ='D:\DATABASE\OnTap\db_second.ndf',
	size = 8MB,
	maxsize = 20MB,
	filegrowth = 10%
)
LOG ON 
(
	name ='DB_LOG',
	filename ='D:\DATABASE\OnTap\db_log.ldf',
	size = 8MB,
	maxsize = 25MB,
	filegrowth = 15%
);

--Biến và gán giá trị cho biến
--1. SET

--	Gía trị cụ thể
DECLARE @masv char(10), @hoten varchar(30), @ngaysinh datetime
SET @masv = '2001215828'
SET @hoten = N'DangHuy'
SET @ngaysinh = '10-14-2003'
-- Giá trị của biểu thức
DECLARE @dt Float, @dl float , @dtb float
SET @dt = 7
SET @dl = 8
SET @dtb = (@dt + @dl) / 2
--PRINT N'Điểm trung bình của thí sinh :' + convert (char, @dtb)
SELECT @dt as N'Điểm toán', @dl as N'Điểm Lý'


-- Gán câu truy vấn
DECLARE @TongSV int
SET @TongSV (SELECT COUNT(MASV) FROM SINHVIEN WHERE DIACHI = 'TPHCM')

-- 2. SELECT 
DECLARE @masv char(10), @hoten varchar(30), @ngaysinh datetime
SELECT @masv = '2001215828', @hoten = N'DangHuy' ,@ngaysinh = '10-14-2003'

DECLARE @dt Float, @dl float , @dtb float
SELECT @dt = 7, @dl = 8,  @dtb = (@dt + @dl) / 2

DECLARE @hoten varchar(10), @namsinh int
SELECT @hoten = HOTEN, @namsinh = YEAR(NGAYSINH)
FROM SINHVIEN WHERE MASV = '2001215828'

-- Biến hệ thống
-- DECLARE biến để lưu điểm trung bình và loại của sinh viên
DECLARE @DiemTrungBinh FLOAT;
DECLARE @Loai NVARCHAR(50);

-- Lấy điểm trung bình từ bảng Students, thay thế 'StudentID' bằng ID của sinh viên cụ thể
SELECT @DiemTrungBinh = AVG(Grade) 
FROM Students
WHERE StudentID = '123';

-- Sử dụng cấu trúc IF-ELSE để xác định loại của sinh viên dựa trên điểm trung bình
IF @DiemTrungBinh >= 9.0
    SET @Loai = 'Xuất sắc';
ELSE IF @DiemTrungBinh >= 7.0
    SET @Loai = 'Khá';
ELSE IF @DiemTrungBinh >= 5.0
    SET @Loai = 'Trung bình';
ELSE
    SET @Loai = 'Yếu';

-- In ra kết quả
PRINT 'Điểm trung bình: ' + CAST(@DiemTrungBinh AS NVARCHAR(10));
PRINT 'Loại: ' + @Loai;


DECLARE @Counter INT = 1;

WHILE @Counter <= 10
BEGIN
    PRINT N'Số nguyên: ' + CAST(@Counter AS NVARCHAR(2));
    SET @Counter = @Counter + 1;
END;

DECLARE @a INT = 2;
DECLARE @b INT = 3;
DECLARE @tong INT;

WHILE (@a <10) and (@b <10)
BEGIN
    SET @tong = @a + @b;
    PRINT N'Tổng ' + CAST(@a AS NVARCHAR(2)) + ' + ' + CAST(@b AS NVARCHAR(2)) + ' = ' + CAST(@tong AS NVARCHAR(2));

    -- Kiểm tra điều kiện để dừng vòng lặp
    IF @tong = 9
        BREAK;

    -- Cập nhật giá trị a và b
    SET @a = @a + 1;
    SET @b = @b + 1;
END;
