CREATE DATABASE Buoi2_BTTH_Bai9
USE Buoi2_BTTH_Bai9

CREATE TABLE NHACUNGCAP (
    MANCC VARCHAR(10) PRIMARY KEY,
    TENNCC NVARCHAR(50),
    DCHI NVARCHAR(50),
    DTHOAI NVARCHAR(15)
);

CREATE TABLE MATHANG (
    MAMH VARCHAR(10) PRIMARY KEY,
    TENMH NVARCHAR(50),
    DVT NVARCHAR(50),
    QUYCACH NVARCHAR(50),
    SLTON INT CHECK(SLTON >= 0),
    DG INT,
    CHECK (DVT IN (N'lốc', N'chai', N'thùng', N'túi', N'bao', N'bình', N'hộp', N'hũ', N'gói', N'kg')),
    CHECK (QUYCACH IN (N'chai', N'gói', N'hộp', N'thùng'))
);

CREATE TABLE CUNGUNG (
    MANCC VARCHAR(10),
    MAMH VARCHAR(10),
    PRIMARY KEY (MANCC, MAMH),
    FOREIGN KEY (MANCC) REFERENCES NHACUNGCAP(MANCC),
    FOREIGN KEY (MAMH) REFERENCES MATHANG(MAMH)
);

CREATE TABLE DATHANG (
    SODH VARCHAR(10) PRIMARY KEY,
    NGAYDH DATE,
    MANCC VARCHAR(10),
    SL_MATHANG INT,
    GHICHU NVARCHAR(255),
    THANHTIEN INT,
    CHECK (SL_MATHANG > 0),
    FOREIGN KEY (MANCC) REFERENCES NHACUNGCAP(MANCC)
);

CREATE TABLE CTDH (
    SODH VARCHAR(10),
    MAMH VARCHAR(10),
    SLD INT,
    DGD INT,
    PRIMARY KEY (SODH, MAMH),
    CHECK (SLD >= 0),
    CHECK (DGD >= 0),
    FOREIGN KEY (SODH) REFERENCES DATHANG(SODH),
    FOREIGN KEY (MAMH) REFERENCES MATHANG(MAMH)
);

CREATE TABLE GIAOHANG (
    SOGH VARCHAR(10) PRIMARY KEY,
    NGAYGH DATE,
    SODH VARCHAR(10),
    CHECK (NGAYGH <= DATEADD(WEEK, 1, NGAYGH)), -- Kiểm tra điều kiện không giao hàng trễ hơn 1 tuần so với ngày đặt hàng
    FOREIGN KEY (SODH) REFERENCES DATHANG(SODH)
);

CREATE TABLE CTGH (
    SOGH VARCHAR(10),
    MAMH VARCHAR(10),
    SLG INT,
    DGG INT,
    PRIMARY KEY (SOGH, MAMH),
    CHECK (SLG > 0),
    CHECK (DGG >= 0),
    FOREIGN KEY (SOGH) REFERENCES GIAOHANG(SOGH),
    FOREIGN KEY (MAMH) REFERENCES MATHANG(MAMH)
);

-- h. Tổng số lượng giao của một mặt hàng trong một lần đặt hàng phải nhỏ hơn hoặc bằng số lượng đặt
CREATE TRIGGER CheckSLG_CTDH
ON CTDH
AFTER INSERT
AS
BEGIN
    IF (SELECT SUM(SLD) FROM inserted) > (SELECT SL_MATHANG FROM DATHANG WHERE SODH = (SELECT SODH FROM inserted))
    BEGIN
        PRINT N'Tổng số lượng giao của một mặt hàng phải nhỏ hơn hoặc bằng số lượng đặt';
        ROLLBACK;
    END
END;

-- i. Số mặt hàng trong đặt hàng phải bằng số các mặt hàng được đặt trong chi tiết đặt hàng của cùng một lần đặt hàng
CREATE TRIGGER CheckSL_Mathang_DATHANG
ON DATHANG
AFTER INSERT
AS
BEGIN
    IF (SELECT COUNT(*) FROM CTDH WHERE SODH = (SELECT SODH FROM inserted)) != (SELECT SL_MATHANG FROM inserted)
    BEGIN
       PRINT N'Số mặt hàng trong đơn đặt hàng phải bằng số các mặt hàng được đặt trong chi tiết đặt hàng';
        ROLLBACK;
    END
END;

-- j. Cập nhật lại số lượng tồn của mặt hàng một cách tự động mỗi khi nhà cung cấp giao hàng
CREATE TRIGGER UpdateSLTON_MATHANG
ON CTGH
AFTER INSERT
AS
BEGIN
    UPDATE MATHANG
    SET SLTON = SLTON - (SELECT SLG FROM inserted WHERE MAMH = MATHANG.MAMH)
    FROM MATHANG
    INNER JOIN inserted ON MATHANG.MAMH = inserted.MAMH;
END;

-- k. Tự động cập nhật thành tiền của một lần đặt hàng mỗi khi thêm 1 mặt hàng vào đơn đặt hàng đó
CREATE TRIGGER UpdateTHANHTIEN_DATHANG
ON CTDH
AFTER INSERT
AS
BEGIN
    UPDATE DATHANG
    SET THANHTIEN = THANHTIEN + (SELECT SLD * DGD FROM inserted WHERE SODH = DATHANG.SODH)
    FROM DATHANG
    INNER JOIN inserted ON DATHANG.SODH = inserted.SODH;
END;


--STORE PROC---
-- a. Danh sách các đơn đặt hàng của một nhà cung cấp, với MANCC là tham số input
CREATE PROCEDURE GetDATHANG_ByNHACUNGCAP
    @MANCC VARCHAR(10)
AS
BEGIN
    SELECT *
    FROM DATHANG
    WHERE MANCC = @MANCC;
END;

-- b. Tính thành tiền của một lần giao hàng, với SOGH là tham số input và THANHTIEN là tham số output
CREATE PROCEDURE CalculateTotalAmount_GIAOHANG
    @SOGH VARCHAR(10),
    @THANHTIEN INT OUTPUT
AS
BEGIN
    SELECT @THANHTIEN = SUM(SLG * DGG)
    FROM CTGH
    WHERE SOGH = @SOGH;
END;

-- c. Dùng từ khóa Return trả về số lượng mặt hàng mà một nhà cung cấp có thể cung ứng
CREATE PROCEDURE GetAvailableItemsCount_NHACUNGCAP
    @MANCC VARCHAR(10),
    @ItemCount INT OUTPUT
AS
BEGIN
    SELECT @ItemCount = COUNT(MAMH)
    FROM CUNGUNG
    WHERE MANCC = @MANCC;
END;

-- d. Viết hàm trả về 1 table gồm các thông tin sau: MAMH, SLD, DGD của một đơn đặt hàng bất kỳ
CREATE FUNCTION GetCTDHInfo
    (@SODH VARCHAR(10))
RETURNS TABLE
AS
RETURN
(
    SELECT MAMH, SLD, DGD
    FROM CTDH
    WHERE SODH = @SODH
);

Select * from MATHANG
INSERT INTO NHACUNGCAP (MANCC, TENNCC, DCHI, DTHOAI) VALUES
('NCC001', N'Nhà Cung Cấp A', N'123 ABC, Quận 1, TP.Hồ Chí Minh', '0795123456'),
('NCC002', N'Nhà Cung Cấp B', N'456 XYZ, Quận 9, TP.Hồ Chí Minh', '0769123456'),
('NCC003', N'Nhà Cung Cấp C', N'789 LMN, Quận 7, TP.Hồ Chí Minh', '0795123456');

INSERT INTO MATHANG (MAMH, TENMH, DVT, QUYCACH, SLTON, DG) VALUES
('MH001', N'Mặt Hàng 1', N'chai', N'chai', 100, 50000),
('MH002', N'Mặt Hàng 2', N'gói', N'gói', 50, 30000),
('MH003', N'Mặt Hàng 3', N'hộp', N'hộp', 80, 70000);

-- Chèn dữ liệu vào bảng CUNGUNG
INSERT INTO CUNGUNG (MANCC, MAMH) VALUES
('NCC001', 'MH001'),
('NCC002', 'MH001'),
('NCC002', 'MH002'),
('NCC003', 'MH003');

-- Chèn dữ liệu vào bảng DATHANG
INSERT INTO DATHANG (SODH, NGAYDH, MANCC, SL_MATHANG, GHICHU, THANHTIEN) VALUES
('DH001', GETDATE(), 'NCC001', 20, N'Giao hàng nhanh', NULL),
('DH002', GETDATE(), 'NCC002', 30, N'Đặt hàng gấp', NULL);

-- Chèn dữ liệu vào bảng CTDH
INSERT INTO CTDH (SODH, MAMH, SLD, DGD) VALUES
('DH001', 'MH001', 10, 50000),
('DH001', 'MH002', 10, 30000),
('DH002', 'MH001', 20, 50000),
('DH002', 'MH003', 10, 70000);

-- Chèn dữ liệu vào bảng GIAOHANG
INSERT INTO GIAOHANG (SOGH, NGAYGH, SODH) VALUES
('GH001', GETDATE(), 'DH001'),
('GH002', GETDATE(), 'DH002');

-- Chèn dữ liệu vào bảng CTGH
INSERT INTO CTGH (SOGH, MAMH, SLG, DGG) VALUES
('GH001', 'MH001', 5, 50000),
('GH001', 'MH002', 5, 30000),
('GH002', 'MH001', 10, 50000),
('GH002', 'MH003', 5, 70000);
