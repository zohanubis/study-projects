-- Tạo cơ sở dữ liệu
CREATE DATABASE Buoi2_BTTH_Bai7
USE Buoi2_BTTH_Bai7

-- Tạo bảng SACH
CREATE TABLE SACH (
    MASH VARCHAR(10),
    TENSH NVARCHAR(50),
    TACGIA NVARCHAR(50),
    LOAI NVARCHAR(50),
    TINHTRANG NVARCHAR(50),
    CONSTRAINT PK_SACH PRIMARY KEY (MASH)
);

-- Tạo bảng DOCGIA
CREATE TABLE DOCGIA (
    MADG VARCHAR(10),
    TENDG NVARCHAR(50),
    TUOI INT,
    PHAI NVARCHAR(10),
    DIACHI NVARCHAR(50),
    CONSTRAINT PK_DOCGIA PRIMARY KEY (MADG)
);

-- Tạo bảng MUONSACH
CREATE TABLE MUONSACH (
    MADG VARCHAR(10),
    MASH VARCHAR(10),
    NGAYMUON DATE,
    NGAYTRA DATE,
    CONSTRAINT PK_MUONSACH PRIMARY KEY (MADG, MASH),
    CONSTRAINT FK_MUONSACH_DOCGIA FOREIGN KEY (MADG) REFERENCES DOCGIA(MADG),
    CONSTRAINT FK_MUONSACH_SACH FOREIGN KEY (MASH) REFERENCES SACH(MASH)
);
 

INSERT INTO DOCGIA (MADG, TENDG, DIACHI,TUOI,PHAI)
VALUES
('DG001', N'Nguyễn Văn Anh', N'Hà Nội',16,N'Nam'),
    ('DG002', N'Trần Thị Bảnh', N'Hồ Chí Minh',19,N'Nữ'),
    ('DG003', N'Lê Văn Công', N'Đà Nẵng',15,N'Nam'),
    ('DG004', N'Phạm Thị Linh', N'Hải Phòng',19,N'Nữ'),
    ('DG005', N'Vũ Văn Em', N'Cần Thơ',15,N'Nam');

INSERT INTO SACH (MASH, TENSH, LOAI, TACGIA)
VALUES
    ('SH001', N'Sách Khoa Học Tự Nhiên 1', N'Khoa Học Tự Nhiên' , N'Tác Giả 1' ),
    ('SH002', N'Sách Khoa Học Tự Nhiên 2', N'Khoa Học Tự Nhiên', N'Tác Giả 2' ),
    ('SH003', N'Sách Khoa Học Tự Nhiên 3', N'Khoa Học Tự Nhiên',  N'Tác Giả 3' ),
    ('SH004', N'Sách Khoa Học Tự Nhiên 4', N'Khoa Học Tự Nhiên',  N'Tác Giả 4' );

INSERT INTO SACH (MASH, TENSH, LOAI,  TACGIA)
VALUES
    ('SH005', N'Sách Xã Hội 1', N'Xã Hội', N'Tác Giả 1' ),
    ('SH006', N'Sách Xã Hội 2', N'Xã Hội', N'Tác Giả 2' ),
    ('SH007', N'Sách Xã Hội 3', N'Xã Hội', N'Tác Giả 3' ),
    ('SH008', N'Sách Xã Hội 4', N'Xã Hội', N'Tác Giả 4' );

INSERT INTO SACH (MASH, TENSH, LOAI,TACGIA)
VALUES
    ('SH009', N'Sách Kinh Tế 1', N'Kinh Tế',  N'Tác Giả 1' ),
    ('SH010', N'Sách Kinh Tế 2', N'Kinh Tế',  N'Tác Giả 2' ),
    ('SH011', N'Sách Kinh Tế 3', N'Kinh Tế', N'Tác Giả 3' ),
    ('SH012', N'Sách Kinh Tế 4', N'Kinh Tế',  N'Tác Giả 4' );

INSERT INTO SACH (MASH, TENSH, LOAI,TACGIA)
VALUES
    ('SH003', N'Sách Truyện 1', N'Truyện',  N'Tác Giả 1' ),
    ('SH014', N'Sách Truyện 2', N'Truyện',  N'Tác Giả 2' ),
    ('SH015', N'Sách Truyện 3', N'Truyện', N'Tác Giả 3'),
    ('SH016', N'Sách Truyện 4', N'Truyện',  N'Tác Giả 4' );

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
------------------------Trigger---------------------
--/ Viết trigger kiểm tra tuổi của độc giả phải >=15
SELECT * FROM DOCGIA
CREATE TRIGGER TR_KIEMTRATUOI
ON DOCGIA
AFTER INSERT, UPDATE
AS
BEGIN
    IF (SELECT COUNT(*) FROM inserted WHERE DATEDIFF(YEAR, TUOI, GETDATE()) < 15) > 0
    BEGIN
        THROW 5000,'Tuổi của độc giả phải lớn hơn hoặc bằng 15.', 1;
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;

CREATE TRIGGER TR_KIEMTRATUOISO
ON DOCGIA
AFTER INSERT, UPDATE
AS
BEGIN
    IF (SELECT COUNT(*) FROM inserted WHERE TUOI < 15) > 0
    BEGIN
        THROW 51000,'Tuổi của độc giả phải lớn hơn hoặc bằng 15.', 1;
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
-- b/ Viết trigger kiểm tra phái của độc giả phải là ‘Nam’ hay ‘Nu’
CREATE TRIGGER TR_CHECK_DOCGIA_PHAI
ON DOCGIA
AFTER INSERT, UPDATE
AS
BEGIN
    IF (SELECT COUNT(*) FROM inserted WHERE PHAI NOT IN (N'Nam', N'Nữ')) > 0
    BEGIN
        THROW 51000, N'Phái của độc giả phải là ''Nam'' hoặc ''Nữ''.', 1;
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;

DROP TRIGGER TR_CHECK_DOCGIA_PHAI
--c/ Viết trigger kiểm tra loại sách phải thuộc trong các loại như: Khoa hoc tu nhien, Xa hoi, Kinh te, Truyen
CREATE TRIGGER TR_CHECK_SACH_LOAI
ON SACH
AFTER INSERT, UPDATE
AS
BEGIN
    IF (SELECT COUNT(*) FROM inserted WHERE LOAI NOT IN (N'Khoa Học Tự Nhiên', N'Xã Hội', N'Kinh Tế', N'Truyện')) > 0
    BEGIN
        THROW 51000, 'Loại sách phải thuộc trong các loại như: Khoa Học Tự Nhiên, Xã Hội, Kinh Tế, Truyện.', 1;
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;

--d/ Dùng lệnh xóa các ràng trigger trên
DROP TRIGGER TR_KIEMTRATUOI ON DOCGIA;
DROP TRIGGER TR_CHECK_DOCGIA_PHAI ON DOCGIA;
DROP TRIGGER TR_CHECK_SACH_LOAI ON SACH;

--e/ Viết trigger kiểm tra khi thêm hay sửa dữ liệu trên bảng MUONSACH thì ngày trả >= ngày mượn
CREATE TRIGGER TR_KIEMTRA_NGAYTRA
ON MUONSACH
AFTER INSERT, UPDATE
AS
BEGIN
    IF (SELECT COUNT(*) FROM inserted WHERE NGAYTRA IS NOT NULL AND NGAYTRA < NGAYMUON) > 0
    BEGIN
        THROW 51000, N'Ngày trả phải lớn hơn hoặc bằng ngày mượn.', 1;
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;

--f/ Viết trigger kiểm tra cập nhật TINHTRANG trên bảng SACH là ‘Da muon’ mỗi
--khi thêm sách vào bảng MUONSACH (tức là hành động cho mượn sách). Khi
--thêm dòng dữ liệu vào bảng MUONSACH thì NGAYTRA để trống.
CREATE TRIGGER TR_CAPNHAT_TINHTRANG
ON MUONSACH
AFTER INSERT
AS
BEGIN
    UPDATE SACH
    SET TINHTRANG = N'Đã Mượn'
    FROM SACH
    INNER JOIN inserted ON SACH.MASH = inserted.MASH;
END;

--g/ Viết trigger kiểm tra cập nhật TINHTRANG trên bảng SACH là ‘Chua muon’ mỗi
--khi sách đó được trả (tức là khi cập nhật NGAYTRA vào bảng MUONSACH)
CREATE TRIGGER TR_CAPNHAT_TINHTRANG_TRA
ON MUONSACH
AFTER UPDATE
AS
BEGIN
    UPDATE SACH
    SET TINHTRANG = N'Chưa Mượn'
    FROM SACH
    INNER JOIN deleted ON SACH.MASH = deleted.MASH
    INNER JOIN inserted ON SACH.MASH = inserted.MASH
    WHERE inserted.NGAYTRA IS NOT NULL AND deleted.NGAYTRA IS NULL;
END;

--h/ Viết trigger kiểm tra kiểm tra nếu số sách chưa trả >=3 thì không được mượn tiếp.
--(HD: sách chưa trả nghĩa là NGAYMUON có giá trị NULL, hành động cho mượn
--sách có nghĩa là cho thêm dòng dữ liệu vào bảng MUONSACH)
CREATE TRIGGER TR_KIEMTRA_SO_SACH_CHUA_TRA
ON MUONSACH
AFTER INSERT
AS
BEGIN
    DECLARE @MADG VARCHAR(10);
    SELECT TOP 1 @MADG = MADG
    FROM inserted;

    IF (SELECT COUNT(*) FROM MUONSACH WHERE MADG = @MADG AND NGAYTRA IS NULL) >= 3
    BEGIN
        THROW 51000, N'Không được mượn thêm sách khi số sách chưa trả >= 3.', 1;
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
