CREATE DATABASE Bai2_QLNV_RBTV
GO

USE Bai2_QLNV_RBTV
GO

CREATE TABLE PHONGBAN(
	MAPH VARCHAR(5) NOT NULL,
	TENPH NVARCHAR(30) ,
	DIADIEM NVARCHAR(40),
	CONSTRAINT PK_PHONGBAN PRIMARY KEY (MAPH)
);
CREATE TABLE NHANVIEN(
	MANV VARCHAR(6) NOT NULL,
	HOTEN NVARCHAR(40),
	PHAI NVARCHAR (3),
	NGAYSINH DATE,
	DIACHI NVARCHAR(40),
	LUONG MONEY,
	MANQL VARCHAR(6),
	MAPH VARCHAR(5),
	CONSTRAINT PK_NHANVIEN PRIMARY KEY(MANV),
	CONSTRAINT FK_NHANVIEN_PHONGBAN FOREIGN KEY (MAPH) REFERENCES PHONGBAN(MAPH)
);
CREATE TABLE DEAN(
	MADA VARCHAR(5) NOT NULL,
	TENDA NVARCHAR(50),
	DIADIEMDA NVARCHAR(30),
	NGAYBD DATE,
	CONSTRAINT PK_DEAN PRIMARY KEY (MADA)
);
CREATE TABLE PHANCONG(
	MANV VARCHAR(6) NOT NULL,
	MADA VARCHAR(5) NOT NULL,
	THOIGIAN DATE,
	CONSTRAINT PK_PHANCONG PRIMARY KEY (MANV,MADA),
	CONSTRAINT FK_PHANCONG_NHANVIEN FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV),
	CONSTRAINT FK_PHANCONG_DEAN FOREIGN KEY (MADA) REFERENCES DEAN(MADA)
);
CREATE TABLE THANNHAN(
	MANV VARCHAR(6) NOT NULL,
	TENTN NVARCHAR(40),
	PHAI NVARCHAR(3),
	NGAYSINH DATE,
	QUANHE NVARCHAR(15),
	CONSTRAINT PK_THANNHAN PRIMARY KEY (TENTN,MANV),
	CONSTRAINT FK_THANNHAN_NHANVIEN FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
);
CREATE TABLE THENHANVIEN(
	MANV VARCHAR(6) NOT NULL,
	NGAYCAP DATE ,
	CONSTRAINT PK_THENHANVIEN PRIMARY KEY (MANV),
	CONSTRAINT FK_THENHANVIEN_NHANVIEN FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
);
--CONTRAINT
--1. Dùng Check Constraint viết tất cả các ràng buộc miền giá trị có trong cơ sở dữ liệu trên.
ALTER TABLE NHANVIEN
ADD CONSTRAINT CHK_NHANVIEN_PHAI CHECK (PHAI IN (N'Nam', N'Nữ'))
-- Hợp lệ
INSERT INTO NHANVIEN (MANV, HOTEN, NGAYSINH, PHAI, DIACHI, LUONG, MANQL, MAPH)
VALUES ('NV0012', N'Trần Thị Minh', '1992-06-15', N'Nữ', N'Hồ Chí Minh', 9000000, 'NV0003', 'PH004');
--Không hợp lệ
INSERT INTO NHANVIEN (MANV, HOTEN, NGAYSINH, PHAI, DIACHI, LUONG, MANQL, MAPH)
VALUES ('NV0014', N'Lê Thị B', '1998-09-25', N'Khác', N'Quảng Ngãi', 8000000, 'NV0009', 'PH003');
------------------------------------------------------------------------
ALTER TABLE THANNHAN
ADD CONSTRAINT CHK_THANNHAN_QUANHE CHECK (QUANHE IN (N'Cha', N'Mẹ', N'Anh',N'Chị', N'Con'))
-- Hợp lệ
INSERT INTO THANNHAN (MANV, TENTN, PHAI, NGAYSINH, QUANHE)
VALUES ('NV0012', N'Nguyễn Văn C', N'Nam', '2010-02-01', N'Cha');
--Không hợp lệ 
INSERT INTO THANNHAN (MANV, TENTN, PHAI, NGAYSINH, QUANHE)
VALUES ('NV0012', N'Nguyễn Thị E', N'Nữ', '1997-11-25', N'Bạn gái');
---------------------------------------------------------------------
ALTER TABLE THANNHAN
ADD CONSTRAINT CHK_THANNHAN_PHAI CHECK (PHAI IN (N'Nam', N'Nữ'))
--Hợp lệ
INSERT INTO THANNHAN (MANV, TENTN, PHAI, NGAYSINH, QUANHE)
VALUES ('NV0001', N'Nguyễn Thị Tám', N'Nữ', '2015-09-05', N'Con');
INSERT INTO THANNHAN (MANV, TENTN, PHAI, NGAYSINH, QUANHE)
VALUES ('NV0001', N'Nguyễn Chính Nghĩa', N'Nam', '1998-03-07', N'Cha');
--Không hợp lệ
INSERT INTO THANNHAN (MANV, TENTN, PHAI, NGAYSINH, QUANHE)
VALUES ('NV0001', N'Nguyễn Khắc Hùng', N'Khác', '2000-01-01', N'Em');
INSERT INTO THANNHAN (MANV, TENTN, PHAI, NGAYSINH, QUANHE)
VALUES ('NV0001', N'Nguyễn Thị Bình', NULL, '1995-05-05', N'Con'); --Được duyệt

SELECT * FROM THANNHAN
-----------------------------------==========-========================================
--2. Dùng Unique Constraint viết ràng buộc kiểm tra duy nhất cho các cột TENPH, TENDA.
ALTER TABLE PHONGBAN
ADD CONSTRAINT UQ_PHONGBAN_TENPH UNIQUE (TENPH)
--Hợp lệ
INSERT INTO PHONGBAN (MAPH, TENPH, DIADIEM)
VALUES ('PH008', N'Kế toán', N'Tầng 4 nhà A');
--Không hợp lệ
INSERT INTO PHONGBAN (MAPH, TENPH, DIADIEM)
VALUES ('PH001', N'Nhân sự', N'Tầng 1 nhà A');
--=========================================================================================
ALTER TABLE DEAN
ADD CONSTRAINT UQ_DEAN_TENDA UNIQUE (TENDA)
--Hợp lệ
INSERT INTO DEAN (MADA, TENDA, DIADIEMDA, NGAYBD)
VALUES ('DA006', N'Xây dựng hệ thống', N'Quận 1', '2022-01-01');
--Không hợp lệ
INSERT INTO DEAN (MADA, TENDA, DIADIEMDA, NGAYBD)
VALUES ('DA001', N'Đền bù giải toả', N'Phường 12, Q. Tân Bình', '2015-01-01');
--3. Dùng Default Constraint viết các ràng buộc giá trị mặc định cho các cột như sau:
--QUANHE có giá trị mặc định là Khong xac dinh, LUONG mặc định là 8.000.000.
ALTER TABLE THANNHAN
ADD CONSTRAINT DF_THANNHAN_QUANHE DEFAULT 'Không xác định' FOR QUANHE

ALTER TABLE NHANVIEN
ADD CONSTRAINT DF_NHANVIEN_LUONG DEFAULT 8000000 FOR LUONG
--4. Viết trigger thực hiện kiểm tra khi phân công đề án cho nhân viên thì ngày tham
--gia (THOIGIAN) phải lớn hơn hoặc bằng ngày bắt đầu đề án (NGAYBD).
CREATE TRIGGER TRG_PHANCONG_THOIGIAN
ON PHANCONG
AFTER INSERT, UPDATE    
AS
BEGIN
    IF EXISTS (
        SELECT *
        FROM inserted i
        INNER JOIN DEAN d ON i.MADA = d.MADA
        WHERE i.THOIGIAN < d.NGAYBD
    )
    BEGIN
        RAISERROR ('Ngày tham gia phân công phải lớn hơn hoặc bằng ngày bắt đầu đề án', 16, 1)
        ROLLBACK TRAN
    END
END
--Hợp lệ :
INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV0001', 'DA001', '2015-02-06');
--Không hợp lệ:
INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV0002', 'DA001', '2014-12-31');
--5. Viết trigger thực hiện kiểm tra khi thêm một nhân viên thì tuổi của nhân viên phải lớn hơn hoặc bằng 18
-- Trigger kiểm tra tuổi của nhân viên
CREATE TRIGGER TRG_NHANVIEN_TUOI
ON NHANVIEN
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT *
        FROM inserted
        WHERE DATEDIFF(YEAR, NGAYSINH, GETDATE()) < 18
    )
    BEGIN
        RAISERROR (N'Tuổi nhân viên phải lớn hơn hoặc bằng 18', 16, 1)
        ROLLBACK TRAN
    END
END
--Hợp lệ
INSERT INTO NHANVIEN (MANV, HOTEN, NGAYSINH, PHAI, DIACHI, LUONG, MANQL, MAPH)
VALUES ('NV0014', N'Nguyễn Thị Mai', '1990-05-20', N'Nữ', N'Hà Nội', 10000000, NULL, NULL);
--Không hợp lệ 
INSERT INTO NHANVIEN (MANV, HOTEN, NGAYSINH, PHAI, DIACHI, LUONG, MANQL, MAPH)
VALUES ('NV0016', N'Lê Thị Hương', '2006-07-08', N'Nữ', N'Đà Nẵng', 8000000, 'NV0012', 'PH001');

INSERT INTO PHONGBAN (MAPH, TENPH, DIADIEM)
VALUES
    ('PH001', N'Kế hoạch', N'Tầng 1 nhà A'),
    ('PH002', N'Quản trị', N'Tầng 1 nhà B'),
    ('PH003', N'Nhân sự', N'Tầng 2 nhà A'),
    ('PH004', N'Tài vụ', N'Tầng 3 nhà A'),
    ('PH005', N'Đầu tư', N'Tầng 2 nhà B'),
    ('PH006', N'Vật tư', N'Tầng 3 nhà B'),
    ('PH007', N'Tư vấn', N'Tầng 3 nhà B');
INSERT INTO NHANVIEN (MANV, HOTEN, NGAYSINH, PHAI, DIACHI, LUONG, MANQL, MAPH)
VALUES
    ('NV0001', N'Nguyễn Văn Nam', '1988-07-12', N'Nam', N'Tây Ninh', 15000000, 'NV0009', 'PH003'),
    ('NV0002', N'Nguyễn Kim Ánh', '1990-02-10', N'Nữ', N'TP. HCM', 8000000, 'NV0009', 'PH003'),
    ('NV0003', N'Nguyễn Thị Châu', '1979-10-12', N'Nữ', N'Vũng Tàu', 12000000, 'NV0006', 'PH003'),
    ('NV0004', N'Trần Văn Út', '1977-08-23', N'Nam', N'Hà Nội', 7000000, 'NV0005', 'PH002'),
    ('NV0005', N'Trần Lệ Quyên', '1987-12-22', N'Nữ', N'Hà Nội', 9000000, 'NV0005', 'PH002'),
    ('NV0006', N'Bùi Đức Chí', '1987-12-22', N'Nam', N'TP. HCM', 10000000, 'NV0008', 'PH003'),
    ('NV0007', N'Nguyễn Tuấn Anh', '1991-09-06', N'Nam', N'Tây Ninh', 35000000, 'NV0002', 'PH003'),
    ('NV0008', N'Đỗ Xuân Thuỷ', '1985-05-14', N'Nam', N'TP. HCM', 21000000, 'NV0002', 'PH002'),
    ('NV0009', N'Trần Minh Tú', '1985-09-17', N'Nam', N'Đồng Nai', 18000000, NULL, 'PH001'),
    ('NV0010', N'Trần Khánh An', '1987-11-13', N'Nữ', N'Khánh Hòa', 12000000, NULL, NULL),
    ('NV0011', N'Nguyễn Ngọc Phan', '1995-06-02', N'Nam', N'Đồng Nai', 13000000, NULL, NULL)
INSERT INTO DEAN (MADA, TENDA, DIADIEMDA, NGAYBD)
VALUES
    ('DA001', N'Đền bù giải toả', N'Phường 12, Q. Tân Bình', '2015-01-01'),
    ('DA002', N'Giải phóng mặt bằng', N'Phường 12, Q. Tân Bình', '2015-06-01'),
    ('DA003', N'Cải tạo mặt đường số 9', N'Phường Tây Thạnh, Q. Tân Phú', '2016-01-01'),
    ('DA004', N'Bắt đầu thi công', N'Phường 26, Q. Bình Thạnh', '2016-05-04'),
    ('DA005', N'Hoàn thiện mặt bằng', N'Phường Tân Quy, Quận 7', '2016-12-10')
INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES 
	('NV0001', 'DA001', '2015-02-05'),
	('NV0001', 'DA003', '2016-03-17'),
	('NV0003', 'DA003', '2016-01-01'),
	('NV0005', 'DA004', '2016-05-10'),
	('NV0007', 'DA005', '2016-12-20');
INSERT INTO THANNHAN (MANV, TENTN, PHAI, NGAYSINH, QUANHE)
VALUES
    ('NV0001', N'Nguyễn Thị Tám', N'Nữ', '2015-09-05', N'Con'),
    ('NV0001', N'Nguyễn Văn Bình', N'Nam', '1983-05-22', N'Anh'),
    ('NV0002', N'Nguyễn Chính Nghĩa', N'Nam', '1998-03-07', N'Em'),
    ('NV0005', N'Lê Anh Hùng', N'Nam', '1978-04-05', N'Chồng'),
    ('NV0006', N'Bùi Đại An', N'Nam', '1976-12-03', N'Anh'),
    ('NV0008', N'Lê Thảo Nguyên', N'Nữ', '1985-06-12', N'Vợ'),
    ('NV0009', N'Trần Thanh Nhàn', N'Nữ', '1979-05-30', N'Chị')
INSERT INTO THENHANVIEN (MANV, NGAYCAP)
VALUES
	('NV0001', '2018-03-05'),
	('NV0002', '2019-03-17'),
	('NV0003', '2020-01-01'),
	('NV0004', '2020-05-10'),
	('NV0005', '2021-12-20');


SELECT * FROM PHONGBAN
SELECT * FROM NHANVIEN
SELECT * FROM DEAN
SELECT * FROM PHANCONG
SELECT * FROM THANNHAN
SELECT * FROM THENHANVIEN

--Truy vấn
--1. Tạo bảng ảo lưu trữ danh sách nhân viên (Mã NV, họ tên), ngày cấp thẻ nhân
--viên tương ứng với từng nhân viên?
SELECT NV.MANV, NV.HOTEN, TN.NGAYCAP AS NGAYCAPTHE
FROM NHANVIEN NV
JOIN THENHANVIEN TN ON NV.MANV = TN.MANV;
--2. Tìm những nhân viên (MANV, HOTEN, NGAYSINH, DIACHI, PHAI,
--LUONG, MANQL, MAPH) có lương trên 10.000.000 đồng.
SELECT MANV, HOTEN, NGAYSINH, DIACHI, PHAI, LUONG, MANQL, MAPH
FROM NHANVIEN
WHERE LUONG > 10000000;
--3. Cho biết họ tên của những nhân viên nam ở TP. HCM hoặc nhân viên nữ ở Hà Nội.
SELECT HOTEN
FROM NHANVIEN
WHERE (PHAI = 'Nam' AND DIACHI = 'TP. HCM') OR (PHAI = 'Nữ' AND DIACHI = 'Hà Nội');
--4. Cho biết mã người quản lý của nhân viên Nguyễn Kim Ánh.
SELECT MANV FROM NHANVIEN
WHERE HOTEN = N'Nguyễn Kim Ánh'
--5. Tìm mã và họ tên những nhân viên thuộc phòng Quản trị.
SELECT MANV, HOTEN
FROM NHANVIEN
WHERE MAPH IN (SELECT MAPH FROM PHONGBAN WHERE TENPH = N'Quản trị');
--6. Liệt kê danh sách gồm mã, họ tên và địa chỉ của những nhân viên thuộc phòng Nhân sự.
SELECT MANV, HOTEN, DIACHI
FROM NHANVIEN
WHERE MAPH IN (SELECT MAPH FROM PHONGBAN WHERE TENPH = N'Nhân sự');
--7. Cho biết ngày sinh, địa chỉ và tên phòng làm việc của nhân viên Trần Lệ Quyên.
SELECT NGAYSINH, DIACHI, TENPH
FROM NHANVIEN
JOIN PHONGBAN ON NHANVIEN.MAPH = PHONGBAN.MAPH
WHERE HOTEN = N'Trần Lệ Quyên';
--8. Tìm những nhân viên có lương lớn hơn 15.000.000 đồng ở phòng Nhân sự hoặc
--lương lớn hơn 20.000.000 đồng ở phòng Quản trị. Thông tin bao gồm tất cả các cột trên bảng NHANVIEN.
SELECT * FROM NHANVIEN
SELECT *
FROM NHANVIEN
WHERE (MAPH IN (SELECT MAPH FROM PHONGBAN WHERE TENPH = N'Nhân sự') AND LUONG > 15000000)
   OR (MAPH IN (SELECT MAPH FROM PHONGBAN WHERE TENPH = N'Quản trị') AND LUONG > 20000000);
--9. Phòng Quản trị có bao nhiêu nhân viên?
SELECT COUNT(*) AS SOLUONGNHANVIEN
FROM NHANVIEN
WHERE MAPH IN (SELECT MAPH FROM PHONGBAN WHERE TENPH = N'Quản trị');
--10. Tìm tên những nữ nhân viên và tên người thân của họ.
SELECT NV.HOTEN, TN.TENTN
FROM NHANVIEN NV
JOIN THANNHAN TN ON NV.MANV = TN.MANV
WHERE NV.PHAI = N'Nữ';
--11. Với mỗi nhân viên cho biết họ tên và số người thân của nhân viên đó.
SELECT NV.MANV, NV.HOTEN, COUNT(TN.MANV) AS SoNguoiThan
FROM NHANVIEN NV
LEFT JOIN THANNHAN TN ON NV.MANV = TN.MANV
GROUP BY NV.MANV, NV.HOTEN;
--12. Với mỗi phòng ban liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc cho phòng ban đó.
SELECT PB.TENPH, AVG(NV.LUONG) AS LuongTrungBinh
FROM PHONGBAN PB
INNER JOIN NHANVIEN NV ON PB.MAPH = NV.MAPH
GROUP BY PB.TENPH;
--13. Cho biết danh sách những nhân viên (MANV, HOTEN) có trên hai thân nhân.
SELECT TN.MANV, NV.HOTEN
FROM THANNHAN TN
INNER JOIN NHANVIEN NV ON TN.MANV = NV.MANV
GROUP BY TN.MANV, NV.HOTEN
HAVING COUNT(*) >= 2;
--14. Cho biết danh sách những nhân viên (MANV, HOTEN) không có thân nhân.
SELECT NV.MANV, NV.HOTEN
FROM NHANVIEN NV
LEFT JOIN THANNHAN TN ON NV.MANV = TN.MANV
WHERE TN.MANV IS NULL;
--15. Cho biết mã và họ tên nhân viên có lương thấp nhất.
SELECT MANV, HOTEN
FROM NHANVIEN
WHERE LUONG = (SELECT MIN(LUONG) FROM NHANVIEN);
--16. Cho biết mã và họ tên nhân viên có lương cao nhất phòng Nhân sự.
SELECT NHANVIEN.MANV, NHANVIEN.HOTEN
FROM NHANVIEN
JOIN PHONGBAN ON NHANVIEN.MAPH = PHONGBAN.MAPH
WHERE PHONGBAN.TENPH = N'Nhân sự'
AND NHANVIEN.LUONG = (SELECT MAX(LUONG) FROM NHANVIEN WHERE MAPH = PHONGBAN.MAPH);
--17. Cho biết tên những đề án có ít nhất hai nhân viên tham gia.
SELECT DEAN.TENDA
FROM DEAN
JOIN PHANCONG ON DEAN.MADA = PHANCONG.MADA
GROUP BY DEAN.TENDA
HAVING COUNT(DISTINCT PHANCONG.MANV) >= 2;
--18. Những nhân viên nào (MANV, HOTEN) tham gia cả hai đề án DA003 và DA004?
SELECT NV.MANV,HOTEN FROM NHANVIEN NV,PHANCONG PC
WHERE NV.MANV = PC.MANV AND PC.MADA = 'DA003' 
INTERSECT
SELECT NV.MANV,HOTEN FROM NHANVIEN NV,PHANCONG PC
WHERE NV.MANV = PC.MANV AND PC.MADA = 'DA001' 

SELECT NV.MANV, NV.HOTEN
FROM NHANVIEN NV
JOIN PHANCONG PC1 ON NV.MANV = PC1.MANV
JOIN PHANCONG PC2 ON NV.MANV = PC2.MANV
WHERE PC1.MADA = 'DA003' AND PC2.MADA = 'DA004';
--19. Những nhân viên nào (HOTEN) có lương lớn hơn lương cao nhất của các nhân viên phòng Quản trị?
SELECT NV.HOTEN
FROM NHANVIEN NV
JOIN PHONGBAN PB ON NV.MAPH = PB.MAPH
WHERE NV.LUONG > (
    SELECT MAX(LUONG)
    FROM NHANVIEN
    WHERE MAPH = 'PH002'
);
--20. Phòng ban nào có số nhân viên nhiều hơn số nhân viên của phòng Kế hoạch?
SELECT PB.TENPH, COUNT(NV.MANV) AS SO_NHANVIEN
FROM PHONGBAN PB
JOIN NHANVIEN NV ON PB.MAPH = NV.MAPH
WHERE PB.MAPH <> 'PH001'
GROUP BY PB.TENPH
HAVING COUNT(NV.MANV) > (
    SELECT COUNT(NV.MANV)
    FROM PHONGBAN PB
    JOIN NHANVIEN NV ON PB.MAPH = NV.MAPH
    WHERE PB.MAPH = 'PH001'
);
--21. Liệt kê ba nhân viên (MANV, HOTEN) có mức lương cao nhất.
SELECT TOP 3 MANV, HOTEN
FROM NHANVIEN
ORDER BY LUONG DESC;
--22. Cập nhật tăng 10% lương cho những nhân viên đã từng tham gia ít nhất hai đề án.
SELECT * FROM NHANVIEN
UPDATE NHANVIEN
SET LUONG = LUONG * 1.1
WHERE MANV IN (
  SELECT MANV
  FROM PHANCONG
  GROUP BY MANV
  HAVING COUNT(DISTINCT MADA) >= 2
);
--23. Cho biết mã và họ tên những nhân viên tham gia tất cả các đề án.
SELECT NHANVIEN.MANV,NHANVIEN.HOTEN
FROM NHANVIEN
WHERE NOT EXISTS (
SELECT DEAN.MADA FROM DEAN 
WHERE NOT EXISTS (
SELECT PHANCONG.MADA FROM PHANCONG 
	WHERE PHANCONG.MADA = DEAN.MADA
	AND PHANCONG.MANV = NHANVIEN.MANV));
--24. Có bao nhiêu đề án bắt đầu từ ngày 01/01/2016?
SELECT COUNT(*) AS SOLUONGDEAN
FROM DEAN
WHERE NGAYBD = '2016-01-01';
--25. Tầng 1 nhà A có bao nhiêu phòng ban?
SELECT COUNT(*) SOLUONGPBTANG1
FROM PHONGBAN
WHERE DIADIEM = N'Tầng 1 nhà A';
