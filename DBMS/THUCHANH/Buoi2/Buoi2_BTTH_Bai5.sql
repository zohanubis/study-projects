CREATE DATABASE Buoi2_BTTH_Bai5;

USE Buoi2_BTTH_Bai5;

CREATE TABLE KHACH (
    MAKH VARCHAR(10) PRIMARY KEY,
    TENKH NVARCHAR(50),
    DCHI NVARCHAR(50),
    DTHOAI VARCHAR(15)
);

CREATE TABLE NHASX (
    MANSX VARCHAR(10) PRIMARY KEY,
    TENNSX NVARCHAR(50),
    DCHI NVARCHAR(50),
    DTHOAI VARCHAR(15)
);

CREATE TABLE NHACC (
    MANCC VARCHAR(10) PRIMARY KEY,
    TENNCC NVARCHAR(50),
    DCHI NVARCHAR(50),
    DTHOAI VARCHAR(15)
);

CREATE TABLE PHIEUNHAP (
    MAPN VARCHAR(10) PRIMARY KEY,
    NGAYNHAP DATE,
    MANCC VARCHAR(10),
    TIENNHAP DECIMAL(18, 2),
    FOREIGN KEY (MANCC) REFERENCES NHACC(MANCC)
);

CREATE TABLE HANG (
    MAHG VARCHAR(10) PRIMARY KEY,
    TENHG NVARCHAR(50),
    DVT NVARCHAR(10),
    SOLUONG INT,
    MANSX VARCHAR(10),
    MANCC VARCHAR(10),
    TINHTRANG NVARCHAR(50),
    FOREIGN KEY (MANSX) REFERENCES NHASX(MANSX),
    FOREIGN KEY (MANCC) REFERENCES NHACC(MANCC)
);

CREATE TABLE CHITIETPN (
    MAPN VARCHAR(10),
    MAHG VARCHAR(10),
    SOLUONG INT,
    GIANHAP DECIMAL(18, 2),
    THANHTIEN DECIMAL(18, 2),
    FOREIGN KEY (MAPN) REFERENCES PHIEUNHAP(MAPN),
    FOREIGN KEY (MAHG) REFERENCES HANG(MAHG)
);

CREATE TABLE HOADON (
    MAHD VARCHAR(10) PRIMARY KEY,
    NGAYBAN DATE,
    TENNV NVARCHAR(50),
    MAKH VARCHAR(10),
    TIENBAN DECIMAL(18, 2),
    GIAMGIA DECIMAL(18, 2),
    THANHTOAN DECIMAL(18, 2),
    FOREIGN KEY (MAKH) REFERENCES KHACH(MAKH)
);

CREATE TABLE CHITIETHD (
    MAHD VARCHAR(10),
    MAHG VARCHAR(10),
    SOLUONG INT,
    GIABAN DECIMAL(18, 2),
    THANHTIEN DECIMAL(18, 2),
    FOREIGN KEY (MAHD) REFERENCES HOADON(MAHD),
    FOREIGN KEY (MAHG) REFERENCES HANG(MAHG)
);

CREATE TABLE DONGIA (
    MAHG VARCHAR(10),
    NGAYCN DATE,
    GIA DECIMAL(18, 2),
    FOREIGN KEY (MAHG) REFERENCES HANG(MAHG)
);

INSERT INTO KHACH (MAKH, TENKH, DCHI, DTHOAI)
VALUES
    ('KH001', N'Nguyễn Văn An', N'Hà Nội', '0123456789'),
    ('KH002', N'Trần Thị Bảnh', N'Hồ Chí Minh', '0987654321'),
    ('KH003', N'Lê Văn Công', N'Đà Nẵng', '0369876543');

INSERT INTO NHASX (MANSX, TENNSX, DCHI, DTHOAI)
VALUES
    ('NSX001', N'Công ty A', N'Hà Nội', '0123456789'),
    ('NSX002', N'Công ty B', N'Hồ Chí Minh', '0987654321');

INSERT INTO NHACC (MANCC, TENNCC, DCHI, DTHOAI)
VALUES
    ('NCC001', N'Nhà cung cấp X', N'Hà Nội', '0123456789'),
    ('NCC002', N'Nhà cung cấp Y', N'Hồ Chí Minh', '0987654321');

INSERT INTO PHIEUNHAP (MAPN, NGAYNHAP, MANCC, TIENNHAP)
VALUES
    ('PN001', '2023-10-01', 'NCC001', 1000.00),
    ('PN002', '2023-10-02', 'NCC002', 1500.00);

INSERT INTO HANG (MAHG, TENHG, DVT, SOLUONG, MANSX, MANCC, TINHTRANG)
VALUES
    ('HG001', N'Sản phẩm A', N'Chiếc', 100, 'NSX001', 'NCC001', N'Còn hàng'),
    ('HG002', N'Sản phẩm B', N'Cái', 50, 'NSX002', 'NCC002', N'Hết hàng');

INSERT INTO CHITIETPN (MAPN, MAHG, SOLUONG, GIANHAP, THANHTIEN)
VALUES
    ('PN001', 'HG001', 10, 10.00, 100.00),
    ('PN002', 'HG002', 5, 20.00, 100.00);

INSERT INTO HOADON (MAHD, NGAYBAN, TENNV, MAKH, TIENBAN, GIAMGIA, THANHTOAN)
VALUES
    ('HD001', '2023-10-01', N'Nhân viên A', 'KH001', 200.00, 20.00, 180.00),
    ('HD002', '2023-10-02', N'Nhân viên B', 'KH002', 300.00, 30.00, 270.00);

INSERT INTO CHITIETHD (MAHD, MAHG, SOLUONG, GIABAN, THANHTIEN)
VALUES
    ('HD001', 'HG001', 2, 15.00, 30.00),
    ('HD002', 'HG002', 3, 25.00, 75.00);

INSERT INTO DONGIA (MAHG, NGAYCN, GIA)
VALUES
    ('HG001', '2023-10-01', 10.00),
    ('HG002', '2023-10-01', 20.00);
-------------------------------------------------------------------------------------------------------------

--7.3. Viết thủ tục thực hiện việc cập nhật THANHTIEN trên bảng CHITIETHD và TIENBAN trên bảng CHITIETHD.
CREATE PROCEDURE CapNhatTienBanHoaDon
    @MAHD VARCHAR(10)
AS
BEGIN
    UPDATE CHITIETHD
    SET THANHTIEN = SOLUONG * GIABAN
    WHERE MAHD = @MAHD;

    UPDATE HOADON
    SET TIENBAN = (SELECT SUM(THANHTIEN) FROM CHITIETHD WHERE MAHD = @MAHD)
    WHERE MAHD = @MAHD;
END;
EXEC CapNhatTienBanHoaDon @MAHD = 'HD001';
SELECT * FROM HOADON

--7.4. Viết thủ tục thực hiện cập nhật THANHTIEN trên bảng CHITIETPN và TIENNHAP trên bảng PHIEUNHAP.
CREATE PROCEDURE CapNhatTienNhapPhieuNhap
    @MAPN VARCHAR(10)
AS
BEGIN
    UPDATE CHITIETPN
    SET THANHTIEN = SOLUONG * GIANHAP
    WHERE MAPN = @MAPN;

    UPDATE PHIEUNHAP
    SET TIENNHAP = (SELECT SUM(THANHTIEN) FROM CHITIETPN WHERE MAPN = @MAPN)
    WHERE MAPN = @MAPN;
END;
EXEC CapNhatTienNhapPhieuNhap @MAPN = 'PN001';
--7.5. Viết thủ tục truyền vào tham số mã khách hàng sẽ in ra danh sách các hóa đơn (mã hóa đơn, tổng trị giá) của khách hàng đó.

CREATE PROCEDURE DanhSachHoaDonCuaKhachHang
    @MAKH VARCHAR(10)
AS
BEGIN
    SELECT MAHD, TIENBAN
    FROM HOADON
    WHERE MAKH = @MAKH;
END;
EXEC DanhSachHoaDonCuaKhachHang @MAKH = 'KH001';
--7.6. Viết thủ tục truyền vào tham số mã hóa đơn sẽ trả về ngày lập và trị giá của hóa đơn đó.
CREATE PROCEDURE ThongTinHoaDon
    @MAHD VARCHAR(10)
AS
BEGIN
    SELECT NGAYBAN, TIENBAN
    FROM HOADON
    WHERE MAHD = @MAHD;
END;
EXEC ThongTinHoaDon @MAHD = 'HD001';
--7.7. Viết thủ tục truyền vào tham số mã hàng sẽ trả về tên hàng, tên nhà sản xuất và tên nhà cung cấp tương ứng.
CREATE PROCEDURE ThongTinHang
    @MAHG VARCHAR(10)
AS
BEGIN
    SELECT H.TENHG, NSX.TENNSX, NCC.TENNCC
    FROM HANG H
    JOIN NHASX NSX ON H.MANSX = NSX.MANSX
    JOIN NHACC NCC ON H.MANCC = NCC.MANCC
    WHERE H.MAHG = @MAHG;
END;
EXEC ThongTinHang @MAHG = 'HH001';
--7.8. Để kiểm tra một khách hàng thuộc loại nào (‘VIP’, ‘KH thành viên’, ‘KH thân
--thiết’) cần viết một thủ tục truyền vào tham số mã khách hàng sẽ trả về ‘VIP’ nếu
--doanh số ≥10.000.000; ‘KH thành viên’ nếu 6.000.000 ≤doanh số<10.000.000; ‘KH
--thân thiết’ nếu doanh số <6.000.000 (ghi chú: Doanh số là số tiền mà khách mua hàng).
CREATE PROCEDURE LoaiKhachHang
    @MAKH VARCHAR(10)
AS
BEGIN
    DECLARE @DoanhSo MONEY;
    SET @DoanhSo = (SELECT SUM(TIENBAN) FROM HOADON WHERE MAKH = @MAKH);

    IF @DoanhSo >= 10000000
        SELECT 'VIP' AS LoaiKhachHang;
    ELSE IF @DoanhSo >= 6000000
        SELECT 'KH thành viên' AS LoaiKhachHang;
    ELSE
        SELECT 'KH thân thiết' AS LoaiKhachHang;
END;
EXEC LoaiKhachHang @MAKH = 'KH001';
--7.9. Viết thủ tục truyền vào mã hàng sẽ trả về ngày cập nhật đơn giá gần nhất.
CREATE PROCEDURE NgayCapNhatDonGia
    @MAHG VARCHAR(10)
AS
BEGIN
    SELECT TOP 1 NGAYCN
    FROM DONGIA
    WHERE MAHG = @MAHG
    ORDER BY NGAYCN DESC;
END;
EXEC NgayCapNhatDonGia @MAHG = 'HH001';

-- FUNCTION
-- 7.3. Cập nhật THANHTIEN trên bảng CHITIETHD và TIENBAN trên bảng HOADON.
CREATE FUNCTION CapNhatTienBanHoaDon
    (@MAHD VARCHAR(10))
RETURNS TABLE
AS
BEGIN
    UPDATE CHITIETHD
    SET THANHTIEN = SOLUONG * GIABAN
    WHERE MAHD = @MAHD;

    UPDATE HOADON
    SET TIENBAN = (SELECT SUM(THANHTIEN) FROM CHITIETHD WHERE MAHD = @MAHD)
    WHERE MAHD = @MAHD;

    RETURN (SELECT * FROM HOADON WHERE MAHD = @MAHD);
END;
-- 7.4. Cập nhật THANHTIEN trên bảng CHITIETPN và TIENNHAP trên bảng PHIEUNHAP.
CREATE FUNCTION CapNhatTienNhapPhieuNhap
    (@MAPN VARCHAR(10))
RETURNS TABLE
AS
BEGIN
    UPDATE CHITIETPN
    SET THANHTIEN = SOLUONG * GIANHAP
    WHERE MAPN = @MAPN;

    UPDATE PHIEUNHAP
    SET TIENNHAP = (SELECT SUM(THANHTIEN) FROM CHITIETPN WHERE MAPN = @MAPN)
    WHERE MAPN = @MAPN;

    RETURN (SELECT * FROM PHIEUNHAP WHERE MAPN = @MAPN);
END;
-- 7.5. Danh sách các hóa đơn của một khách hàng (mã hóa đơn, tổng trị giá).
CREATE FUNCTION DanhSachHoaDonCuaKhachHang
    (@MAKH VARCHAR(10))
RETURNS TABLE
AS
BEGIN
    RETURN (SELECT MAHD, TIENBAN
            FROM HOADON
            WHERE MAKH = @MAKH);
END;
-- 7.6. Thông tin ngày lập và trị giá của một hóa đơn.
CREATE FUNCTION ThongTinHoaDon
    (@MAHD VARCHAR(10))
RETURNS TABLE
AS
BEGIN
    RETURN (SELECT NGAYBAN, TIENBAN
            FROM HOADON
            WHERE MAHD = @MAHD);
END;
-- 7.7. Thông tin hàng, nhà sản xuất và nhà cung cấp.
CREATE FUNCTION ThongTinHang
    (@MAHG VARCHAR(10))
RETURNS TABLE
AS
BEGIN
    RETURN (SELECT H.TENHG, NSX.TENNSX, NCC.TENNCC
            FROM HANG H
            JOIN NHASX NSX ON H.MANSX = NSX.MANSX
            JOIN NHACC NCC ON H.MANCC = NCC.MANCC
            WHERE H.MAHG = @MAHG);
END;
-- 7.8. Loại khách hàng (‘VIP’, ‘KH thành viên’, ‘KH thân thiết’).
CREATE FUNCTION LoaiKhachHang
    (@MAKH VARCHAR(10))
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @DoanhSo MONEY;
    SET @DoanhSo = (SELECT SUM(TIENBAN) FROM HOADON WHERE MAKH = @MAKH);

    IF @DoanhSo >= 10000000
        RETURN 'VIP';
    ELSE IF @DoanhSo >= 6000000
        RETURN 'KH thành viên';
    ELSE
        RETURN 'KH thân thiết';
END;
-- 7.9. Ngày cập nhật đơn giá gần nhất.
CREATE FUNCTION NgayCapNhatDonGia
    (@MAHG VARCHAR(10))
RETURNS DATE
AS
BEGIN
    RETURN (SELECT TOP 1 NGAYCN
            FROM DONGIA
            WHERE MAHG = @MAHG
            ORDER BY NGAYCN DESC);
END;
-- Thực thi Function
-- 7.3. Cập nhật THANHTIEN trên bảng CHITIETHD và TIENBAN trên bảng HOADON và trả về thông tin HOADON.
DECLARE @Result1 TABLE (
    MAHD VARCHAR(10),
    NGAYBAN DATE,
    TENNV NVARCHAR(50),
    MAKH VARCHAR(10),
    TIENBAN MONEY,
    GIAMGIA MONEY,
    THANHTOAN MONEY
);

INSERT INTO @Result1
SELECT * FROM CapNhatTienBanHoaDon('HD001');

SELECT * FROM @Result1;

-- 7.4. Cập nhật THANHTIEN trên bảng CHITIETPN và TIENNHAP trên bảng PHIEUNHAP và trả về thông tin PHIEUNHAP.
DECLARE @Result2 TABLE (
    MAPN VARCHAR(10),
    NGAYNHAP DATE,
    MANCC VARCHAR(10),
    TIENNHAP MONEY
);

INSERT INTO @Result2
SELECT * FROM CapNhatTienNhapPhieuNhap('PN001');

SELECT * FROM @Result2;

-- 7.5. Danh sách các hóa đơn của một khách hàng (mã hóa đơn, tổng trị giá).
SELECT * FROM DanhSachHoaDonCuaKhachHang('KH001');

-- 7.6. Thông tin ngày lập và trị giá của một hóa đơn.
SELECT * FROM ThongTinHoaDon('HD001');

-- 7.7. Thông tin hàng, nhà sản xuất và nhà cung cấp.
SELECT * FROM ThongTinHang('HH001');

-- 7.8. Loại khách hàng (‘VIP’, ‘KH thành viên’, ‘KH thân thiết’).
SELECT LoaiKhachHang('KH001') AS LoaiKhachHang;

-- 7.9. Ngày cập nhật đơn giá gần nhất.
SELECT NgayCapNhatDonGia('HH001') AS NgayCapNhatDonGia;