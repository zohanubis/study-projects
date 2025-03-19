CREATE DATABASE Buoi2_BTTH_Bai6

USE Buoi2_BTTH_Bai6

CREATE TABLE LOP(
    MALOP VARCHAR(10),
    TENLOP NVARCHAR(50),
    SISO INT,
    CONSTRAINT FK_Lop PRIMARY KEY (MALOP)
);

CREATE TABLE SINHVIEN (
    MASV VARCHAR(10),
    HOTEN NVARCHAR(50),
    NGSINH DATE,
    GIOITINH NVARCHAR(10),
    QUEQUAN NVARCHAR(50),
    MALOP VARCHAR(10),
    DIEMTB FLOAT,
    XEPLOAI NVARCHAR(50),
    CONSTRAINT CK_DIEMTB CHECK (DIEMTB >= 0 AND DIEMTB <= 10),
    CONSTRAINT FK_SinhVien PRIMARY KEY (MASV),
    CONSTRAINT PK_SinhVien_Lop FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)
);

CREATE TABLE MONHOC (
    MAMH VARCHAR(10),
    TENMH NVARCHAR(50),
    SOTC INT,
    BATBUOC BIT,
    CONSTRAINT PK_MonHoc PRIMARY KEY (MAMH)
);

CREATE TABLE KETQUA (
    MASV VARCHAR(10),
    MAMH VARCHAR(10),
    HOCKY INT,
    DIEMTHI FLOAT,
    PRIMARY KEY (MASV, MAMH, HOCKY),
    CONSTRAINT PK_SinhVien_KetQua FOREIGN KEY (MASV) REFERENCES SINHVIEN(MASV),
    CONSTRAINT PK_MonHoc_KetQua FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
);
SELECT * FROM SINHVIEN
--------------------Trigger------------------------------
-- Trigger thực hiện cập nhật sĩ số SISO trên bảng LOP
CREATE TRIGGER TR_SINHVIEN_AFTER_INSERT_UPDATE_DELETE
ON SINHVIEN
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM inserted) > 0
        UPDATE LOP
        SET SISO = (SELECT COUNT(*) FROM SINHVIEN WHERE SINHVIEN.MALOP = LOP.MALOP)
        WHERE MALOP IN (SELECT MALOP FROM inserted);

    IF (SELECT COUNT(*) FROM deleted) > 0
        UPDATE LOP
        SET SISO = (SELECT COUNT(*) FROM SINHVIEN WHERE SINHVIEN.MALOP = LOP.MALOP)
        WHERE MALOP IN (SELECT MALOP FROM deleted);
END;

-- Trigger thực hiện tính điểm trung bình DIEMTB trên bảng SINHVIEN
CREATE TRIGGER TR_KETQUA_AFTER_INSERT_UPDATE_DELETE
ON KETQUA
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM inserted) > 0
        UPDATE SINHVIEN
        SET DIEMTB = ROUND((SELECT AVG(DIEMTHI) FROM KETQUA WHERE KETQUA.MASV = SINHVIEN.MASV), 2)
        WHERE MASV IN (SELECT MASV FROM inserted);

    IF (SELECT COUNT(*) FROM deleted) > 0
        UPDATE SINHVIEN
        SET DIEMTB = ROUND((SELECT AVG(DIEMTHI) FROM KETQUA WHERE KETQUA.MASV = SINHVIEN.MASV), 2)
        WHERE MASV IN (SELECT MASV FROM deleted);
END;

-- Trigger kiểm tra số lượng môn đăng ký của mỗi sinh viên sau mỗi lần thêm, cập nhật, xóa

CREATE TRIGGER TR_KIEMSOMHDANGKY
ON KETQUA
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Kiểm tra số môn đăng ký của mỗi sinh viên
    IF (SELECT COUNT(*) FROM KETQUA WHERE KETQUA.MASV IN (SELECT MASV FROM inserted)) > 3
    BEGIN
        THROW 50000, N'Mỗi sinh viên chỉ được đăng ký tối đa 3 môn trong mỗi học kỳ.', 1;
    END
END;



-- Trigger kiểm tra số tín chỉ của môn học bắt buộc đăng ký của mỗi sinh viên sau mỗi lần thêm, cập nhật, xóa
CREATE TRIGGER TR_KIEMTRA_TINCHI_MONHOC_BATBUOC
ON KETQUA
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Kiểm tra số tín chỉ của môn học bắt buộc đăng ký của mỗi sinh viên
    IF (
        SELECT SUM(MONHOC.SOTC)
        FROM KETQUA
        JOIN MONHOC ON KETQUA.MAMH = MONHOC.MAMH
        WHERE KETQUA.MASV IN (SELECT MASV FROM inserted) AND MONHOC.BATBUOC = 1
    ) > 10
    BEGIN
        THROW 50000,N'Mỗi sinh viên chỉ được đăng ký tối đa 10 tín chỉ của môn học bắt buộc trong mỗi học kỳ.', 1;
        ROLLBACK TRANSACTION;
        RETURN;
    END
END

-- Trigger điền giá trị vào cột XEPLOAI dựa vào cột DIEMTB
CREATE TRIGGER TR_DIENGIAI_XEPLOAI
ON SINHVIEN
AFTER INSERT, UPDATE
AS
BEGIN
    -- Cập nhật giá trị cột XEPLOAI dựa vào giá trị cột DIEMTB
    UPDATE SINHVIEN
    SET XEPLOAI =
        CASE
            WHEN DIEMTB < 5 THEN N'Yếu'
            WHEN DIEMTB >= 5 AND DIEMTB < 7 THEN N'Trung Bình'
            WHEN DIEMTB >= 7 AND DIEMTB < 8 THEN N'Khá'
            WHEN DIEMTB >= 8 THEN N'Giỏi'
        END
    WHERE MASV IN (SELECT MASV FROM inserted);
END;


-----------------------------Dữ Liệu-----------------------
INSERT INTO LOP (MaLop, TenLop, SiSo)
VALUES    
    ('12DHTH10', N'Lớp 12DHTH10', 0),
    ('12DHTH11', N'Lớp 12DHTH11', 0),
    ('12DHTH12', N'Lớp 12DHTH12', 0)
SELECT * FROM LOP
-- Thêm dữ liệu vào bảng SinhVien
-- Lớp 12DHTH10
INSERT INTO SINHVIEN (MaSV, HoTen, NgSinh, GioiTinh, QueQuan, MaLop, DiemTB, XepLoai)
VALUES 
    ('SV101', N'Lê Quang Thành', '2000-01-15', N'Nam', N'Hồ Chí Minh', '12DHTH10', 0, NULL),
    ('SV102', N'Nguyễn Thị Ngọc', '2001-03-20', N'Nữ', N'Bình Dương', '12DHTH10', 0, NULL),
    ('SV103', N'Lý Anh Xuân', '1999-05-10', N'Nam', N'Đồng Nai', '12DHTH10', 0, NULL),
    ('SV104', N'Trần Bảo Cẩm', '2000-07-18', N'Nữ', N'Long An', '12DHTH10', 0, NULL),
    ('SV105', N'Lâm Thị Kim', '2002-02-25', N'Nữ', N'Vũng Tàu', '12DHTH10', 0, NULL),
    ('SV106', N'Hồ Thái Hồng', '1998-11-08', N'Nam', N'Tiền Giang', '12DHTH10', 0, NULL),
    ('SV107', N'Nguyễn Thị Bảo', '1999-08-12', N'Nữ', N'Bà Rịa-Vũng Tàu', '12DHTH10', 0, NULL),
    ('SV108', N'Trần Quang Sơn', '2000-04-02', N'Nam', N'Đồng Tháp', '12DHTH10', 0, NULL),
    ('SV109', N'Lai Thị Mai', '2001-06-19', N'Nữ', N'Tiền Giang', '12DHTH10', 0, NULL),
    ('SV110', N'Huỳnh Thị Thắm', '2002-07-21', N'Nữ', N'Long An', '12DHTH10', 0, NULL);

-- Lớp 12DHTH11
INSERT INTO SINHVIEN (MaSV, HoTen, NgSinh, GioiTinh, QueQuan, MaLop, DiemTB, XepLoai)
VALUES 
    ('SV111', N'Lê Thị Hà', '1999-03-08', N'Nữ', N'Hồ Chí Minh', '12DHTH11', 0, NULL),
    ('SV112', N'Nguyễn Thành Danh', '2001-05-13', N'Nam', N'Bình Dương', '12DHTH11', 0, NULL),
    ('SV113', N'Lý Thị Thắng', '1999-07-25', N'Nam', N'Đồng Nai', '12DHTH11', 0, NULL),
    ('SV114', N'Trần Xuân Kỳ', '2000-10-10', N'Nam', N'Long An', '12DHTH11', 0, NULL),
    ('SV115', N'Lâm Quang Thành', '2002-01-15', N'Nam', N'Vũng Tàu', '12DHTH11', 0, NULL),
    ('SV116', N'Hồ Thị Tâm', '1998-12-18', N'Nữ', N'Tiền Giang', '12DHTH11', 0, NULL),
    ('SV117', N'Lai Quang Phụng', '1999-09-02', N'Nam', N'Bà Rịa-Vũng Tàu', '12DHTH11', 0, NULL),
    ('SV118', N'Huỳnh Thị Thảo', '2001-04-09', N'Nữ', N'Đồng Tháp', '12DHTH11', 0, NULL),
    ('SV119', N'La Văn Khánh', '2002-08-20', N'Nam', N'Tiền Giang', '12DHTH11', 0, NULL),
    ('SV120', N'Lê Văn Trung', '2002-06-15', N'Nam', N'Long An', '12DHTH11', 0, NULL);

-- Lớp 12DHTH12
INSERT INTO SINHVIEN (MaSV, HoTen, NgSinh, GioiTinh, QueQuan, MaLop, DiemTB, XepLoai)
VALUES 
    ('SV121', N'Lê Quang Sơn', '2000-02-18', N'Nam', N'Hồ Chí Minh', '12DHTH12', 0, NULL),
    ('SV122', N'Nguyễn Thị Mai', '2001-03-20', N'Nữ', N'Bình Dương', '12DHTH12', 0, NULL),
    ('SV123', N'Lý Thị Hồng', '1999-05-10', N'Nữ', N'Đồng Nai', '12DHTH12', 0, NULL),
    ('SV124', N'Trần Thanh Bảo', '2000-07-18', N'Nam', N'Long An', '12DHTH12', 0, NULL),
    ('SV125', N'Lâm Thị Ngọc', '2002-01-25', N'Nữ', N'Vũng Tàu', '12DHTH12', 0, NULL),
    ('SV126', N'Hồ Thành Kim', '1998-11-08', N'Nam', N'Tiền Giang', '12DHTH12', 0, NULL),
    ('SV127', N'Lai Thị Thảo', '1999-08-12', N'Nữ', N'Bà Rịa-Vũng Tàu', '12DHTH12', 0, NULL),
    ('SV128', N'Huỳnh Quang Danh', '2000-04-02', N'Nam', N'Đồng Tháp', '12DHTH12', 0, NULL),
    ('SV129', N'La Thị Sương', '2001-06-19', N'Nữ', N'Tiền Giang', '12DHTH12', 0, NULL),
    ('SV130', N'Lê Văn Tuấn', '2002-07-21', N'Nam', N'Long An', '12DHTH12', 0, NULL);
DELETE FROM MONHOC
-- Thêm dữ liệu vào bảng MonHoc
INSERT INTO MONHOC (MaMH, TenMH, SoTC, BatBuoc)
VALUES 
    ('LT001', N'Cấu trúc dữ liệu và giải thuật', 3, 1),
    ('LT002', N'Cơ sở dữ liệu', 3, 1),
    ('LT003', N'Cấu trúc rời rạc', 1, 1),
    ('LT004', N'Kỹ thuật lập trình', 3, 1),
    ('LT005', N'Hệ điều hành', 3, 1),
    ('LT006', N'Lập trình hướng đối tượng', 3, 1),
    ('LT007', N'Công nghệ .NET', 3, 1);
SELECT * FROM MONHOC

SELECT *FROM KETQUA
SELECT * FROM SINHVIEN
-- Thêm dữ liệu vào bảng KETQUA
INSERT INTO KETQUA (MaSV, MaMH, HocKy, DiemThi)
VALUES 
     -- Sinh viên SV101
    ('SV101', 'LT001',1, 8.5),
    ('SV101', 'LT002', 1,7.8),
    ('SV101', 'LT003', 1,9.0),
    ('SV101', 'LT004', 1,8.0),
    ('SV101', 'LT005', 1,9.2),
    ('SV101', 'LT006',1, 8.7),
    ('SV101', 'LT007',1, 8.9),
	

INSERT INTO KETQUA (MaSV, MaMH, HocKy, DiemThi)
VALUES 
    -- Sinh viên SV102
    ('SV102', 'LT001',1, 7.9),
	('SV102', 'LT002',1, 8.0),
    ('SV102', 'LT003',1, 8.5),
    ('SV102', 'LT004',1, 8.2),
    ('SV102', 'LT005',1, 9.0),
    ('SV102', 'LT006',1, 8.8),
    ('SV102', 'LT007',1, 8.6),

    -- Sinh viên SV103
    ('SV103', 'LT001',1, 9.0),
    ('SV103', 'LT002',1, 8.7),
    ('SV103', 'LT003',1, 8.8),
    ('SV103', 'LT004',1, 9.1),
    ('SV103', 'LT005',1, 8.9),
    ('SV103', 'LT006',1, 9.0),
    ('SV103', 'LT007',1, 9.2),

    -- Sinh viên SV104
    ('SV104', 'LT001',1, 8.2),
    ('SV104', 'LT002',1, 8.1),
    ('SV104', 'LT003',1, 7.9),
    ('SV104', 'LT004',1, 8.5),
    ('SV104', 'LT005',1, 8.7),
    ('SV104', 'LT006',1, 8.6),
    ('SV104', 'LT007',1, 8.3),
    -- Sinh viên SV105
    ('SV105', 'LT001',1, 9.1),
    ('SV105', 'LT002',1, 8.9),
    ('SV105', 'LT003',1, 9.0),
    ('SV105', 'LT004',1, 9.2),
    ('SV105', 'LT005',1, 9.3),
    ('SV105', 'LT006',1, 9.1),
    ('SV105', 'LT007',1, 9.0),

    -- Sinh viên SV106
    ('SV106', 'LT001',1, 8.7),
    ('SV106', 'LT002',1, 8.8),
    ('SV106', 'LT003',1, 8.5),
    ('SV106', 'LT004',1, 8.4),	
    ('SV106', 'LT005',1, 8.9),
    ('SV106', 'LT006',1, 8.6),
    ('SV106', 'LT007',1, 8.7),

    -- Sinh viên SV107
    ('SV107', 'LT001',1, 8.0),
    ('SV107', 'LT002',1, 7.8),
    ('SV107', 'LT003',1, 8.2),
    ('SV107', 'LT004',1, 8.1),
    ('SV107', 'LT005',1, 8.3),
    ('SV107', 'LT006',1, 8.0),
    ('SV107', 'LT007',1, 8.4),

    -- Sinh viên SV108
    ('SV108', 'LT001', 1,9.2),
    ('SV108', 'LT002',1, 9.0),
    ('SV108', 'LT003',1, 9.3),
    ('SV108', 'LT004',1, 9.1),
    ('SV108', 'LT005',1, 9.0),
    ('SV108', 'LT006',1, 9.2),
    ('SV108', 'LT007',1, 9.4),

    -- Sinh viên SV109
    ('SV109', 'LT001',1, 8.5),
    ('SV109', 'LT002',1, 8.3),
    ('SV109', 'LT003',1, 8.6),
    ('SV109', 'LT004',1, 8.4),
    ('SV109', 'LT005',1, 8.2),
    ('SV109', 'LT006',1, 8.5),
    ('SV109', 'LT007',1, 8.8),

    -- Sinh viên SV110
    ('SV110', 'LT001',1, 9.0),
    ('SV110', 'LT002',1, 8.8),
    ('SV110', 'LT003',1, 9.2),
    ('SV110', 'LT004',1, 9.5),
    ('SV110', 'LT005',1, 8.7),
    ('SV110', 'LT006',1, 9.0),
    ('SV110', 'LT007',1, 9.3);