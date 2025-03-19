USE QLSV_DOTNET_KT
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
	HoSV NVARCHAR(50),
	TenSV NVARCHAR(50),
	NgaySinh DATETIME,
	GioiTinh NVARCHAR(5),
	MaLop VARCHAR(10),
	CONSTRAINT FK_SinhVien_Lop FOREIGN KEY (MaLop) REFERENCES Lop(MaLop)
);

INSERT INTO Khoa (MaKhoa, TenKhoa)
VALUES 
    ('CNTT', N'Khoa Công Nghệ Thông Tin'),
    ('NN', N'Khoa Ngoại Ngữ'),
    ('TP', N'Khoa Thực Phẩm');

	INSERT INTO Lop (MaLop, TenLop, MaKhoa)
VALUES    
    ('12DHTH10', N'Lớp 12DHTH10', 'CNTT'),
    ('12DHTH11', N'Lớp 12DHTH11', 'CNTT'),
    ('12DHTH12', N'Lớp 12DHTH12', 'CNTT');
INSERT INTO SinhVien (MaSinhVien,HoSV, TenSV, NgaySinh, MaLop,GioiTinh)
VALUES 
    ('SV101',N'Lê Quang ', N'Thành', '2000-01-15', '12DHTH10',N'Nam'),
    ('SV102',N'Nguyễn Thị', N'Ngọc', '2001-03-20', '12DHTH10',N'Nữ'),
    ('SV103',N'Lý Anh', N'Xuân', '1999-05-10', '12DHTH10',N'Nam'),
    ('SV104',N'Trần Bảo', N'Cẩm', '2000-07-18', '12DHTH10',N'Nữ'),
    ('SV105', N'Lâm Thị',N'Kim', '2002-02-25', '12DHTH10',N'Nữ'),
    ('SV106', N'Hồ Thái',N'Hồng', '1998-11-08', '12DHTH10',N'Nữ'),
    ('SV107', N'Nguyễn Thị',N'Bảo', '1999-08-12', '12DHTH10',N'Nữ'),
    ('SV108', N'Trần Quang',N'Sơn', '2000-04-02', '12DHTH10',N'Nam'),
    ('SV109', N'Lai Thị',N'Mai', '2001-06-19', '12DHTH10',N'Nữ'),
    ('SV110', N'Huỳnh Thị',N'Thắm', '2002-07-21', '12DHTH10',N'Nam');