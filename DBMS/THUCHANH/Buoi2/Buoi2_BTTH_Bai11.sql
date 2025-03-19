CREATE DATABASE Buoi2_BTTH_Bai11
USE Buoi2_BTTH_Bai11

-- Tạo bảng SINHVIEN
CREATE TABLE SINHVIEN (
    MASV VARCHAR(10) PRIMARY KEY,
    HOTEN NVARCHAR(50),
    DIEM_KT INT,
    DIEM_GK INT,
    DIEM_CK INT,
    DIEM_TK FLOAT
);

-- Chèn dữ liệu vào bảng SINHVIEN
INSERT INTO SINHVIEN (MASV, HOTEN, DIEM_KT, DIEM_GK, DIEM_CK) VALUES
('3001090113', N'Lam Bich Van', 8, 7, 8),
('3001090344', N'Nguyen Thanh Nam', 3, 5, 7),
('3001100021', N'Le Mi Nuong', 8, 2, 9),
('3001100022', N'Tran Dinh Trong', 6, 4, 5),
('3001100023', N'Le Van Khanh', 7, 3, 8),
('3001090345', N'Chu Bao Chau', 6, 5, 9);

SELECT * FROM SINHVIEN
----------------CURSOR-------------------------
-- Khai báo cursor
DECLARE TinhDiem CURSOR FOR
    SELECT MASV, DIEM_KT, DIEM_GK, DIEM_CK
    FROM SINHVIEN;

DECLARE @MASV VARCHAR(10);
DECLARE @DIEM_KT INT;
DECLARE @DIEM_GK INT;
DECLARE @DIEM_CK INT;
DECLARE @DIEM_TK FLOAT;

-- Mở cursor
OPEN TinhDiem;

-- Fetch dữ liệu từ cursor
FETCH NEXT FROM TinhDiem INTO @MASV, @DIEM_KT, @DIEM_GK, @DIEM_CK;

-- Loop qua dữ liệu và tính điểm tổng kết môn
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @DIEM_TK = @DIEM_KT * 0.2 + @DIEM_GK * 0.3 + @DIEM_CK * 0.5;

    -- Cập nhật giá trị vào bảng SINHVIEN
    UPDATE SINHVIEN
    SET DIEM_TK = @DIEM_TK
    WHERE MASV = @MASV;

    -- Fetch dữ liệu tiếp theo
    FETCH NEXT FROM TinhDiem INTO @MASV, @DIEM_KT, @DIEM_GK, @DIEM_CK;
END;

-- Đóng cursor
CLOSE TinhDiem;

-- Hủy cursor
DEALLOCATE TinhDiem;
