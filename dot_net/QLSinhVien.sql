CREATE DATABASE QLSinhVien

USE QLSinhVien

CREATE TABLE Khoa (
	MaKhoa VARCHAR(10) PRIMARY KEY,
	TenKhoa NVARCHAR(50)
);

CREATE TABLE Lop (
	MaLop VARCHAR(10) PRIMARY KEY,
	TenLop NVARCHAR(50),
	MaKhoa VARCHAR(10),
	CONSTRAINT FK_Lop_Khoa FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa)
);

CREATE TABLE SinhVien (
	MaSinhVien VARCHAR(10) PRIMARY KEY,
	HoTen NVARCHAR(50),
	NgaySinh DATETIME,
	MaLop VARCHAR(10),
	CONSTRAINT FK_SinhVien_Lop FOREIGN KEY (MaLop) REFERENCES Lop(MaLop)
);

CREATE TABLE MonHoc (
	MaMonHoc VARCHAR(10) PRIMARY KEY,
	TenMonHoc NVARCHAR(50)
);

CREATE TABLE Diem (
	MaSinhVien VARCHAR(10),
	MaMonHoc VARCHAR(10),
	Diem FLOAT,
	PRIMARY KEY (MaSinhVien, MaMonHoc),
	CONSTRAINT FK_Diem_SinhVien FOREIGN KEY (MaSinhVien) REFERENCES SinhVien(MaSinhVien)
);
SELECT * FROM Khoa

INSERT INTO Khoa (MaKhoa, TenKhoa)
VALUES 
    ('CNTT', N'Khoa Công Nghệ Thông Tin'),
    ('NN', N'Khoa Ngoại Ngữ'),
    ('TP', N'Khoa Thực Phẩm');
SELECT * FROM LOP
INSERT INTO Lop (MaLop, TenLop, MaKhoa)
VALUES    
    ('12DHTH10', N'Lớp 12DHTH10', 'CNTT'),
    ('12DHTH11', N'Lớp 12DHTH11', 'CNTT'),
    ('12DHTH12', N'Lớp 12DHTH12', 'CNTT');
INSERT INTO Lop (MaLop, TenLop, MaKhoa)
VALUES 
    ('12DHNN1', N'Lớp 12DHNN1', 'NN'),
    ('12DHNN2', N'Lớp 12DHNN2', 'NN');

-- Thêm dữ liệu vào bảng Lop cho Khoa TP
INSERT INTO Lop (MaLop, TenLop, MaKhoa)
VALUES 
    ('12DHTP1', N'Lớp 12DHTP1', 'TP'),
    ('12DHTP2', N'Lớp 12DHTP2', 'TP'),
    ('12DHTP3', N'Lớp 12DHTP3', 'TP'); 
	
-- Lớp 12DHTH10
INSERT INTO SinhVien (MaSinhVien, HoTen, NgaySinh, MaLop)
VALUES 
    ('SV101', N'Lê Quang Thành', '2000-01-15', '12DHTH10'),
    ('SV102', N'Nguyễn Thị Ngọc', '2001-03-20', '12DHTH10'),
    ('SV103', N'Lý Anh Xuân', '1999-05-10', '12DHTH10'),
    ('SV104', N'Trần Bảo Cẩm', '2000-07-18', '12DHTH10'),
    ('SV105', N'Lâm Thị Kim', '2002-02-25', '12DHTH10'),
    ('SV106', N'Hồ Thái Hồng', '1998-11-08', '12DHTH10'),
    ('SV107', N'Nguyễn Thị Bảo', '1999-08-12', '12DHTH10'),
    ('SV108', N'Trần Quang Sơn', '2000-04-02', '12DHTH10'),
    ('SV109', N'Lai Thị Mai', '2001-06-19', '12DHTH10'),
    ('SV110', N'Huỳnh Thị Thắm', '2002-07-21', '12DHTH10');
SELECT * FROM SinhVien WHERE MaLop ='12DHTH10'
-- Lớp 12DHTH11
INSERT INTO SinhVien (MaSinhVien, HoTen, NgaySinh, MaLop)
VALUES 
    ('SV111', N'Lê Thị Hà', '1999-03-08', '12DHTH11'),
    ('SV112', N'Nguyễn Thành Danh', '2001-05-13', '12DHTH11'),
    ('SV113', N'Lý Thị Thắng', '1999-07-25', '12DHTH11'),
    ('SV114', N'Trần Xuân Kỳ', '2000-10-10', '12DHTH11'),
    ('SV115', N'Lâm Quang Thành', '2002-01-15', '12DHTH11'),
    ('SV116', N'Hồ Thị Tâm', '1998-12-18', '12DHTH11'),
    ('SV117', N'Lai Quang Phụng', '1999-09-02', '12DHTH11'),
    ('SV118', N'Huỳnh Thị Thảo', '2001-04-09', '12DHTH11'),
    ('SV119', N'La Văn Khánh', '2002-08-20', '12DHTH11'),
    ('SV120', N'Lê Văn Trung', '2002-06-15', '12DHTH11');

-- Lớp 12DHTH12
INSERT INTO SinhVien (MaSinhVien, HoTen, NgaySinh, MaLop)
VALUES 
    ('SV121', N'Lê Quang Sơn', '2000-02-18', '12DHTH12'),
    ('SV122', N'Nguyễn Thị Mai', '2001-03-20', '12DHTH12'),
    ('SV123', N'Lý Thị Hồng', '1999-05-10', '12DHTH12'),
    ('SV124', N'Trần Thanh Bảo', '2000-07-18', '12DHTH12'),
    ('SV125', N'Lâm Thị Ngọc', '2002-01-25', '12DHTH12'),
    ('SV126', N'Hồ Thành Kim', '1998-11-08', '12DHTH12'),
    ('SV127', N'Lai Thị Thảo', '1999-08-12', '12DHTH12'),
    ('SV128', N'Huỳnh Quang Danh', '2000-04-02', '12DHTH12'),
    ('SV129', N'La Thị Sương', '2001-06-19', '12DHTH12'),
    ('SV130', N'Lê Văn Tuấn', '2002-07-21', '12DHTH12');

-- Lớp 12DHNN1
INSERT INTO SinhVien (MaSinhVien, HoTen, NgaySinh, MaLop)
VALUES 
    ('SV201', N'Lê Thị Hà', '1999-03-08', '12DHNN1'),
    ('SV202', N'Nguyễn Thành Danh', '2001-05-13', '12DHNN1'),
    ('SV203', N'Lý Thị Thắng', '1999-07-25', '12DHNN1'),
    ('SV204', N'Trần Xuân Kỳ', '2000-10-10', '12DHNN1'),
    ('SV205', N'Lâm Quang Thành', '2002-01-15', '12DHNN1'),
    ('SV206', N'Hồ Thị Tâm', '1998-12-18', '12DHNN1'),
    ('SV207', N'Lai Quang Phụng', '1999-09-02', '12DHNN1'),
    ('SV208', N'Huỳnh Thị Thảo', '2001-04-09', '12DHNN1'),
    ('SV209', N'La Văn Khánh', '2002-08-20', '12DHNN1'),
    ('SV210', N'Lê Văn Trung', '2002-06-15', '12DHNN1');

-- Lớp 12DHNN2
INSERT INTO SinhVien (MaSinhVien, HoTen, NgaySinh, MaLop)
VALUES 
    ('SV211', N'Lê Quang Sơn', '2000-02-18', '12DHNN2'),
    ('SV212', N'Nguyễn Thị Mai', '2001-03-20', '12DHNN2'),
    ('SV213', N'Lý Thị Hồng', '1999-05-10', '12DHNN2'),
    ('SV214', N'Trần Thanh Bảo', '2000-07-18', '12DHNN2'),
    ('SV215', N'Lâm Thị Ngọc', '2002-01-25', '12DHNN2'),
    ('SV216', N'Hồ Thành Kim', '1998-11-08', '12DHNN2'),
    ('SV217', N'Lai Thị Thảo', '1999-08-12', '12DHNN2'),
    ('SV218', N'Huỳnh Quang Danh', '2000-04-02', '12DHNN2'),
    ('SV219', N'La Thị Sương', '2001-06-19', '12DHNN2'),
    ('SV220', N'Lê Văn Tuấn', '2002-07-21', '12DHNN2');

INSERT INTO MonHoc (MaMonHoc, TenMonHoc)
VALUES 
    ('LT001', N'Cấu trúc dữ liệu và giải thuật'),
    ('LT002', N'Cơ sở dữ liệu'),
    ('LT003', N'Cấu trúc rời rạc'),
    ('LT004', N'Kỹ thuật lập trình'),
    ('LT005', N'Hệ điều hành'),
    ('LT006', N'Lập trình hướng đối tượng'),
    ('LT007', N'Công nghệ .NET'),
    ('EL001', N'Nói 1'),
    ('EL002', N'Nói 2'),
    ('EL003', N'Nói 3'),
    ('EL004', N'Nói 4'),
    ('EL005', N'Đọc 1'),
    ('EL006', N'Đọc 2'),
    ('EL007', N'Đọc 3'),
    ('EL008', N'Đọc 4'),
    ('EL009', N'Nghe 1'),
    ('EL010', N'Nghe 2'),
    ('EL011', N'Nghe 3'),
    ('EL012', N'Nghe 4');

-- Thêm điểm cho sinh viên của Khoa CNTT (môn học LT001 - LT007)
-- Mã môn học LT00x: LT001, LT002, ..., LT007
INSERT INTO Diem (MaSinhVien, MaMonHoc, Diem)
VALUES 
    -- Sinh viên SV101
    ('SV101', 'LT001', 8.5),
    ('SV101', 'LT002', 7.8),
    ('SV101', 'LT003', 9.0),
    ('SV101', 'LT004', 8.0),
    ('SV101', 'LT005', 9.2),
    ('SV101', 'LT006', 8.7),
    ('SV101', 'LT007', 8.9),

    -- Sinh viên SV102
    ('SV102', 'LT001', 7.9),
    ('SV102', 'LT002', 8.0),
    ('SV102', 'LT003', 8.5),
    ('SV102', 'LT004', 8.2),
    ('SV102', 'LT005', 9.0),
    ('SV102', 'LT006', 8.8),
    ('SV102', 'LT007', 8.6),

    -- Sinh viên SV103
    ('SV103', 'LT001', 9.0),
    ('SV103', 'LT002', 8.7),
    ('SV103', 'LT003', 8.8),
    ('SV103', 'LT004', 9.1),
    ('SV103', 'LT005', 8.9),
    ('SV103', 'LT006', 9.0),
    ('SV103', 'LT007', 9.2),

    -- Sinh viên SV104
    ('SV104', 'LT001', 8.2),
    ('SV104', 'LT002', 8.1),
    ('SV104', 'LT003', 7.9),
    ('SV104', 'LT004', 8.5),
    ('SV104', 'LT005', 8.7),
    ('SV104', 'LT006', 8.6),
    ('SV104', 'LT007', 8.3),
SELECT * FROM Diem WHERE MaSinhVien ='SV104'
    -- Sinh viên SV105
    ('SV105', 'LT001', 9.1),
    ('SV105', 'LT002', 8.9),
    ('SV105', 'LT003', 9.0),
    ('SV105', 'LT004', 9.2),
    ('SV105', 'LT005', 9.3),
    ('SV105', 'LT006', 9.1),
    ('SV105', 'LT007', 9.0),

    -- Sinh viên SV106
    ('SV106', 'LT001', 8.7),
    ('SV106', 'LT002', 8.8),
    ('SV106', 'LT003', 8.5),
    ('SV106', 'LT004', 8.4),
    ('SV106', 'LT005', 8.9),
    ('SV106', 'LT006', 8.6),
    ('SV106', 'LT007', 8.7),

    -- Sinh viên SV107
    ('SV107', 'LT001', 8.0),
    ('SV107', 'LT002', 7.8),
    ('SV107', 'LT003', 8.2),
    ('SV107', 'LT004', 8.1),
    ('SV107', 'LT005', 8.3),
    ('SV107', 'LT006', 8.0),
    ('SV107', 'LT007', 8.4),

    -- Sinh viên SV108
    ('SV108', 'LT001', 9.2),
    ('SV108', 'LT002', 9.0),
    ('SV108', 'LT003', 9.3),
    ('SV108', 'LT004', 9.1),
    ('SV108', 'LT005', 9.0),
    ('SV108', 'LT006', 9.2),
    ('SV108', 'LT007', 9.4),

    -- Sinh viên SV109
    ('SV109', 'LT001', 8.5),
    ('SV109', 'LT002', 8.3),
    ('SV109', 'LT003', 8.6),
    ('SV109', 'LT004', 8.4),
    ('SV109', 'LT005', 8.2),
    ('SV109', 'LT006', 8.5),
    ('SV109', 'LT007', 8.8),

    -- Sinh viên SV110
    ('SV110', 'LT001', 9.0),
    ('SV110', 'LT002', 8.8),
    ('SV110', 'LT003', 9.2),
    ('SV110', 'LT004', 9.5),
    ('SV110', 'LT005', 8.7),
    ('SV110', 'LT006', 9.0),
    ('SV110', 'LT007', 9.3);



	--------------------------------------
	SELECT
    SV.MaSinhVien,
    SV.HoTen,
    L.TenLop,
    DH.MaMonHoc,
    MH.TenMonHoc,
    DH.Diem
FROM
    SinhVien SV
JOIN
    Lop L ON SV.MaLop = L.MaLop
JOIN
    Diem DH ON SV.MaSinhVien = DH.MaSinhVien
JOIN
    MonHoc MH ON DH.MaMonHoc = MH.MaMonHoc;



	------
	SELECT * FROM Diem
SELECT 
    Khoa.TenKhoa AS 'Khoa',
    Lop.TenLop AS 'Lop',
    SinhVien.HoTen AS 'TenSinhVien',
    MonHoc.TenMonHoc AS 'MonHoc',
    Diem.Diem AS 'Diem'
FROM 
    Diem
JOIN 
    SinhVien ON Diem.MaSinhVien = SinhVien.MaSinhVien
JOIN 
    MonHoc ON Diem.MaMonHoc = MonHoc.MaMonHoc
JOIN 
    Lop ON SinhVien.MaLop = Lop.MaLop
JOIN 
    Khoa ON Lop.MaKhoa = Khoa.MaKhoa;

	SELECT 
    Khoa.TenKhoa AS 'Khoa',
    Lop.TenLop AS 'Lop',
    SinhVien.HoTen AS 'TenSinhVien',
    MonHoc.TenMonHoc AS 'MonHoc',
    Diem.Diem AS 'Diem'
FROM 
    Diem
JOIN 
    SinhVien ON Diem.MaSinhVien = SinhVien.MaSinhVien
JOIN 
    MonHoc ON Diem.MaMonHoc = MonHoc.MaMonHoc
JOIN 
    Lop ON SinhVien.MaLop = Lop.MaLop
JOIN 
    Khoa ON Lop.MaKhoa = Khoa.MaKhoa
WHERE 
	SinhVien.MaSinhVien = 'SV101';
    SinhVien.HoTen = N'Nguyễn Thị Ngọc';
-- In ra mã sinh viên và tên sinh viên
DECLARE CS_SINHVIEN CURSOR
DYNAMIC 
FOR 
SELECT MaSinhVien, HoTen FROM SinhVien;

OPEN CS_SINHVIEN
DECLARE @MaSV NVARCHAR(10);
DECLARE @HoTen NVARCHAR(50);

FETCH NEXT FROM CS_SINHVIEN INTO @MaSV,@HoTen;
WHILE @@FETCH_STATUS = 0
BEGIN 
	PRINT 'MASV : ' + @MaSV + ',Ho Ten : ' + @HoTen;
	FETCH NEXT FROM CS_SINHVIEN INTO @MaSV, @HoTen;
END
CLOSE CS_SINHVIEN;
DEALLOCATE CS_SINHVIEN;

DECLARE CS_SINHVIEN CURSOR
DYNAMIC 
FOR 
SELECT MaSinhVien, MaKhoa FROM SinhVien;

OPEN CS_SINHVIEN;
DECLARE @MaSV NVARCHAR(10);
DECLARE @MaKhoa NVARCHAR(10);

FETCH NEXT FROM CS_SINHVIEN INTO @MaSV, @MaKhoa;
WHILE @@FETCH_STATUS = 0
	BEGIN 
		DECLARE 
