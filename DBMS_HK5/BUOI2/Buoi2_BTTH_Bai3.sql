-- Tạo cơ sở dữ liệu QLSV
CREATE DATABASE Buoi2_BTTH_Bai3;
USE Buoi2_BTTH_Bai3;

CREATE TABLE LOP (
    MALOP VARCHAR(10) PRIMARY KEY,
    TENLOP NVARCHAR(50),
    SISO INT
);

CREATE TABLE SINHVIEN (
    MASV VARCHAR(10) PRIMARY KEY,
    HOTEN NVARCHAR(50),
    NGSINH DATE,
    GIOITINH NVARCHAR(5),
    QUEQUAN NVARCHAR(50),
    MALOP VARCHAR(10) FOREIGN KEY REFERENCES LOP(MALOP),
    DIEMTB DECIMAL(5, 2),
    XEPLOAI NVARCHAR(10)
);

CREATE TABLE MONHOC (
    MAMH VARCHAR(10) PRIMARY KEY,
    TENMH NVARCHAR(50),
    SOTC INT,
    BATBUOC NVARCHAR(5)
);

CREATE TABLE KETQUA (
    MASV VARCHAR(10) FOREIGN KEY REFERENCES SINHVIEN(MASV),
    MAMH VARCHAR(10) FOREIGN KEY REFERENCES MONHOC(MAMH),
    HOCKY INT,
    DIEMTHI DECIMAL(5, 2)
);

---Nhập liệu---
INSERT INTO LOP (MALOP, TENLOP, SISO)
VALUES
    ('12DHTH10', N'Lớp 12DHTH10', 30),
    ('12DHTH11', N'Lớp 12DHTH11', 28),
    ('12DHTH12', N'Lớp 12DHTH12', 25);

INSERT INTO SINHVIEN (MASV, HOTEN, NGSINH, GIOITINH, QUEQUAN, MALOP, DIEMTB, XEPLOAI)
VALUES
    ('SV101', N'Lê Quang Thành', '2000-01-15', N'Nam', N'HCM', '12DHTH10', 8.5, N'Giỏi'),
    ('SV102', N'Nguyễn Thị Ngọc', '2001-03-20', N'Nữ', N'HCM', '12DHTH10', 7.8, N'Khá'),
    ('SV103', N'Lý Anh Xuân', '1999-05-10', N'Nam', N'Bình Dương', '12DHTH10', 9.0, N'Giỏi'),
    ('SV104', N'Trần Bảo Cẩm', '2000-07-18', N'Nữ', N'Cần Thơ', '12DHTH10', 8.2, N'Khá'),
    ('SV105', N'Lâm Thị Kim', '2002-02-25', N'Nam', N'Đà Nẵng', '12DHTH10', 9.1, N'Giỏi'),
    ('SV106', N'Hồ Thái Hồng', '1998-11-08', N'Nam', N'Hà Nội', '12DHTH10', 8.7, N'Khá'),
    ('SV107', N'Nguyễn Thị Bảo', '1999-08-12', N'Nữ', N'Tây Ninh', '12DHTH10', 8.0, N'Trung Bình'),
    ('SV108', N'Trần Quang Sơn', '2000-04-02', N'Nam', N'Vũng Tàu', '12DHTH10', 9.2, N'Giỏi'),
    ('SV109', N'Lai Thị Mai', '2001-06-19', N'Nữ', N'Bình Dương', '12DHTH10', 8.5, N'Khá'),
    ('SV110', N'Huỳnh Thị Thắm', '2002-07-21', N'Nữ', N'HCM', '12DHTH10', 8.4, N'Khá');

INSERT INTO SINHVIEN (MASV, HOTEN, NGSINH, GIOITINH, QUEQUAN, MALOP, DIEMTB, XEPLOAI)
VALUES
('SV111', N'Lê Thị Hà', '1999-03-08', N'Nữ', N'TP.HCM', '12DHTH11', 8.0, N'Giỏi'),
('SV112', N'Nguyễn Thành Danh', '2001-05-13', N'Nam', N'Tiền Giang', '12DHTH11', 8.5, N'Giỏi'),
('SV113', N'Lý Thị Thắng', '1999-07-25', N'Nam', N'Hà Nội', '12DHTH11', 7.5, N'Khá'),
('SV114', N'Trần Xuân Kỳ', '2000-10-10', N'Nam', N'Vĩnh Long', '12DHTH11', 9.0, N'Giỏi'),
('SV115', N'Lâm Quang Thành', '2002-01-15', N'Nam', N'Đồng Nai', '12DHTH11', 6.5, N'Khá'),
('SV116', N'Hồ Thị Tâm', '1998-12-18', N'Nữ', N'Bình Dương', '12DHTH11', 7.0, N'Khá'),
('SV117', N'Lai Quang Phụng', '1999-09-02', N'Nam', N'Cà Mau', '12DHTH11', 6.0, N'Trung Bình'),
('SV118', N'Huỳnh Thị Thảo', '2001-04-09', N'Nữ', N'Long An', '12DHTH11', 8.0, N'Giỏi'),
('SV119', N'La Văn Khánh', '2002-08-20', N'Nam', N'Hồ Chí Minh', '12DHTH11', 9.5, N'Giỏi'),
('SV120', N'Lê Văn Trung', '2002-06-15', N'Nam', N'Tây Ninh', '12DHTH11', 6.5, N'Khá');

INSERT INTO SINHVIEN (MASV, HOTEN, NGSINH, GIOITINH, QUEQUAN, MALOP, DIEMTB, XEPLOAI)
VALUES
('SV121', N'Lê Quang Sơn', '2000-02-18', N'Nam', N'Vĩnh Long', '12DHTH12', 8.0, N'Giỏi'),
('SV122', N'Nguyễn Thị Mai', '2001-03-20', N'Nữ', N'Tiền Giang', '12DHTH12', 7.5, N'Khá'),
('SV123', N'Lý Thị Hồng', '1999-05-10', N'Nữ', N'Hà Nội', '12DHTH12', 8.5, N'Giỏi'),
('SV124', N'Trần Thanh Bảo', '2000-07-18', N'Nữ', N'Đồng Nai', '12DHTH12', 6.0, N'Khá'),
('SV125', N'Lâm Thị Ngọc', '2002-01-25', N'Nữ', N'Bình Dương', '12DHTH12', 9.0, N'Giỏi'),
('SV126', N'Hồ Thành Kim', '1998-11-08', N'Nam', N'Cà Mau', '12DHTH12', 7.0, N'Khá'),
('SV127', N'Lai Thị Thảo', '1999-08-12', N'Nữ', N'Long An', '12DHTH12', 8.0, N'Giỏi'),
('SV128', N'Huỳnh Quang Danh', '2000-04-02', N'Nam', N'Hồ Chí Minh', '12DHTH12', 6.5, N'Khá'),
('SV129', N'La Thị Sương', '2001-06-19', N'Nữ', N'Tây Ninh', '12DHTH12', 9.5, N'Giỏi'),
('SV130', N'Lê Văn Tuấn', '2002-07-21', N'Nam', N'Vĩnh Long', '12DHTH12', 7.0, N'Khá');

INSERT INTO MONHOC (MAMH, TENMH, SOTC, BATBUOC)
VALUES
    ('LT001', N'Cấu trúc dữ liệu và giải thuật', 4, N'Y'),
    ('LT002', N'Cơ sở dữ liệu', 4, N'Y'),
    ('LT003', N'Cấu trúc rời rạc', 3, N'Y'),
    ('LT004', N'Kỹ thuật lập trình', 3, N'Y'),
    ('LT005', N'Hệ điều hành', 4, N'Y'),
    ('LT006', N'Lập trình hướng đối tượng', 4, N'Y'),
    ('LT007', N'Công nghệ .NET', 3, N'Y'),
    ('EL001', N'Nói 1', 2, 'N'),
    ('EL002', N'Nói 2', 2, 'N'),
    ('EL003', N'Nói 3', 2, 'N'),
    ('EL004', N'Nói 4', 2,' N'),
    ('EL005', N'Đọc 1', 2, 'N'),
    ('EL006', N'Đọc 2', 2, 'N'),
    ('EL007', N'Đọc 3', 2, 'N'),
    ('EL008', N'Đọc 4', 2, 'N'),
    ('EL009', N'Nghe 1', 2, 'N'),
    ('EL010', N'Nghe 2', 2, 'N'),
    ('EL011', N'Nghe 3', 2, 'N'),
    ('EL012', N'Nghe 4', 2, 'N');

-- Thêm điểm cho sinh viên Lớp 12DHTH10
INSERT INTO KETQUA (MASV, MAMH, HOCKY, DIEMTHI)
VALUES
    ('SV101', 'LT001', 1, 8.0),
    ('SV101', 'LT002', 1, 8.5),
    ('SV101', 'LT003', 1, 7.5),
    ('SV101', 'LT004', 1, 9.0),
    ('SV101', 'LT005', 1, 6.5),
    ('SV101', 'LT006', 1, 7.0),
    ('SV101', 'LT007', 1, 8.0),
    ('SV102', 'LT001', 1, 7.8),
    ('SV102', 'LT002', 1, 8.0),
    ('SV102', 'LT003', 1, 7.2),
    ('SV102', 'LT004', 1, 8.5),
    ('SV102', 'LT005', 1, 6.8),
    ('SV102', 'LT006', 1, 7.1),
    ('SV102', 'LT007', 1, 7.6),
    ('SV103', 'LT001', 1, 9.0),
    ('SV103', 'LT002', 1, 9.5),
    ('SV103', 'LT003', 1, 7.5),
    ('SV103', 'LT004', 1, 8.5),
    ('SV103', 'LT005', 1, 6.0),
    ('SV103', 'LT006', 1, 7.5),
    ('SV103', 'LT007', 1, 8.0),
    ('SV104', 'LT001', 1, 8.8),
    ('SV104', 'LT002', 1, 9.0),
    ('SV104', 'LT003', 1, 8.0),
    ('SV104', 'LT004', 1, 9.5),
    ('SV104', 'LT005', 1, 7.0),
    ('SV104', 'LT006', 1, 8.5),
    ('SV104', 'LT007', 1, 8.8),
    ('SV105', 'LT001', 1, 7.5),
    ('SV105', 'LT002', 1, 8.0),
    ('SV105', 'LT003', 1, 7.8),
    ('SV105', 'LT004', 1, 8.0),
    ('SV105', 'LT005', 1, 8.5),
    ('SV105', 'LT006', 1, 8.0),
    ('SV105', 'LT007', 1, 7.2),
    ('SV106', 'LT001', 1, 7.0),
    ('SV106', 'LT002', 1, 7.5),
    ('SV106', 'LT003', 1, 8.0),
    ('SV106', 'LT004', 1, 7.5),
    ('SV106', 'LT005', 1, 8.0),
    ('SV106', 'LT006', 1, 8.0),
    ('SV106', 'LT007', 1, 7.0),
    ('SV107', 'LT001', 1, 6.0),
    ('SV107', 'LT002', 1, 7.0),
    ('SV107', 'LT003', 1, 6.5),
    ('SV107', 'LT004', 1, 7.0),
    ('SV107', 'LT005', 1, 6.8),
    ('SV107', 'LT006', 1, 7.2),
    ('SV107', 'LT007', 1, 6.5),
    ('SV108', 'LT001', 1, 9.0),
    ('SV108', 'LT002', 1, 8.5),
    ('SV108', 'LT003', 1, 8.0),
    ('SV108', 'LT004', 1, 7.5),
    ('SV108', 'LT005', 1, 8.0),
    ('SV108', 'LT006', 1, 7.8),
    ('SV108', 'LT007', 1, 8.0),
    ('SV109', 'LT001', 1, 8.5),
    ('SV109', 'LT002', 1, 9.0),
    ('SV109', 'LT003', 1, 8.0),
    ('SV109', 'LT004', 1, 8.5),
    ('SV109', 'LT005', 1, 7.0),
    ('SV109', 'LT006', 1, 7.5),
    ('SV109', 'LT007', 1, 8.0),
    ('SV110', 'LT001', 1, 8.4),
    ('SV110', 'LT002', 1, 8.9),
    ('SV110', 'LT003', 1, 7.5),
    ('SV110', 'LT004', 1, 8.5),
    ('SV110', 'LT005', 1, 7.0),
    ('SV110', 'LT006', 1, 8.5),
    ('SV110', 'LT007', 1, 7.0);


SELECT * FROM LOP
--c/ Viết thủ tục cập nhật SISO dựa vào bảng SINHVIEN:
CREATE PROCEDURE UpdateSISO
AS
BEGIN
    UPDATE LOP
    SET SISO = (SELECT COUNT(*) FROM SINHVIEN WHERE SINHVIEN.MALOP = LOP.MALOP);
END;

EXEC UpdateSISO;

--d/ Viết thủ tục cộng 1 điểm cho sinh viên dựa vào mã sinh viên, tên môn học và học kỳ:
CREATE PROCEDURE CongDiemChoSinhVien
    @MASV VARCHAR(10),
    @TenMonHoc NVARCHAR(50),
    @HocKy INT
AS
BEGIN
    DECLARE @DiemMoi DECIMAL(5, 2);
    SET @DiemMoi = (SELECT DIEMTHI + 1 FROM KETQUA WHERE MASV = @MASV 
	AND MAMH = (SELECT MAMH FROM MONHOC WHERE TENMH = @TenMonHoc) 
	AND HOCKY = @HocKy);
    
    IF @DiemMoi IS NOT NULL
    BEGIN
        UPDATE KETQUA
        SET DIEMTHI = @DiemMoi
        WHERE MASV = @MASV AND MAMH = (SELECT MAMH FROM MONHOC WHERE TENMH = @TenMonHoc) AND HOCKY = @HocKy;
    END;
END;
SELECT * FROM KETQUA WHERE MASV ='SV102'
EXEC CongDiemChoSinhVien @MASV = 'SV102', @TenMonHoc = N'Cấu trúc dữ liệu và giải thuật', @HocKy = 1;

--e/ Viết thủ tục in ra họ tên và tên lớp của sinh viên dựa vào mã sinh viên:
CREATE PROCEDURE InHoTenVaLop
    @MASV VARCHAR(10)
AS
BEGIN
    SELECT SINHVIEN.HOTEN, LOP.TENLOP
    FROM SINHVIEN
    INNER JOIN LOP ON SINHVIEN.MALOP = LOP.MALOP
    WHERE SINHVIEN.MASV = @MASV;
END;
EXEC InHoTenVaLop @MASV = 'SV101';

--f/ Viết thủ tục trả về họ tên và tổng số môn học mà sinh viên đó học khi truyền vào tham số: mã sinh viên và học kỳ
CREATE PROCEDURE TongSoMonHocCuaSinhVien
    @MASV VARCHAR(10),
    @HocKy INT
AS
BEGIN
    SELECT SINHVIEN.HOTEN, COUNT(MONHOC.MAMH) AS TongSoMonHoc
    FROM SINHVIEN
    INNER JOIN KETQUA ON SINHVIEN.MASV = KETQUA.MASV
    INNER JOIN MONHOC ON KETQUA.MAMH = MONHOC.MAMH
    WHERE SINHVIEN.MASV = @MASV AND KETQUA.HOCKY = @HocKy
    GROUP BY SINHVIEN.HOTEN;
END;
EXEC TongSoMonHocCuaSinhVien @MASV = 'SV101', @HocKy = 1;

--g/ Viết thủ tục trả về mã môn học, số tín chỉ và tổng số sinh viên học môn học trong học kỳ:
CREATE PROCEDURE ThongTinMonHoc
    @TenMonHoc NVARCHAR(50),
    @HocKy INT
AS
BEGIN
    SELECT MONHOC.MAMH, MONHOC.SOTC, COUNT(KETQUA.MASV) AS TongSoSinhVien
    FROM MONHOC
    LEFT JOIN KETQUA ON MONHOC.MAMH = KETQUA.MAMH
    WHERE MONHOC.TENMH = @TenMonHoc AND KETQUA.HOCKY = @HocKy
    GROUP BY MONHOC.MAMH, MONHOC.SOTC;
END;
EXEC ThongTinMonHoc @TenMonHoc = N'Cấu trúc dữ liệu và giải thuật', @HocKy = 1;

--h/ Viết thủ tục khi truyền vào 3 tham số: mã sinh viên, tên môn học và học kỳ sẽ trả về
--‘chua dang ky’ nếu như sinh viên đó chưa đăng ký môn học, trả về ‘dat’ nếu điểm
--môn đó >=5, trả về ‘khong dat’ neu điểm của môn đó <5.
-- Thủ tục trả về trạng thái của môn học cho sinh viên

CREATE PROCEDURE TrangThaiMonHoc
    @MASV VARCHAR(10),
    @TenMonHoc NVARCHAR(50),
    @HocKy INT
AS
BEGIN
    DECLARE @TrangThai NVARCHAR(50);
    SET @TrangThai = N'Chưa Đăng Ký';

    IF EXISTS (SELECT 1 FROM KETQUA
               WHERE MASV = @MASV
               AND MAMH = (SELECT MAMH FROM MONHOC WHERE TENMH = @TenMonHoc)
               AND HOCKY = @HocKy)
    BEGIN
        DECLARE @Diem DECIMAL(5, 2);
        SET @Diem = (SELECT DIEMTHI FROM KETQUA
                     WHERE MASV = @MASV
                     AND MAMH = (SELECT MAMH FROM MONHOC WHERE TENMH = @TenMonHoc)
                     AND HOCKY = @HocKy);

        IF @Diem >= 5
            SET @TrangThai = N'Đạt';
        ELSE
            SET @TrangThai = N'Không Đạt';
    END;

    SELECT @TrangThai AS N'Trạng Thái';
END;

EXEC TrangThaiMonHoc @MASV = 'SV101', @TenMonHoc = N'Cấu trúc dữ liệu và giải thuật', @HocKy = 1;

--i/ Viết thủ tục trả về điểm trung bình của sinh viên khi truyền vào tham số mã sinh viên
--(HD: Điểm trung bình =(số tín chỉ1 * điểm môn học1+số tín chỉ2*điểm môn hoc 2 +…+số tín chỉ n * điểm môn học n)/tổng số tín chỉ)
-- Hàm trả về điểm trung bình của sinh viên
CREATE FUNCTION TinhDiemTrungBinh
(@MASV VARCHAR(10))
RETURNS DECIMAL(5, 2)
AS
BEGIN
    DECLARE @DiemTB DECIMAL(5, 2);

    SELECT @DiemTB = SUM(SOTC * DIEMTHI) / NULLIF(SUM(SOTC), 0)
    FROM KETQUA
    INNER JOIN MONHOC ON KETQUA.MAMH = MONHOC.MAMH
    WHERE KETQUA.MASV = @MASV;

    RETURN @DiemTB;
END;
DECLARE @DiemTrungBinh DECIMAL(5, 2);
SET @DiemTrungBinh = dbo.TinhDiemTrungBinh('SV101');
SELECT dbo.TinhDiemTrungBinh('SV101') AS DiemTrungBinh
--j/ Chuyển các PROCEDURE thành FUNCTION
CREATE FUNCTION dbo.UpdateSISOFunction()
RETURNS INT
AS
BEGIN
    DECLARE @SISO INT;
    SET @SISO = (SELECT COUNT(*) FROM SINHVIEN );
    RETURN @SISO;
END;

CREATE FUNCTION dbo.CongDiemChoSinhVienFunction(@MASV VARCHAR(10), @TenMonHoc NVARCHAR(50), @HocKy INT)
RETURNS DECIMAL(5, 2)
AS
BEGIN
    DECLARE @DiemMoi DECIMAL(5, 2);
    SET @DiemMoi = (SELECT DIEMTHI + 1 FROM KETQUA WHERE MASV = @MASV 
    AND MAMH = (SELECT MAMH FROM MONHOC WHERE TENMH = @TenMonHoc) 
    AND HOCKY = @HocKy);
    
    IF @DiemMoi IS NOT NULL
    BEGIN
        UPDATE KETQUA
        SET DIEMTHI = @DiemMoi
        WHERE MASV = @MASV AND MAMH = (SELECT MAMH FROM MONHOC WHERE TENMH = @TenMonHoc) AND HOCKY = @HocKy;
    END;
    
    RETURN @DiemMoi;
END;

CREATE FUNCTION dbo.TongSoMonHocCuaSinhVienFunction(@MASV VARCHAR(10), @HocKy INT)
RETURNS INT
AS
BEGIN
    DECLARE @TongSoMonHoc INT;
    SET @TongSoMonHoc = (SELECT COUNT(MONHOC.MAMH)
        FROM SINHVIEN
        INNER JOIN KETQUA ON SINHVIEN.MASV = KETQUA.MASV
        INNER JOIN MONHOC ON KETQUA.MAMH = MONHOC.MAMH
        WHERE SINHVIEN.MASV = @MASV AND KETQUA.HOCKY = @HocKy
        GROUP BY SINHVIEN.HOTEN);
    
    RETURN @TongSoMonHoc;
END;

CREATE FUNCTION dbo.ThongTinMonHocFunction(@TenMonHoc NVARCHAR(50), @HocKy INT)
RETURNS TABLE
AS
RETURN (
    SELECT MONHOC.MAMH, MONHOC.SOTC, COUNT(KETQUA.MASV) AS N'Tổng Số Sinh Viên'
    FROM MONHOC
    LEFT JOIN KETQUA ON MONHOC.MAMH = KETQUA.MAMH
    WHERE MONHOC.TENMH = @TenMonHoc AND KETQUA.HOCKY = @HocKy
    GROUP BY MONHOC.MAMH, MONHOC.SOTC
);

-- Hàm thực thi 
-- Sử dụng hàm UpdateSISOFunction
DECLARE @SISO INT;
SET @SISO = dbo.UpdateSISOFunction();
SELECT @SISO AS SISO;

-- Sử dụng hàm CongDiemChoSinhVienFunction
DECLARE @NewDiem DECIMAL(5, 2);
SET @NewDiem = dbo.CongDiemChoSinhVienFunction('SV103', N'Cấu trúc dữ liệu và giải thuật', 1);
SELECT @NewDiem AS DiemMoi;
SELECT * FROM KETQUA WHERE MASV = 'SV103'
-- Sử dụng hàm TongSoMonHocCuaSinhVienFunction
DECLARE @TotalSubjects INT;
SET @TotalSubjects = dbo.TongSoMonHocCuaSinhVienFunction('SV101', 1);
SELECT @TotalSubjects AS TongSoMonHoc;

-- Sử dụng hàm ThongTinMonHocFunction
SELECT * FROM dbo.ThongTinMonHocFunction(N'Cấu trúc dữ liệu và giải thuật', 1);

-- Sử dụng thủ tục TrangThaiMonHoc
EXEC TrangThaiMonHoc @MASV = 'SV101', @TenMonHoc = N'Cấu trúc dữ liệu và giải thuật', @HocKy = 1;

--k/ Viết hàm nội tuyến trả về table gồm: mã sinh viên, họ tên, tên lớp, tổng số môn học.
--Với tham số truyền vào là ‘lop A’ Thực hiện truy vấn trên hàm (liệt kê mã họ tên và tổng số môn học của các sinh viên)
-- Hàm nội tuyến trả về table gồm mã sinh viên, họ tên, tên lớp, tổng số môn học
CREATE FUNCTION LietKeSinhVienTheoLop
(@TenLop NVARCHAR(50))
RETURNS TABLE
AS
RETURN (
    SELECT SINHVIEN.MASV, SINHVIEN.HOTEN, LOP.TENLOP, COUNT(KETQUA.MASV) AS N'Tổng Số Môn Học'
    FROM SINHVIEN
    INNER JOIN LOP ON SINHVIEN.MALOP = LOP.MALOP
    LEFT JOIN KETQUA ON SINHVIEN.MASV = KETQUA.MASV
    WHERE LOP.TENLOP = @TenLop
    GROUP BY SINHVIEN.MASV, SINHVIEN.HOTEN, LOP.TENLOP
);
SELECT MASV, HOTEN, TENLOP, TongSoMonHoc 
FROM dbo.LietKeSinhVienTheoLop(N'Lớp 12DHTH10');
