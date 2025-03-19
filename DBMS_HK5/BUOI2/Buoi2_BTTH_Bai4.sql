CREATE DATABASE Buoi2_BTTH_Bai4;
USE Buoi2_BTTH_Bai4;

CREATE TABLE DOCGIA (
    MADG VARCHAR(10) PRIMARY KEY,
    TENDG NVARCHAR(50),
    DIACHI NVARCHAR(50)
);

CREATE TABLE SACH (
    MASH VARCHAR(10) PRIMARY KEY,
    TENSH NVARCHAR(50),
    LOAI NVARCHAR(50),
    NXB NVARCHAR(50),
    NAMXB DATE,
    TACGIA NVARCHAR(50),
    TINHTRANG NVARCHAR(50)
);

CREATE TABLE MUONSACH (
    MADG VARCHAR(10),
    MASH VARCHAR(10),
    NGAYMUON DATE,
    NGAYTRA DATE,
    FOREIGN KEY (MADG) REFERENCES DOCGIA(MADG),
    FOREIGN KEY (MASH) REFERENCES SACH(MASH)
);

ALTER TABLE MUONSACH
ADD FOREIGN KEY (MADG) REFERENCES DOCGIA(MADG);

ALTER TABLE MUONSACH
ADD FOREIGN KEY (MASH) REFERENCES SACH(MASH);

INSERT INTO DOCGIA (MADG, TENDG, DIACHI)
VALUES
    ('DG001', N'Nguyễn Văn Anh', N'Hà Nội'),
    ('DG002', N'Trần Thị Bảnh', N'Hồ Chí Minh'),
    ('DG003', N'Lê Văn Công', N'Đà Nẵng'),
    ('DG004', N'Phạm Thị Linh', N'Hải Phòng'),
    ('DG005', N'Vũ Văn Em', N'Cần Thơ');

INSERT INTO SACH (MASH, TENSH, LOAI, NXB, NAMXB, TACGIA, TINHTRANG)
VALUES
    ('SH001', N'Sách Tiểu Thuyết 1', N'Tiểu Thuyết', N'Kim Đồng', '2020-01-01', N'Tác Giả 1', N'Đã Mượn'),
    ('SH002', N'Sách Tiểu Thuyết 2', N'Tiểu Thuyết', N'Kim Đồng', '2020-02-01', N'Tác Giả 2', N'Đã Mượn'),
    ('SH003', N'Sách Tiểu Thuyết 3', N'Tiểu Thuyết', N'Kim Đồng', '2020-03-01', N'Tác Giả 3', N'Đã Mượn'),
    ('SH004', N'Sách Tiểu Thuyết 4', N'Tiểu Thuyết', N'Kim Đồng', '2020-04-01', N'Tác Giả 4', N'Đã Mượn');

INSERT INTO SACH (MASH, TENSH, LOAI, NXB, NAMXB, TACGIA, TINHTRANG)
VALUES
    ('SH005', N'Sách Anime 1', N'Anime', N'Phương Nam', '2019-12-01', N'Tác Giả 1', N'Đã Mượn'),
    ('SH006', N'Sách Anime 2', N'Anime', N'Phương Nam', '2020-01-01', N'Tác Giả 2', N'Đã Mượn'),
    ('SH007', N'Sách Anime 3', N'Anime', N'Phương Nam', '2020-02-01', N'Tác Giả 3', N'Đã Mượn'),
    ('SH008', N'Sách Anime 4', N'Anime', N'Phương Nam', '2020-03-01', N'Tác Giả 4', N'Đã Mượn');

INSERT INTO SACH (MASH, TENSH, LOAI, NXB, NAMXB, TACGIA, TINHTRANG)
VALUES
    ('SH009', N'Sách Comic 1', N'Comic', N'Kim Đồng', '2021-03-15', N'Tác Giả 1', N'Đã Mượn'),
    ('SH010', N'Sách Comic 2', N'Comic', N'Kim Đồng', '2021-04-15', N'Tác Giả 2', N'Đã Mượn'),
    ('SH011', N'Sách Comic 3', N'Comic', N'Kim Đồng', '2021-05-15', N'Tác Giả 3', N'Đã Mượn'),
    ('SH012', N'Sách Comic 4', N'Comic', N'Kim Đồng', '2021-06-15', N'Tác Giả 4', N'Đã Mượn');

INSERT INTO MUONSACH (MADG, MASH, NGAYMUON, NGAYTRA)
VALUES ('DG001', 'SH001', '2023-10-01', NULL),
       ('DG001', 'SH002', '2023-10-02', NULL);

INSERT INTO MUONSACH (MADG, MASH, NGAYMUON, NGAYTRA)
VALUES ('DG002', 'SH003', '2023-10-03', '2023-10-17'),
       ('DG002', 'SH004', '2023-10-04', '2023-10-18');

INSERT INTO MUONSACH (MADG, MASH, NGAYMUON, NGAYTRA)
VALUES ('DG003', 'SH005', '2023-10-05', '2023-10-19'),
       ('DG003', 'SH006', '2023-10-06', '2023-10-20');

INSERT INTO MUONSACH (MADG, MASH, NGAYMUON, NGAYTRA)
VALUES ('DG004', 'SH007', '2023-10-07', '2023-10-21'),
       ('DG004', 'SH008', '2023-10-08', '2023-10-22');
SELECT * FROM MUONSACH
--c. Viết thủ tục trả về tên đọc giả và địa chỉ dựa vào mã đọc giả:

CREATE PROCEDURE TenVaDiaChiDocGia
    @MADG VARCHAR(10)
AS
BEGIN
    SELECT TENDG, DIACHI
    FROM DOCGIA
    WHERE MADG = @MADG;
END;

EXEC TenVaDiaChiDocGia @MADG = 'DG001'
--d. Viết thủ tục trả về tên sách, năm xuất bản và tác giả dựa vào mã sách:
CREATE PROCEDURE TenSachNamXBVaTacGia
    @MASH VARCHAR(10)
AS
BEGIN
    SELECT TENSH, NAMXB, TACGIA
    FROM SACH
    WHERE MASH = @MASH;
END;

EXEC TenSachNamXBVaTacGia @MASH = 'SH001'
--e. Viết thủ tục trả về số lượng sách mà đọc giả đang mượn
CREATE PROCEDURE SoLuongSachMuonCuaDocGia
    @MADG VARCHAR(10)
AS
BEGIN
    SELECT COUNT(*) AS SoLuongSachDangMuon
    FROM MUONSACH
    WHERE MADG = @MADG AND NGAYTRA IS NULL;
END;

EXEC SoLuongSachMuonCuaDocGia @MADG = 'DG001'
--f. Viết thủ tục trả về tên đọc giả mà mượn sách dựa vào mã sách:

CREATE PROCEDURE DocGiaMuonSach
    @MASH VARCHAR(10)
AS
BEGIN
    SELECT DG.TENDG
    FROM DOCGIA DG
    JOIN MUONSACH MS ON DG.MADG = MS.MADG
    WHERE MS.MASH = @MASH AND MS.NGAYTRA IS NULL;
END; 
EXEC DocGiaMuonSach @MASH = 'SH001';

--g. Viết thủ tục trả về số sách mà đọc giả mượn trong một ngày/tháng/năm cụ thể:
CREATE PROCEDURE SoSachMuonTheoNgay
    @MADG VARCHAR(10),
    @Ngay DATE
AS
BEGIN
    SELECT COUNT(*) AS SoSachMuon
    FROM MUONSACH
    WHERE MADG = @MADG AND CAST(NGAYMUON AS DATE) = @Ngay;
END;
EXEC SoSachMuonTheoNgay @MADG = 'DG003', @Ngay = '2023-10-05';

--h. Viết thủ tục trả về ngày mà sách được mượn gần nhất:
CREATE PROCEDURE NgayMuonGanNhat
    @MASH VARCHAR(10)
AS
BEGIN
    SELECT TOP 1 NGAYMUON
    FROM MUONSACH
    WHERE MASH = @MASH
    ORDER BY NGAYMUON DESC;
END;
EXEC NgayMuonGanNhat @MASH = 'SH002';
-- FUNCTION
CREATE FUNCTION TenVaDiaChiDocGiaFun (@MADG VARCHAR(10))
RETURNS TABLE
AS
RETURN (
    SELECT TENDG, DIACHI
    FROM DOCGIA
    WHERE MADG = @MADG
);
SELECT * FROM dbo.TenVaDiaChiDocGiaFun('DG001');

CREATE FUNCTION TenSachNamXBVaTacGiaFun (@MASH VARCHAR(10))
RETURNS TABLE
AS
RETURN (
    SELECT TENSH, NAMXB, TACGIA
    FROM SACH
    WHERE MASH = @MASH
);
SELECT * FROM dbo.TenSachNamXBVaTacGiaFun('SH001');

CREATE FUNCTION SoLuongSachMuonCuaDocGiaFun (@MADG VARCHAR(10))
RETURNS INT
AS
BEGIN
    DECLARE @SoLuong INT;
    SELECT @SoLuong = COUNT(*)
    FROM MUONSACH
    WHERE MADG = @MADG AND NGAYTRA IS NULL;
    RETURN @SoLuong;
END;
SELECT dbo.SoLuongSachMuonCuaDocGiaFun('DG001');

CREATE FUNCTION DocGiaMuonSachFun (@MASH VARCHAR(10))
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @TenDocGia NVARCHAR(50);
    SELECT @TenDocGia = DG.TENDG
    FROM DOCGIA DG
    JOIN MUONSACH MS ON DG.MADG = MS.MADG
    WHERE MS.MASH = @MASH AND MS.NGAYTRA IS NULL;
    RETURN @TenDocGia;
END;
SELECT dbo.DocGiaMuonSachFun('SH001');

CREATE FUNCTION SoSachMuonTheoNgayFun (@MADG VARCHAR(10), @Ngay DATE)
RETURNS INT
AS
BEGIN
    DECLARE @SoLuong INT;
    SELECT @SoLuong = COUNT(*)
    FROM MUONSACH
    WHERE MADG = @MADG AND CAST(NGAYMUON AS DATE) = @Ngay;
    RETURN @SoLuong;
END;
SELECT dbo.SoSachMuonTheoNgayFun('DG003', '2023-10-05');

CREATE FUNCTION NgayMuonGanNhatFun (@MASH VARCHAR(10))
RETURNS DATE
AS
BEGIN
    DECLARE @NgayMuon DATE;
    SELECT TOP 1 @NgayMuon = NGAYMUON
    FROM MUONSACH
    WHERE MASH = @MASH
    ORDER BY NGAYMUON DESC;
    RETURN @NgayMuon;
END;
SELECT dbo.NgayMuonGanNhatFun('SH002');

