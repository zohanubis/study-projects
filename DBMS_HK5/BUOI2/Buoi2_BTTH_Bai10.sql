CREATE DATABASE Buoi2_BTTH_Bai10
USE Buoi2_BTTH_Bai10

-- Tạo bảng THISINH
CREATE TABLE THISINH (
    SBD VARCHAR(10) PRIMARY KEY,
    HOTEN NVARCHAR(50),
    KHUVUC INT,
    DIEMTHEM FLOAT
);

-- Chèn dữ liệu vào bảng THISINH
INSERT INTO THISINH (SBD, HOTEN, KHUVUC, DIEMTHEM) VALUES
('A1001', N'Tran Thanh Nam', 1, NULL),
('B1002', N'Nguyen Ngoc Phu', 2, NULL),
('C1001', N'Vo Van Viet', 1, NULL),
('A1002', N'Trinh Dinh Dong', 3, NULL);

SELECT * FROM THISINH


DECLARE @SBD VARCHAR(10);
DECLARE @KHUVUC INT;
DECLARE @DIEMTHEM FLOAT;

-- Khai báo cursor
DECLARE cursorUpdateDiem CURSOR FOR
    SELECT SBD, KHUVUC
    FROM THISINH;

-- Mở cursor
OPEN cursorUpdateDiem;

-- Fetch dữ liệu từ cursor
FETCH NEXT FROM cursorUpdateDiem INTO @SBD, @KHUVUC;

-- Loop qua dữ liệu và cập nhật DIEMTHEM theo điều kiện
WHILE @@FETCH_STATUS = 0
BEGIN
    IF @KHUVUC = 1
        SET @DIEMTHEM = 0;
    ELSE IF @KHUVUC = 2
        SET @DIEMTHEM = 0.5;
    ELSE IF @KHUVUC = 3
        SET @DIEMTHEM = 1;

    -- Cập nhật giá trị vào bảng THISINH
    UPDATE THISINH
    SET DIEMTHEM = @DIEMTHEM
    WHERE SBD = @SBD;

    -- Fetch dữ liệu tiếp theo
    FETCH NEXT FROM cursorUpdateDiem INTO @SBD, @KHUVUC;
END;

-- Đóng cursor
CLOSE cursorUpdateDiem;

-- Hủy cursor
DEALLOCATE cursorUpdateDiem;

