
CREATE DATABASE Buoi1_QLHV_Bai4 ON PRIMARY
(
    NAME = DBQLHV_PRIMARY,
    FILENAME = 'D:\VIsual Studio Code - Github\DBMS\THUCHANH\Buoi1\Bai4_QLHV\DBQLHV_PRIMARY.mdf',
    SIZE = 5MB,
    MAXSIZE = 10MB,
    FILEGROWTH = 10%
)
LOG ON
(
    NAME = DBQLHV_LOG,
    FILENAME = 'D:\VIsual Studio Code - Github\DBMS\THUCHANH\Buoi1\Bai4_QLHV\DBQLHV_LOG.ldf',
    SIZE = 2MB,
    MAXSIZE = 5MB,
    FILEGROWTH = 15%
);
USE Buoi1_QLHV_Bai4


-- Tạo bảng HOCVIEN
CREATE TABLE HOCVIEN (
  MaHV VARCHAR(10) PRIMARY KEY,
  TenHocVien NVARCHAR(50),
  NgaySinh DATE,
  MaLop VARCHAR(10),
  TinhTrang NVARCHAR(20) CHECK (TinhTrang IN (N'ĐANG HỌC', N'BUỘC THÔI HỌC', N'ĐÃ TỐT NGHIỆP')),
)

-- Tạo bảng GIAOVIEN
CREATE TABLE GIAOVIEN (
  MaGV VARCHAR(10) PRIMARY KEY,
  TenGV NVARCHAR(50),
  NgaySinh DATE,
  GioiTinh NVARCHAR(5) CHECK (GioiTinh IN (N'Nam', N'Nữ')),
  DienThoai NVARCHAR(11),
  MaGVQL VARCHAR(10)
)

-- Tạo bảng LOPHOC
CREATE TABLE LOPHOC (
  MaLop VARCHAR(10) PRIMARY KEY,
  SiSo INT,
  MaHVTruongLop VARCHAR(10),
  MaGVQL VARCHAR(10),
  NamBatDau INT,
  NamKetThuc INT,
  CONSTRAINT CHK_SISSO CHECK (SiSo > 0),
  CONSTRAINT CHK_NAM CHECK (NamBatDau < NamKetThuc),

)

-- Tạo bảng MONHOC
CREATE TABLE MONHOC (
  MaMH VARCHAR(10) PRIMARY KEY,
  TenMH NVARCHAR(50),
  SoTinChi INT
)

-- Tạo bảng KETQUA
CREATE TABLE KETQUA (
  MaHV VARCHAR(10),
  MaMH VARCHAR(10),
  LanThi INT,
  Diem FLOAT,
  PRIMARY KEY (MaHV, MaMH, LanThi)
)

-- Tạo bảng GIAOVIEN_DAY_MONHOC
CREATE TABLE GIAOVIEN_DAY_MONHOC (
  MaGV VARCHAR(10),
  MaMH VARCHAR(10),
  PRIMARY KEY (MaGV, MaMH),
  CONSTRAINT FK_GVDM FOREIGN KEY (MaGV) REFERENCES GIAOVIEN(MaGV),
  CONSTRAINT FK_MHDM FOREIGN KEY (MaMH) REFERENCES MONHOC(MaMH)
)

-- Tạo bảng PHANCONG
CREATE TABLE PHANCONG (
  MaGV VARCHAR(10),
  MaMH VARCHAR(10),
  MaLop VARCHAR(10),
  PRIMARY KEY (MaGV, MaMH, MaLop),
  CONSTRAINT FK_GVPC FOREIGN KEY (MaGV) REFERENCES GIAOVIEN(MaGV),
  CONSTRAINT FK_MHPC FOREIGN KEY (MaMH) REFERENCES MONHOC(MaMH),
  CONSTRAINT FK_LOPPC FOREIGN KEY (MaLop) REFERENCES LOPHOC(MaLop)
)

-- Thêm khóa ngoại từ bảng HOCVIEN
ALTER TABLE HOCVIEN
ADD CONSTRAINT FK_HOCVIEN_LOP FOREIGN KEY (MaLop) REFERENCES LOPHOC(MaLop);

-- Thêm khóa ngoại từ bảng GIAOVIEN
ALTER TABLE GIAOVIEN
ADD CONSTRAINT FK_GIAOVIEN_GVQL FOREIGN KEY (MaGVQL) REFERENCES GIAOVIEN(MaGV);

-- Thêm khóa ngoại từ bảng LOPHOC đến bảng HOCVIEN
ALTER TABLE LOPHOC
ADD CONSTRAINT FK_LOPHOC_HVTL FOREIGN KEY (MaHVTruongLop) REFERENCES HOCVIEN(MaHV);

-- Thêm khóa ngoại từ bảng LOPHOC đến bảng GIAOVIEN
ALTER TABLE LOPHOC
ADD CONSTRAINT FK_LOPHOC_GVQL FOREIGN KEY (MaGVQL) REFERENCES GIAOVIEN(MaGV);

-- Thêm khóa ngoại từ bảng KETQUA đến bảng HOCVIEN
ALTER TABLE KETQUA
ADD CONSTRAINT FK_KETQUA_HOCVIEN FOREIGN KEY (MaHV) REFERENCES HOCVIEN(MaHV);

-- Thêm khóa ngoại từ bảng KETQUA đến bảng MONHOC
ALTER TABLE KETQUA
ADD CONSTRAINT FK_KETQUA_MONHOC FOREIGN KEY (MaMH) REFERENCES MONHOC(MaMH);

-- Thêm khóa ngoại từ bảng GIAOVIEN_DAY_MONHOC đến bảng GIAOVIEN
ALTER TABLE GIAOVIEN_DAY_MONHOC
ADD CONSTRAINT FK_GVDM_GIAOVIEN FOREIGN KEY (MaGV) REFERENCES GIAOVIEN(MaGV);

-- Thêm khóa ngoại từ bảng GIAOVIEN_DAY_MONHOC đến bảng MONHOC
ALTER TABLE GIAOVIEN_DAY_MONHOC
ADD CONSTRAINT FK_GVDM_MONHOC FOREIGN KEY (MaMH) REFERENCES MONHOC(MaMH);

-- Thêm khóa ngoại từ bảng PHANCONG đến bảng GIAOVIEN
ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PHANCONG_GIAOVIEN FOREIGN KEY (MaGV) REFERENCES GIAOVIEN(MaGV);

-- Thêm khóa ngoại từ bảng PHANCONG đến bảng MONHOC
ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PHANCONG_MONHOC FOREIGN KEY (MaMH) REFERENCES MONHOC(MaMH);

-- Thêm khóa ngoại từ bảng PHANCONG đến bảng LOPHOC
ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PHANCONG_LOPHOC FOREIGN KEY (MaLop) REFERENCES LOPHOC(MaLop);


-- Thêm dữ liệu vào bảng HOCVIEN
INSERT INTO HOCVIEN (MaHV, TenHocVien, NgaySinh, MaLop, TinhTrang)
VALUES
('HV001', N'Lê Văn A', '1990-03-04', 'LOP001', N'ĐANG HỌC'),
('HV002', N'Trần Thị B', '1992-05-11', 'LOP002', N'ĐANG HỌC'),
('HV003', N'Nguyễn Văn C', '1993-07-20', 'LOP003', N'BUỘC THÔI HỌC'),
('HV004', N'Lê Thị D', '1995-02-14', 'LOP001', N'ĐÃ TỐT NGHIỆP'),
('HV005', N'Trần Minh An', '1999-04-08', 'LOP002', N'ĐANG HỌC');

-- Thêm dữ liệu vào bảng GIAOVIEN  
INSERT INTO GIAOVIEN (MaGV, TenGV, NgaySinh, GioiTinh, DienThoai, MaGVQL)
VALUES
('GV001', N'Nguyễn Văn An', '1970-01-01', N'Nam', '0123456789', NULL),
('GV002', N'Lê Thị Như Lan', '1975-05-05', N'Nữ', '0987654321', NULL),
('GV003', N'Trần Văn Gìau', '1980-09-09', N'Nam', '0246810121', NULL);
SELECT * FROM GIAOVIEN
UPDATE GIAOVIEN
SET MaGVQL = 'GV003'
WHERE MaGV = 'GV003';
-- Thêm dữ liệu vào bảng LOPHOC
INSERT INTO LOPHOC (MaLop, SiSo, MaHVTruongLop, MaGVQL, NamBatDau, NamKetThuc)  
VALUES
('LOP001', 15, NULL, NULL, 2010, 2014),
('LOP002', 12, NULL, NULL, 2012, 2016),
('LOP003', 10, NULL, NULL, 2011, 2015);
SELECT * FROM LOPHOC
UPDATE LOPHOC
SET MaGVQL = 'GV003'
WHERE MaLop = 'LOP003';
-- Thêm dữ liệu vào bảng MONHOC
INSERT INTO MONHOC (MaMH, TenMH, SoTinChi)
VALUES
('MH00001', N'Tin học căn bản', 3),
('MH00002', N'Lập trình C++', 4),
('MH00003', N'Cấu trúc dữ liệu và giải thuật', 3),
('MH00004', N'Hệ quản trị CSDL', 4),
('MH00005', N'Mạng máy tính', 3),
('MH00006', N'Tiếng Anh 1', 2),
('MH00007', N'Tiếng Anh 2', 2),
('MH00008', N'Kinh tế chính trị', 2),
('MH00009', N'Marketing căn bản', 3);

-- Thêm dữ liệu vào bảng KETQUA
INSERT INTO KETQUA (MaHV, MaMH, LanThi, Diem)
VALUES
('HV001', 'MH00001', 1, 7),
('HV001', 'MH00002', 1, 8),
('HV001', 'MH00003', 1, 6.5),
('HV002', 'MH00001', 1, 5),
('HV002', 'MH00001', 2, 6),
('HV002', 'MH00002', 1, 6),  
('HV002', 'MH00002', 2, 7),
('HV003', 'MH00002', 1, 4),
('HV005', 'MH00009', 1, 4),
('HV005', 'MH00009', 2, 4.5);

-- Thêm dữ liệu vào bảng GIAOVIEN_DAY_MONHOC
INSERT INTO GIAOVIEN_DAY_MONHOC (MaGV, MaMH)
VALUES  
('GV001', 'MH00001'),
('GV001', 'MH00002'),
('GV001', 'MH00003'),
('GV002', 'MH00004'),
('GV002', 'MH00005'),
('GV003', 'MH00006'),
('GV003', 'MH00007');

-- Thêm dữ liệu vào bảng PHANCONG
INSERT INTO PHANCONG (MaGV, MaMH, MaLop)
VALUES
('GV001', 'MH00001', 'LOP001'), 
('GV001', 'MH00002', 'LOP001'),
('GV001', 'MH00003', 'LOP001'),
('GV002', 'MH00004', 'LOP002'),
('GV002', 'MH00005', 'LOP002'),  
('GV003', 'MH00006', 'LOP003'),
('GV003', 'MH00007', 'LOP003');
--Truy Vấn
--1. Cho biết họ tên và tuổi của các giáo viên nữ.
SELECT TenGV AS N'Họ và Tên', DATEDIFF(YEAR, NgaySinh, GETDATE()) AS Tuoi
FROM GIAOVIEN
WHERE GioiTinh = N'Nữ';
--2. Cho biết họ tên, tình trạng của học viên có mã số HV001.
SELECT TenHocVien, TinhTrang AS N'Tình Trạng Của Học Viên'
FROM HOCVIEN
WHERE MaHV = 'HV001';
--3. Cho biết họ tên của các học viên nhỏ hơn hoặc bằng 20 tuổi.
SELECT TenHocVien
FROM HOCVIEN
WHERE DATEDIFF(YEAR, NgaySinh, GETDATE()) <= 20;
--4. Cho biết mã số các lớp có sĩ số học viên trong khoảng từ 2 đến 4.
SELECT MaLop
FROM LOPHOC
WHERE SiSo BETWEEN 2 AND 4;
--5. Cho biết mã, họ tên, ngày sinh của các giáo viên mang họ Nguyễn.
SELECT MaGV, TenGV, NgaySinh
FROM GIAOVIEN
WHERE TenGV LIKE N'Nguyễn%';
--6. Cho biết họ tên các giáo viên chưa có giáo viên quản lý.
SELECT TenGV
FROM GIAOVIEN
WHERE MaGVQL IS NULL;
--7. Cho biết mã số các giáo viên có quản lý một giáo viên nào đó.
SELECT MaGV
FROM GIAOVIEN
WHERE MaGVQL IS NOT NULL;
--8. Cho biết mã số, họ tên các học viên có làm trưởng lớp.
SELECT MaHV, TenHocVien
FROM HOCVIEN
WHERE MaHV IN (SELECT DISTINCT MaHVTruongLop FROM LOPHOC WHERE MaHVTruongLop IS NOT NULL);

--9. Cho biết mã số, tên các môn mà học viên HV000005 đã từng thi rớt, học viên được
--xem là rớt khi điểm lần thi sau cùng của một môn là dưới 5.
SELECT DISTINCT MH.MaMH, MH.TenMH
FROM MONHOC MH
JOIN KETQUA KQ ON MH.MaMH = KQ.MaMH
WHERE KQ.MaHV = 'HV005' AND KQ.Diem < 5;
--10. Cho biết mã số các học viên từng thi môn MH009 nhiều hơn 1 lần.
SELECT MaHV
FROM KETQUA
WHERE MaMH = 'MH009'
GROUP BY MaHV
HAVING COUNT(LanThi) > 1;
--11. Cho biết mã học viên, tên học viên có điểm thi cao nhất môn MH00009.
SELECT TOP 1 KQ.MaHV, HV.TenHocVien
FROM KETQUA KQ
JOIN HOCVIEN HV ON KQ.MaHV = HV.MaHV
WHERE KQ.MaMH = 'MH009'
ORDER BY KQ.Diem DESC;
--12. Cho biết họ tên và tuổi của học viên nhỏ tuổi nhất.
SELECT TOP 1 TenHocVien, DATEDIFF(YEAR, NgaySinh, GETDATE()) AS Tuoi
FROM HOCVIEN
ORDER BY NgaySinh ASC;
--13. Cho biết mã, tên và số tín chỉ của môn học có nhiều học viên thi rớt nhất.
WITH RongRank AS (
  SELECT MH.MaMH, MH.TenMH, MH.SoTinChi, KQ.MaHV, KQ.Diem,
         RANK() OVER(PARTITION BY MH.MaMH ORDER BY KQ.Diem) AS Ranking
  FROM MONHOC MH
  JOIN KETQUA KQ ON MH.MaMH = KQ.MaMH
  WHERE KQ.Diem < 5
)
SELECT DISTINCT MaMH, TenMH, SoTinChi
FROM RongRank
WHERE Ranking = 1;
--14. Cho biết số môn mà học viên Trần Minh An đã thi đậu. Học viên được xem là
--đậu một môn học khi điểm lần thi sau cùng của môn đó lớn hơn hoặc bằng 5.
WITH ThiDau AS (
  SELECT KQ.MaMH
  FROM KETQUA KQ
  WHERE KQ.MaHV = 'HV005' AND KQ.Diem >= 5
)
SELECT COUNT(MaMH) AS SoMonHocDaDau
FROM ThiDau;
--15. Cho biết điểm trung bình của học viên HV004.
SELECT MaHV, SUM(Diem * SoTinChi) / SUM(SoTinChi) AS DiemTrungBinh
FROM KETQUA,MONHOC

WHERE MaHV = 'HV004' AND LanThi = (SELECT MAX(LanThi) FROM KETQUA WHERE MaHV = 'HV004')
GROUP BY MaHV;

--Điểm trung bình của học viên chỉ tính trên lần thi sau cùng theo công thức:
--Điểm trung bình = ∑(Điểm * Số tín chỉ) / ∑Số tín chỉ
--16. Cho biết số tín chỉ mà học viên Trần Minh An đm đạt được. số tín chỉ đạt được
--là tổng số tín chỉ các môn mà học viên đó đm thi đậu.
WITH PassedSubjects AS (
  SELECT KQ.MaMH, MH.SoTinChi
  FROM KETQUA KQ
  JOIN MONHOC MH ON KQ.MaMH = MH.MaMH
  WHERE KQ.MaHV = 'HV005' AND KQ.Diem >= 5
)
SELECT SUM(SoTinChi) AS SoTinChiDatDuoc
FROM PassedSubjects;

--17. Liệt kê những học viên đạt trên 8 tín chỉ. Thông tin bao gӗm: mã học viên, họ tên
--học viên và số tín chỉ đm đạt được. số tín chỉ đạt được là tổng số tín chỉ của tất
--cả các môn mà học viên đó đm thi đậu.
WITH PassedCredits AS (
  SELECT KQ.MaHV, SUM(MH.SoTinChi) AS SoTinChiDatDuoc
  FROM KETQUA KQ
  JOIN MONHOC MH ON KQ.MaMH = MH.MaMH
  WHERE KQ.Diem >= 5
  GROUP BY KQ.MaHV
)
SELECT HV.MaHV, HV.TenHocVien, PC.SoTinChiDatDuoc
FROM HOCVIEN HV
JOIN PassedCredits PC ON HV.MaHV = PC.MaHV
WHERE PC.SoTinChiDatDuoc > 8;

--18. Xuất ra danh sách học viên cùng điểm trung bình của học viên. Điểm trung bình
--tính theo công thức câu 15.
WITH DiemTrungBinhHV004 AS (
  SELECT SUM(KQ.Diem * MH.SoTinChi) / SUM(MH.SoTinChi) AS DiemTrungBinhHV004
  FROM KETQUA KQ
  JOIN MONHOC MH ON KQ.MaMH = MH.MaMH
  WHERE KQ.MaHV = 'HV004' AND KQ.LanThi = (SELECT MAX(LanThi) FROM KETQUA WHERE MaHV = 'HV004')
)
SELECT HV.MaHV, HV.TenHocVien, DTB.DiemTrungBinhHV004
FROM HOCVIEN HV
CROSS JOIN DiemTrungBinhHV004 DTB;

--19. Cho biết thông tin học viên đậu tất cả các môn học trong lần thi đầu tiên.
SELECT DISTINCT KQ.MaHV, HV.TenHocVien
FROM KETQUA KQ
JOIN HOCVIEN HV ON KQ.MaHV = HV.MaHV
WHERE NOT EXISTS (
  SELECT MaMH
  FROM MONHOC
  WHERE NOT EXISTS (
    SELECT MaMH
    FROM KETQUA
    WHERE MaHV = KQ.MaHV AND LanThi = 1
  )
);

--20. Cho biết thông tin lớp học có tất cả các học viên đậu tất cả các môn trong lần
--thi đầu tiên.
SELECT DISTINCT LH.MaLop, LH.SiSo
FROM LOPHOC LH
WHERE NOT EXISTS (
  SELECT HV.MaHV
  FROM HOCVIEN HV
  WHERE NOT EXISTS (
    SELECT MaMH
    FROM MONHOC
    WHERE NOT EXISTS (
      SELECT MaMH
      FROM KETQUA KQ
      WHERE KQ.MaHV = HV.MaHV AND KQ.LanThi = 1
    )
  )
);
--21. Cập nhật lại sĩ số thực của lớp học bằng số học viên trong lớp học đó
UPDATE LOPHOC
SET SiSo = (SELECT COUNT(MaHV) FROM HOCVIEN WHERE MaLop = LOPHOC.MaLop);
