CREATE DATABASE Buoi2_BTLT_QLDoAn
USE Buoi2_BTLT_QLDoAn
CREATE TABLE LOAIDETAI (
    MALOAI VARCHAR(10) CONSTRAINT PK_LOAIDETAI PRIMARY KEY,
    TENLOAI NVARCHAR(50)
);


CREATE TABLE DETAI (
    MADT VARCHAR(10) CONSTRAINT PK_DETAI PRIMARY KEY,
    TENDT NVARCHAR(50),
    SOSV_TOIDA INT,
    SOSV_DANGKY INT,
    MALOAI VARCHAR(10),
    CONSTRAINT FK_LOAIDETAI FOREIGN KEY (MALOAI) REFERENCES LOAIDETAI(MALOAI)
);

CREATE TABLE LOP (
    MALOP VARCHAR(10) CONSTRAINT PK_LOP PRIMARY KEY,
    TENLOP NVARCHAR(50),
	SISO INT,
    SOSV_DOAN INT,
    SOSV_KHOALUAN INT
);

CREATE TABLE SINHVIEN (
    MASV VARCHAR(10) CONSTRAINT PK_SINHVIEN PRIMARY KEY,
    HOTENSV NVARCHAR(50),
    NGAYSINH DATE,
    PHAI BIT,
    MALOP VARCHAR(10),
    DIEMTB FLOAT,
    DIENLAMDETAI NVARCHAR(50),
    MADT VARCHAR(10),
    CONSTRAINT FK_LOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP),
    CONSTRAINT FK_DETAI FOREIGN KEY (MADT) REFERENCES DETAI(MADT)
);

--1.4. Cài đặt các ràng buộc toàn vẹn:
-- a. Ràng buộc toàn vẹn giá trị của thuộc tính SOSV_TOIDA trong quan hệ DETAI phải lớn hơn 0
ALTER TABLE DETAI
ADD CONSTRAINT CHK_SOSV_TOIDA CHECK (SOSV_TOIDA > 0);

-- b. Ràng buộc toàn vẹn giá trị của thuộc tính DIEMTB trong quan hệ SINHVIEN phải nhỏ hơn hoặc bằng 4.0
ALTER TABLE SINHVIEN
ADD CONSTRAINT CHK_DIEMTB CHECK (DIEMTB <= 4.0);

-- c. Ràng buộc giá trị mặc định số sinh viên đăng ký (SOSV_DANGKY) trong quan hệ DETAI bằng 0
ALTER TABLE DETAI
ADD CONSTRAINT DF_SOSV_DANGKY DEFAULT 0 FOR SOSV_DANGKY;

-- d. Ràng buộc giá trị mặc định số sinh viên làm đồ án (SOSV_DOAN) và số sinh viên làm khoá luận (SOSV_KHOALUAN) trong quan hệ LOP bằng 0
ALTER TABLE LOP
ADD CONSTRAINT DF_SOSV_DOAN DEFAULT 0 FOR SOSV_DOAN,
    CONSTRAINT DF_SOSV_KHOALUAN DEFAULT 0 FOR SOSV_KHOALUAN;

-- e. Ràng buộc giá trị mặc định diện làm đề tài (DIENLAMDETAI) là "Chưa xác định"
ALTER TABLE SINHVIEN
ADD CONSTRAINT DF_DIENLAMDETAI DEFAULT N'Chưa xác định' FOR DIENLAMDETAI;

-- f. Lệnh thêm ràng buộc duy nhất (UNIQUE) cho trường TENDT trong bảng DETAI
ALTER TABLE DETAI
ADD CONSTRAINT UQ_TENDT UNIQUE (TENDT);

-- g. Lệnh thêm ràng buộc duy nhất (UNIQUE) cho trường TENLOP trong bảng LOP
ALTER TABLE LOP
ADD CONSTRAINT UQ_TENLOP UNIQUE (TENLOP);

---1.5. Viết lệnh nhập dữ liệu cho các bảng trong cơ sở dữ liệu 
-- Thêm dữ liệu vào bảng LOAIDETAI
INSERT INTO LOAIDETAI (MALOAI, TENLOAI)
VALUES
    ('DA', N'Đồ án tốt nghiệp'),
    ('KL', N'Khóa luận tốt nghiệp');

-- Thêm dữ liệu vào bảng DETAI
INSERT INTO DETAI (MADT, TENDT, SOSV_TOIDA, SOSV_DANGKY, MALOAI)
VALUES
    ('DA01', N'Quản lí cửa hàng điện', 2, 0, 'DA'),
    ('DA02', N'Quản lí shop thời trang', 2, 0, 'DA'),
    ('DA03', N'Quản lí kí túc xá', 2, 0, 'DA'),
    ('DA04', N'Quản lí ngắn hạn', 2, 0, 'DA'),
    ('DA05', N'Quản lí vận tải', 2, 0, 'DA'),
    ('DA06', N'Quản lí thư viện', 2, 0, 'DA'),
    ('DA07', N'Quản lí bãi giữ xe', 2, 0, 'DA'),
    ('KL01', N'Quản lí đăng ký học phần', 2, 0, 'KL'),
    ('KL02', N'Quản lí xếp thời khóa biểu', 3, 0, 'KL'),
    ('KL03', N'Quản lí bệnh viện', 3, 0, 'KL'),
    ('KL04', N'Quản lí siêu thị', 2, 0, 'KL'),
    ('KL05', N'Quản lí ngân hàng', 3, 0, 'KL'),
    ('KL06', N'Quản lí phòng thí nghiệm', 3, 0, 'KL');

-- Thêm dữ liệu vào bảng LOP
INSERT INTO LOP (MALOP, TENLOP, SISO, SOSV_DOAN, SOSV_KHOALUAN)
VALUES
    ('06DHTH01', N'Đại học khóa 6 lớp 1', 45, 0, 0),
    ('06DHTH02', N'Đại học khóa 6 lớp 2', 50, 0, 0),
    ('06DHTH03', N'Đại học khóa 6 lớp 3', 35, 0, 0),
    ('06DHTH04', N'Đại học khóa 6 lớp 4', 30, 0, 0);

-- Thêm dữ liệu vào bảng SINHVIEN
INSERT INTO SINHVIEN (MASV, HOTENSV, NGAYSINH, PHAI, MALOP, DIEMTB, DIENLAMDETAI, MADT)
VALUES
    ('SV01', N'Nguyễn Hải Anh', '1996-01-01', 1, '06DHTH01', 2.9, N'Khóa luận', 'KL01'),
    ('SV02', N'Trần Việt Hà', '1996-02-01', 1, '06DHTH02', 3.5, N'Khóa luận', 'KL02'),
    ('SV03', N'Phan Thanh Hằng', '1996-03-01', 0, '06DHTH04', 2.7, N'Khóa luận', 'KL03'),
    ('SV04', N'Hứa Quang Biểu', '1996-04-01', 1, '06DHTH04', 2.6, N'Khóa luận', 'KL04'),
    ('SV05', N'Nguyễn Thị Thanh', '1996-05-01', 0, '06DHTH03', 2, N'Đồ án', 'DA03'),
    ('SV06', N'Phùng Ái Nhi', '1996-06-01', 0, '06DHTH04', 2.4, N'Đồ án', 'DA05'),
    ('SV07', N'Trần Tiến Đạt', '1996-07-01', 1, '06DHTH01', 2.7, N'Khóa luận', 'KL05'),
    ('SV08', N'Bùi Anh Tú', '1996-08-01', 1, '06DHTH03', 2.9, N'Khóa luận', 'KL05'),
    ('SV09', N'Lâm Quang Minh', '1996-09-01', 1, '06DHTH02', 2.1, N'Đồ án', 'DA01'),
    ('SV10', N'Hà Thanh Thư', '1996-10-01', 0, '06DHTH03', 2, N'Đồ án', 'DA07'),
    ('SV11', N'Phan Hồng Ngọc', '1996-11-01', 0, '06DHTH03', 2.5, N'Khóa luận', 'KL05'),
    ('SV12', N'Đào Duy An', '1996-12-01', 1, '06DHTH02', 2.5, N'Khóa luận', 'KL06'),
    ('SV13', N'Trịnh Hồng Gấm', '1996-01-02', 0, '06DHTH04', 2.3, N'Đồ án', 'DA02'),
    ('SV14', N'Bùi Anh Kiệt', '1996-02-02', 1, '06DHTH04', 3.2, N'Khóa luận', 'KL01'),
    ('SV15', N'Thái Thị Oanh', '1996-03-02', 0, '06DHTH03', 2.1, N'Đồ án', 'DA02'),
    ('SV16', N'Hà Khắc Huy', '1996-04-02', 1, '06DHTH02', 2.2, N'Đồ án', 'DA05'),
    ('SV17', N'Nguyễn Tri Phong', '1996-05-02', 1, '06DHTH02', 2.8, N'Khóa luận', 'KL04'),
    ('SV18', N'Lâm Thị Thanh Tuyền', '1996-06-02', 0, '06DHTH01', 2.3, N'Đồ án', 'DA07');
------------------------------------------------------------------------------|
--=============1.6. Viết câu lệnh thực hiện truy vấn dữ liệu==================|
------------------------------------------------------------------------------|

-- a. Tổng số sinh viên đăng ký đề tài thuộc loại đồ án tốt nghiệp
SELECT COUNT(*) AS TongSVDoAn
FROM SINHVIEN SV
JOIN DETAI DT ON SV.MADT = DT.MADT
WHERE DT.MALOAI = 'DA';

-- b. Danh sách sinh viên thuộc diện làm Khoá luận lớp 06DHTH1
SELECT SV.MASV, SV.HOTENSV
FROM SINHVIEN SV
JOIN LOP L ON SV.MALOP = L.MALOP
WHERE L.TENLOP = N'Đại học khóa 6 lớp 1' AND SV.DIENLAMDETAI = N'Khóa luận';

-- c. Thông tin sinh viên làm đồ án có điểm trung bình cao nhất
SELECT TOP 1 SV.MASV, SV.HOTENSV, SV.DIEMTB, SV.DIENLAMDETAI
FROM SINHVIEN SV
WHERE SV.DIENLAMDETAI = N'Đồ án'
ORDER BY SV.DIEMTB DESC;

-- d. Thông tin sinh viên đã đăng ký đề tài 'Quản lý bãi giữ xe'
SELECT SV.MASV, SV.HOTENSV, SV.DIEMTB, DT.TENDT
FROM SINHVIEN SV
JOIN DETAI DT ON SV.MADT = DT.MADT
WHERE DT.TENDT = N'Quản lí bãi giữ xe';

-- e. Đề tài thuộc loại đồ án mà sinh viên chưa đăng ký
SELECT DT.MADT, DT.TENDT
FROM DETAI DT
WHERE DT.MALOAI = 'DA'
    AND DT.MADT NOT IN (SELECT MADT FROM SINHVIEN WHERE MADT IS NOT NULL);

-- f. Tạo bảng ảo (View) thông tin sinh viên có điểm từ 2.7 đến 2.8
CREATE VIEW SINHVIEN_VIEW AS
SELECT MASV, HOTENSV, DIEMTB, DIENLAMDETAI
FROM SINHVIEN
WHERE DIEMTB BETWEEN 2.7 AND 2.8;

SELECT * FROM SINHVIEN_VIEW;

-- g. Lớp nào có số sinh viên đăng ký đề tài từ 5 sinh viên trở lên
SELECT LOP.TENLOP, COUNT(SINHVIEN.MASV) AS SoLuongSV
FROM LOP
JOIN SINHVIEN ON LOP.MALOP = SINHVIEN.MALOP
GROUP BY LOP.TENLOP
HAVING COUNT(SINHVIEN.MASV) >= 5;

-- h. Danh sách đề tài không có sinh viên lớp '06DHTH2' đăng ký
SELECT DT.MADT, DT.TENDT
FROM DETAI DT
WHERE NOT EXISTS (
    SELECT 1
    FROM SINHVIEN SV
    WHERE SV.MADT = DT.MADT AND SV.MALOP = '06DHTH2'
);

-- i. Thông tin sinh viên của lớp "Đại học khóa 6 lớp 2" sinh trong tháng 5
SELECT SV.MASV, SV.HOTENSV, SV.NGAYSINH, LOP.TENLOP
FROM SINHVIEN SV
JOIN LOP ON SV.MALOP = LOP.MALOP
WHERE LOP.TENLOP = N'Đại học khóa 6 lớp 2' AND MONTH(SV.NGAYSINH) = 5;

-- j. Thông tin MASV, HOTENSV, DIEMTB của 2 sinh viên có mức điểm cao nhất
SELECT TOP 2 MASV, HOTENSV, DIEMTB
FROM SINHVIEN
ORDER BY DIEMTB DESC;

-- k. Số lượng sinh viên đăng ký từng loại đề tài
SELECT MALOAI, COUNT(MADT) AS SoLuongSV
FROM DETAI
GROUP BY MALOAI;

-- l. Số lượng sinh viên đăng ký đề tài đồ án, khóa luận thuộc mỗi lớp, sắp xếp số lượng sinh viên tăng dần
SELECT LOP.MALOP, LOP.TENLOP, LOAI.MALOAI, LOAI.TENLOAI, COUNT(SINHVIEN.MASV) AS SoLuongSV
FROM LOP
JOIN SINHVIEN ON LOP.MALOP = SINHVIEN.MALOP
JOIN DETAI ON SINHVIEN.MADT = DETAI.MADT
JOIN LOAIDETAI LOAI ON DETAI.MALOAI = LOAI.MALOAI
GROUP BY LOP.MALOP, LOP.TENLOP, LOAI.MALOAI, LOAI.TENLOAI
ORDER BY SoLuongSV ASC;
------------------------------------------------------------------------------|
--========2.1. Khai báo biến cấu trúc điều khiển và các hàm thông dụng========|
------------------------------------------------------------------------------|

-- a. Khai báo 4 biến để lưu trữ mã đề tài, tên đề tài, số sinh viên tối đa, số sinh viên đăng ký.
DECLARE @madt VARCHAR(10), @tendt NVARCHAR(50), @sosv_toida INT, @sosv_dk INT;

-- b. Dùng lệnh set để gán tên đề tài, số sinh viên tối đa, số sinh viên đăng ký, có mã là “DA01” vào 3 biến @tendt, @sosv_toida, @sosv_dk.
SET @madt = 'DA01';

-- Lấy thông tin từ bảng DETAI dựa trên mã đề tài "DA01"
SET @tendt = (SELECT TENDT FROM DETAI WHERE MADT = @madt);
SET @sosv_toida = (SELECT SOSV_TOIDA FROM DETAI WHERE MADT = @madt);
SET @sosv_dk = (SELECT SOSV_DANGKY FROM DETAI WHERE MADT = @madt);

-- c. Dùng lệnh select để gán tên đề tài, số sinh viên tối đa, số sinh viên đăng ký, có mã là “DA01” vào 3 biến @tendt, @sosv_toida, @sosv_dk.
SELECT @tendt = TENDT, @sosv_toida = SOSV_TOIDA, @sosv_dk = SOSV_DANGKY FROM DETAI WHERE MADT = 'DA01';

-- Hiển thị giá trị của biến sau khi gán
SELECT @tendt AS TENDT, @sosv_toida AS SOSV_TOIDA, @sosv_dk AS SOSV_DANGKY;
-- d. Dùng lệnh print để in ra giá trị của các biến vừa gán.
PRINT 'Values of the variables:';
PRINT 'MADT: ' + @madt;
PRINT 'TENDT: ' + @tendt;
PRINT 'SOSV_TOIDA: ' + CAST(@sosv_toida AS VARCHAR(10));
PRINT 'SOSV_DANGKY: ' + CAST(@sosv_dk AS VARCHAR(10));

-- e. Dùng lệnh select để in ra các giá trị của các biến vừa gán.
SELECT 
    'MADT: ' + @madt AS MADT, 
    'TENDT: ' + @tendt AS TENDT, 
    'SOSV_TOIDA: ' + CAST(@sosv_toida AS VARCHAR(10)) AS SOSV_TOIDA, 
    'SOSV_DANGKY: ' + CAST(@sosv_dk AS VARCHAR(10)) AS SOSV_DANGKY;

-- f. Khai báo biến @sosv_chuadk và gán giá trị cho biến
DECLARE @sosv_chuadk INT;
SET @sosv_chuadk = @sosv_toida - @sosv_dk;

-- In ra giá trị biến @sosv_chuadk
PRINT N'SOSV_CHUADK: ' + CAST(@sosv_chuadk AS VARCHAR(10));

-- g. Sử dụng cấu trúc if…else kiểm tra giá trị của biến @sosv_chuadk
IF @sosv_chuadk > 0
    PRINT N'Đề tài còn số lượng cho sinh viên đăng ký';
ELSE IF @sosv_chuadk = 0
    PRINT N'Đề tài không còn số lượng cho sinh viên đăng ký';
ELSE
    PRINT N'Đề tài đã quá số lượng sinh viên đăng ký';

-- h. Sử dụng cấu trúc Case Case….When… kiểm tra thông tin đăng ký đề tài
SELECT 
    MADT,
    TENDT,
    SOSV_TOIDA,
    SOSV_DANGKY,
    CASE 
        WHEN SOSV_TOIDA > SOSV_DANGKY THEN N'Đề tài chưa đăng ký đủ số lượng'
        WHEN SOSV_TOIDA = SOSV_DANGKY THEN N'Đề tài đã đăng ký đủ số lượng'
        WHEN SOSV_DANGKY > SOSV_TOIDA THEN N'Đề tài đã đăng ký vượt quá số lượng qui định'
    END AS KET_QUA_DANG_KY
FROM DETAI
WHERE MADT = @madt;
------------------------------------------------------------------------------|
--======================2.2. Viết thủ tục thường trú==========================|
------------------------------------------------------------------------------|

-- a. Thủ tục thêm sinh viên
CREATE PROCEDURE ThemSinhVien
    @masv VARCHAR(10),
    @hotensv NVARCHAR(50),
    @ngaysinh DATE,
    @phai BIT,
    @malop VARCHAR(10),
    @diemtb FLOAT,
    @dienlamdetai NVARCHAR(50),
    @madt VARCHAR(10)
AS
BEGIN
    INSERT INTO SINHVIEN (MASV, HOTENSV, NGAYSINH, PHAI, MALOP, DIEMTB, DIENLAMDETAI, MADT)
    VALUES (@masv, @hotensv, @ngaysinh, @phai, @malop, @diemtb, @dienlamdetai, @madt);
END;
GO

-- b. Thủ tục cập nhật diện làm đề tài
CREATE PROCEDURE CapNhatDienLamDeTai
    @masv VARCHAR(10)
AS
BEGIN
    UPDATE SINHVIEN
    SET DIENLAMDETAI = CASE
                        WHEN DIEMTB < 2.5 THEN 'Đồ án'
                        WHEN DIEMTB >= 2.5 AND MASV = @masv THEN 'Khoá luận'
                        ELSE DIENLAMDETAI
                      END
    WHERE MASV = @masv;
END;
GO

-- c. Thủ tục cập nhật số sinh viên đăng ký
CREATE PROCEDURE CapNhatSoSVDangKy
AS
BEGIN
    UPDATE DETAI
    SET SOSV_DANGKY = (SELECT COUNT(*) FROM SINHVIEN WHERE SINHVIEN.MADT = DETAI.MADT);
END;
GO

-- d. Thủ tục cập nhật số sinh viên thực hiện đồ án và khoá luận
CREATE PROCEDURE CapNhatSinhVienDoAnKhoaLuan
AS
BEGIN
    UPDATE LOP
    SET
        SOSV_DOAN = (SELECT COUNT(*) FROM SINHVIEN WHERE LOP.MALOP = SINHVIEN.MALOP AND SINHVIEN.DIENLAMDETAI = 'Đồ án'),
        SOSV_KHOALUAN = (SELECT COUNT(*) FROM SINHVIEN WHERE LOP.MALOP = SINHVIEN.MALOP AND SINHVIEN.DIENLAMDETAI = 'Khoá luận');
END;
GO

-- e. Thủ tục trả về thông tin sinh viên, lớp, đề tài
CREATE PROCEDURE LayThongTinSinhVienLopDeTai
    @masv VARCHAR(10)
AS
BEGIN
    SELECT SINHVIEN.HOTENSV, LOP.TENLOP, DETAI.TENDT
    FROM SINHVIEN
    INNER JOIN LOP ON SINHVIEN.MALOP = LOP.MALOP
    INNER JOIN DETAI ON SINHVIEN.MADT = DETAI.MADT
    WHERE SINHVIEN.MASV = @masv;
END;
GO

-- f. Thủ tục in ra danh sách sinh viên thuộc diện làm khoá luận
CREATE PROCEDURE DanhSachSinhVienKhoaLuan
    @malop VARCHAR(10)
AS
BEGIN
    SELECT MASV, HOTENSV, NGAYSINH, DIEMTB
    FROM SINHVIEN
    WHERE MALOP = @malop AND DIENLAMDETAI = 'Khoá luận';
END;
GO

-- g. Thủ tục in ra số lượng sinh viên tối đa, đã đăng ký và chưa đăng ký của một đề tài
CREATE PROCEDURE ThongTinDangKyDeTai
    @madt VARCHAR(10)
AS
BEGIN
    SELECT
        SOSV_TOIDA,
        SOSV_DANGKY,
        SOSV_TOIDA - SOSV_DANGKY AS SOSV_CHUADK
    FROM DETAI
    WHERE MADT = @madt;
END;
GO
SELECT * FROM DETAI
SELECT * FROM SINHVIEN
---Thực thi
-- a. Thực thi thủ tục thêm sinh viên
EXECUTE ThemSinhVien 'SV20', N'Phạm Hồ Đăng Huy', '2003-10-14', 1, '06DHTH01', 3.0, N'Chưa xác định', 'KL01';

-- b. Thực thi thủ tục cập nhật diện làm đề tài
EXECUTE CapNhatDienLamDeTai 'SV20';

-- c. Thực thi thủ tục cập nhật số sinh viên đăng ký
EXECUTE CapNhatSoSVDangKy;

-- d. Thực thi thủ tục cập nhật số sinh viên thực hiện đồ án và khoá luận
EXECUTE CapNhatSinhVienDoAnKhoaLuan;

-- e. Thực thi thủ tục trả về thông tin sinh viên, lớp, đề tài
EXECUTE LayThongTinSinhVienLopDeTai 'SV20';

-- f. Thực thi thủ tục in ra danh sách sinh viên thuộc diện làm khoá luận
EXECUTE DanhSachSinhVienKhoaLuan '06DHTH01';

-- g. Thực thi thủ tục in ra số lượng sinh viên tối đa, đã đăng ký và chưa đăng ký của một đề tài
EXECUTE ThongTinDangKyDeTai 'DA01';


------------------------------------------------
CREATE FUNCTION ThucHienCacThuTuc
(
    @masv VARCHAR(10),
    @malop VARCHAR(10),
    @madt VARCHAR(10)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @result NVARCHAR(MAX);

    -- Gọi thủ tục thêm sinh viên
    EXEC ThemSinhVien @masv, N'Phạm Hồ Đăng Huy', '2003-10-14', 1, @malop, 0.0, N'Chưa xác định', @madt;

    -- Gọi thủ tục cập nhật diện làm đề tài
    EXEC CapNhatDienLamDeTai @masv;

    -- Gọi thủ tục cập nhật số sinh viên đăng ký
    EXEC CapNhatSoSVDangKy;

    -- Gọi thủ tục cập nhật số sinh viên thực hiện đồ án và khoá luận
    EXEC CapNhatSinhVienDoAnKhoaLuan;

    -- Gọi thủ tục trả về thông tin sinh viên, lớp, đề tài
    SET @result = (SELECT * FROM dbo.LayThongTinSinhVienLopDeTai(@masv));

    -- Gọi thủ tục in ra danh sách sinh viên thuộc diện làm khoá luận
    SET @result = @result + (SELECT * FROM dbo.DanhSachSinhVienKhoaLuan(@malop));

    -- Gọi thủ tục in ra số lượng sinh viên tối đa, đã đăng ký và chưa đăng ký của một đề tài
    SET @result = @result + (SELECT * FROM dbo.ThongTinDangKyDeTai(@madt));

    RETURN @result;
END;
GO
-----------------------------------------------------------------------------------------------------
----------------------------------FUNCTION--------------------------------------------------------
-- a. Hàm thống kê số lượng sinh viên lớp 06DHTH2 chưa đăng ký đề tài
CREATE FUNCTION SoLuongSinhVienChuaDangKyDeTai
(
    @malop VARCHAR(10)
)
RETURNS INT
AS
BEGIN
    DECLARE @sosv_chuadk INT;
    SELECT @sosv_chuadk = SISO - (SOSV_DOAN + SOSV_KHOALUAN)
    FROM LOP
    WHERE MALOP = @malop;
    RETURN @sosv_chuadk;
END;

-- Thực hiện hàm
SELECT dbo.SoLuongSinhVienChuaDangKyDeTai('06DHTH02') AS 'SoLuongSinhVienChuaDangKyDeTai';

-- b. Hàm thống kê số lượng sinh viên đăng ký loại đề tài khi truyền vào mã loại đề tài (MALOAI)
CREATE FUNCTION SoLuongSinhVienDangKyTheoLoaiDeTai
(
    @maloai VARCHAR(10)
)
RETURNS INT
AS
BEGIN
    DECLARE @sosv_dk INT;
    SELECT @sosv_dk = COUNT(*)
    FROM SINHVIEN
    WHERE MADT IN (SELECT MADT FROM DETAI WHERE MALOAI = @maloai);
    RETURN @sosv_dk;
END;

-- Thực hiện hàm
SELECT dbo.SoLuongSinhVienDangKyTheoLoaiDeTai('DA') AS 'SoLuongSinhVienDangKyDeTaiDA';

-- c. Hàm xem danh sách sinh viên lớp 06DHTH1 thuộc diện làm khoá luận
CREATE FUNCTION DanhSachSinhVienKhoaLuanLop
(
    @malop VARCHAR(10)
)
RETURNS TABLE
AS
RETURN
(
    SELECT MASV, HOTENSV, NGAYSINH, DIEMTB
    FROM SINHVIEN
    WHERE MALOP = @malop AND DIENLAMDETAI = N'Khoá luận'
);

-- Thực hiện hàm
SELECT * FROM dbo.DanhSachSinhVienKhoaLuanLop('06DHTH01');

-- d. Hàm xem danh sách sinh viên đăng ký đề tài “Quản lý shop thời trang”
CREATE FUNCTION DanhSachSinhVienTheoDeTai
(
    @tendt NVARCHAR(50)
)
RETURNS TABLE
AS
RETURN
(
    SELECT MASV, HOTENSV, NGAYSINH, DIEMTB, DIENLAMDETAI, MADT
    FROM SINHVIEN
    WHERE MADT = (SELECT MADT FROM DETAI WHERE TENDT = @tendt)
);

-- Thực hiện hàm
SELECT * FROM dbo.DanhSachSinhVienTheoDeTai(N'Quản lí shop thời trang');

-- e. Hàm truyền vào tham số tên loại đề tài (TENLOAI) trả về danh sách các đề tài trong loại đề tài đó mà sinh viên chưa đăng ký
CREATE FUNCTION DanhSachDeTaiChuaDangKy
(
    @tenloai NVARCHAR(50)
)
RETURNS TABLE
AS
RETURN
(
    SELECT D.*
    FROM DETAI D
    WHERE D.MALOAI = (SELECT MALOAI FROM LOAIDETAI WHERE TENLOAI = @tenloai)
      AND D.MADT NOT IN (SELECT MADT FROM SINHVIEN)
);

-- Thực hiện hàm
SELECT * FROM dbo.DanhSachDeTaiChuaDangKy(N'Đồ án tốt nghiệp');

-- f. Lệnh thực hiện thêm dữ liệu và liệt kê danh sách sinh viên đăng ký đề tài không đúng loại
INSERT INTO SINHVIEN (MASV, HOTENSV, NGAYSINH, PHAI, MALOP, DIEMTB, DIENLAMDETAI, MADT)
VALUES
    ('SV101', N'Tên Sinh Viên 1', '2000-01-01', 1, '06DHTH1', 3.2, N'Khoá luận', 'KL01'),
    ('SV102', N'Tên Sinh Viên 2', '2000-02-01', 0, '06DHTH2', 3.8, N'Đồ án', 'DA02'),
    ('SV103', N'Tên Sinh Viên 3', '2000-03-01', 1, '06DHTH1', 2.5, N'Khoá luận', 'KL03');
-- Tạo function
CREATE FUNCTION DanhSachSinhVienTheoDeTai
(
    @tenLoaiDeTai NVARCHAR(50)
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        SV.MASV,
        SV.HOTENSV,
        SV.NGAYSINH,
        SV.DIEMTB,
        SV.DIENLAMDETAI,
        SV.MADT
    FROM
        SINHVIEN SV
    JOIN
        DETAI DT ON SV.MADT = DT.MADT
    JOIN
        LOAIDETAI LD ON DT.MALOAI = LD.MALOAI
    WHERE
        SV.DIENLAMDETAI = N'Khoá luận'
        AND LD.TENLOAI <> @tenLoaiDeTai
);

-- Sử dụng function
SELECT * FROM DanhSachSinhVienTheoDeTai(N'Quản lí shop thời trang');
------------------------------------------------------------------------------|
--============================TRIGGER=========================================|
------------------------------------------------------------------------------|
-- Trigger a: Kiểm tra số sinh viên đăng ký của mỗi đề tài
CREATE TRIGGER Trigger_KiemTraSoSVDangKy
ON DETAI
AFTER INSERT
AS
BEGIN
    IF (SELECT COUNT(*) FROM INSERTED WHERE SOSV_DANGKY > SOSV_TOIDA) > 0
    BEGIN
        PRINT N'Số sinh viên đăng ký vượt quá số lượng tối đa thực hiện đề tài.';
        ROLLBACK;
    END
    ELSE
    BEGIN
        -- Lệnh cập nhật dữ liệu thỏa mãn ràng buộc
        UPDATE DETAI
        SET SOSV_DANGKY = (SELECT COUNT(*) FROM SINHVIEN WHERE SINHVIEN.MADT = DETAI.MADT);
    END
END;

-- Trigger b: Cập nhật số sinh viên đăng ký trên bảng DETAI
CREATE TRIGGER Trigger_CapNhatSoSVDangKy
ON SINHVIEN
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    -- Lệnh cập nhật dữ liệu thỏa mãn ràng buộc
    UPDATE DETAI
    SET SOSV_DANGKY = (SELECT COUNT(*) FROM SINHVIEN WHERE SINHVIEN.MADT = DETAI.MADT);
END;

-- Trigger c: Kiểm tra khi thêm lớp mới
CREATE TRIGGER Trigger_KiemTraThemLopMoi
ON LOP
AFTER INSERT
AS
BEGIN
    IF (SELECT SISO FROM INSERTED) < (SELECT SOSV_DOAN + SOSV_KHOALUAN FROM LOP WHERE MALOP = (SELECT MALOP FROM INSERTED))
    BEGIN
        PRINT N'Số sinh viên thực hiện không lớn hơn sĩ số lớp.';
        ROLLBACK;
    END
    ELSE
    BEGIN
        -- Lệnh cập nhật dữ liệu thỏa mãn ràng buộc
        UPDATE LOP
        SET
            SOSV_DOAN = (SELECT COUNT(*) FROM SINHVIEN WHERE LOP.MALOP = SINHVIEN.MALOP AND SINHVIEN.DIENLAMDETAI = 'Đồ án'),
            SOSV_KHOALUAN = (SELECT COUNT(*) FROM SINHVIEN WHERE LOP.MALOP = SINHVIEN.MALOP AND SINHVIEN.DIENLAMDETAI = 'Khoá luận');
    END
END;

-- Trigger d: Kiểm tra khi thêm sinh viên
CREATE TRIGGER Trigger_KiemTraThemSinhVien
ON SINHVIEN
AFTER INSERT
AS
BEGIN
    IF (SELECT SOSV_DANGKY FROM DETAI WHERE MADT = (SELECT MADT FROM INSERTED)) >= (SELECT SOSV_TOIDA FROM DETAI WHERE MADT = (SELECT MADT FROM INSERTED))
    BEGIN
        PRINT N'Số lượng sinh viên thực hiện đề tài đã đủ.';
        ROLLBACK;
    END
    ELSE
    BEGIN
        -- Lệnh cập nhật dữ liệu thỏa mãn ràng buộc
        UPDATE DETAI
        SET SOSV_DANGKY = (SELECT COUNT(*) FROM SINHVIEN WHERE SINHVIEN.MADT = DETAI.MADT);
    END
END;


------------------------------------------------------------------------------|
--============================CURSOR==========================================|
------------------------------------------------------------------------------|
-- a. Sử dụng cursor cập nhật lại mã sinh viên (MASV) = mã lớp (MALOP) + mã sinh viên hiện tại (MASV)
DECLARE @masv VARCHAR(20), @malop VARCHAR(10), @new_masv VARCHAR(30);

DECLARE cursor_update_masv CURSOR FOR
SELECT MASV, MALOP
FROM SINHVIEN;

OPEN cursor_update_masv;

FETCH NEXT FROM cursor_update_masv INTO @masv, @malop;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @new_masv = @malop + @masv;

    UPDATE SINHVIEN
    SET MASV = @new_masv
    WHERE CURRENT OF cursor_update_masv;

    FETCH NEXT FROM cursor_update_masv INTO @masv, @malop;
END

CLOSE cursor_update_masv;
DEALLOCATE cursor_update_masv;

-- b. Sử dụng cursor cập nhật lại tên lớp (TENLOP) = “Lớp cập bổ sung” tại dòng thứ 2 của bảng LOP
DECLARE @tenlop NVARCHAR(50), @new_tenlop NVARCHAR(50);
DECLARE @counter INT = 1;

DECLARE cursor_update_tenlop CURSOR FOR
SELECT TENLOP
FROM LOP;

OPEN cursor_update_tenlop;

FETCH NEXT FROM cursor_update_tenlop INTO @tenlop;

WHILE @@FETCH_STATUS = 0
BEGIN
    IF @counter = 2
    BEGIN
        SET @new_tenlop = N'Lớp cập bổ sung';

        UPDATE LOP
        SET TENLOP = @new_tenlop
        WHERE CURRENT OF cursor_update_tenlop;

        BREAK; -- Kết thúc vòng lặp sau khi cập nhật dòng thứ 2

    END

    SET @counter = @counter + 1;

    FETCH NEXT FROM cursor_update_tenlop INTO @tenlop;
END

CLOSE cursor_update_tenlop;
DEALLOCATE cursor_update_tenlop;
-- c. Sử dụng cursor in ra danh sách các đề tài (MADT, TENDT, SOSV_DANGKY, SOSV_TOIDA)
DECLARE @madt_cursor VARCHAR(10), @tendt_cursor NVARCHAR(50), @sosv_dangky_cursor INT, @sosv_toida_cursor INT;

DECLARE cursor_danhsachdetai CURSOR FOR
SELECT MADT, TENDT, SOSV_DANGKY, SOSV_TOIDA
FROM DETAI;

OPEN cursor_danhsachdetai;

FETCH NEXT FROM cursor_danhsachdetai INTO @madt_cursor, @tendt_cursor, @sosv_dangky_cursor, @sosv_toida_cursor;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'MADT: ' + @madt_cursor + ', TENDT: ' + @tendt_cursor + ', SOSV_DANGKY: ' + CAST(@sosv_dangky_cursor AS VARCHAR(10)) + ', SOSV_TOIDA: ' + CAST(@sosv_toida_cursor AS VARCHAR(10));

    FETCH NEXT FROM cursor_danhsachdetai INTO @madt_cursor, @tendt_cursor, @sosv_dangky_cursor, @sosv_toida_cursor;
END

CLOSE cursor_danhsachdetai;
DEALLOCATE cursor_danhsachdetai;

-- d. Tạo file dạng excel có cấu trúc giống bảng SINHVIEN và thêm dữ liệu
-- Đầu tiên, thêm dữ liệu vào bảng SINHVIEN
INSERT INTO SINHVIEN (MASV, HOTENSV, NGAYSINH, PHAI, MALOP, DIEMTB, DIENLAMDETAI, MADT)
VALUES
('SV21', N'Nguyen Van A', '1990-01-01', 1, '06DHTH01', 2.8, N'Khoá luận', 'DA03'),
('SV22', N'Tran Thi B', '1991-02-02', 0, '06DHTH02', 2.2, N'Đồ án', 'DA03'),
('SV23', N'Le Van C', '1992-03-03', 1, '06DHTH03', 3.5, N'Khoá luận', 'DA01');
-- Sau đó, xuất dữ liệu ra file Excel
EXEC xp_cmdshell 'bcp "SELECT * FROM SINHVIEN" queryout "D:\DATABASE\BUOI2\SinhVien.xlsx" -c -t, -T -S ZOHANUBIS';

-- e. Sử dụng cursor thực hiện cập nhật diện làm đề tài
DECLARE @masv_update_dienlam NVARCHAR(10), @diemtb_update_dienlam FLOAT, @dienlamdetai_update NVARCHAR(50);

DECLARE cursor_update_dienlam CURSOR FOR
SELECT MASV, DIEMTB
FROM SINHVIEN;

OPEN cursor_update_dienlam;

FETCH NEXT FROM cursor_update_dienlam INTO @masv_update_dienlam, @diemtb_update_dienlam;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @dienlamdetai_update = CASE
                                    WHEN @diemtb_update_dienlam >= 2.5 THEN N'Khoá luận'
                                    ELSE N'Đồ án'
                                END;

    UPDATE SINHVIEN
    SET DIENLAMDETAI = @dienlamdetai_update
    WHERE MASV = @masv_update_dienlam;

    FETCH NEXT FROM cursor_update_dienlam INTO @masv_update_dienlam, @diemtb_update_dienlam;
END

CLOSE cursor_update_dienlam;
DEALLOCATE cursor_update_dienlam;
--f. Sử dụng cursor kết hợp viết thủ tục cập nhật sĩ số sinh viên của các lớp (số lượng sinh viên dựa trên bảng SINHVIEN):
DECLARE @malop VARCHAR(10);
DECLARE @siso INT;

DECLARE lop_cursor CURSOR FOR
    SELECT MALOP, COUNT(MASV) AS SISO
    FROM SINHVIEN
    GROUP BY MALOP;

OPEN lop_cursor;

FETCH NEXT FROM lop_cursor INTO @malop, @siso;

WHILE @@FETCH_STATUS = 0
BEGIN
    UPDATE LOP
    SET SISO = @siso
    WHERE MALOP = @malop;

    FETCH NEXT FROM lop_cursor INTO @malop, @siso;
END

CLOSE lop_cursor;
DEALLOCATE lop_cursor;

--g. Sử dụng cursor kết hợp viết thủ tục cập nhật sĩ số cộng thêm 1 cho lớp đứng đầu danh sách:
DECLARE @malop VARCHAR(10);

DECLARE top_lop_cursor CURSOR FOR
    SELECT TOP 1 MALOP
    FROM LOP
    ORDER BY SISO DESC;

OPEN top_lop_cursor;

FETCH NEXT FROM top_lop_cursor INTO @malop;

IF @@FETCH_STATUS = 0
BEGIN
    UPDATE LOP
    SET SISO = SISO + 1
    WHERE MALOP = @malop;
END

CLOSE top_lop_cursor;
DEALLOCATE top_lop_cursor;
