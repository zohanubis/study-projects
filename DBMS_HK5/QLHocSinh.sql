CREATE DATABASE QLHocSinh
USE QLHocSinh

CREATE TABLE KHOI(
    MAKHOI VARCHAR(10),
    TENKHOI NVARCHAR(15),
    CONSTRAINT PK_KHOI PRIMARY KEY(MAKHOI)
);
CREATE TABLE LOP(
    MALOP VARCHAR(10),
    TENLOP NVARCHAR(15),
    MAKHOI VARCHAR(10),
    CONSTRAINT PK_LOP PRIMARY KEY(MALOP),
    CONSTRAINT FK_LOP_KHOA FOREIGN KEY(MAKHOI) REFERENCES KHOI(MAKHOI)
);
CREATE TABLE HOCSINH(
    MAHS VARCHAR(10),
    HOTEN NVARCHAR(15),
    GIOITINH BIT,
    NGAYSINH DATETIME,
    DIACHI NVARCHAR(150),
    MALOP VARCHAR(10),
    CONSTRAINT PK_HOCSINH PRIMARY KEY(MAHS),
    CONSTRAINT FK_HOCSINH_LOP FOREIGN KEY(MALOP) REFERENCES LOP(MALOP)
)
SELECT * FROM KHOI
SELECT * FROM LOP
SELECT * FROM HOCSINH

INSERT INTO KHOI (MAKHOI, TENKHOI)
VALUES ('K10', N'Khối 10'),
       ('K11', N'Khối 11'),
       ('K12', N'Khối 12');

INSERT INTO LOP (MALOP, TENLOP, MAKHOI)
VALUES ('10A1', N'Lớp 10A1', 'K10'),
       ('10A2', N'Lớp 10A2', 'K10'),
       ('10A3', N'Lớp 10A3', 'K10');

INSERT INTO LOP (MALOP, TENLOP, MAKHOI)
VALUES ('11A1', N'Lớp 11A1', 'K11'),
       ('11A2', N'Lớp 11A2', 'K11'),
       ('11A3', N'Lớp 11A3', 'K11');

INSERT INTO LOP (MALOP, TENLOP, MAKHOI)
VALUES ('12A1', N'Lớp 12A1', 'K12'),
       ('12A2', N'Lớp 12A2', 'K12'),
       ('12A3', N'Lớp 12A3', 'K12');

INSERT INTO HOCSINH (MAHS, HOTEN, GIOITINH, NGAYSINH, DIACHI, MALOP)
VALUES 
    ('K10HS101', N'Nguyễn Thị Lan', 0, '2006-01-15', N'Hà Nội', '10A1'),
    ('K10HS102', N'Phạm Văn Bình', 1, '2006-02-20', N'Hà Nam', '10A1'),
    ('K10HS103', N'Trần Thị Hoa', 0, '2006-03-25', N'Bắc Ninh', '10A1'),
    ('K10HS104', N'Lê Văn Dương', 1, '2006-04-10', N'Hải Dương', '10A1'),
    ('K10HS105', N'Nguyễn Đức Anh', 1, '2006-05-05', N'Hà Nội', '10A1'),
    ('K10HS201', N'Vũ Thị Hương', 0, '2006-06-18', N'Nam Định', '10A2'),
    ('K10HS202', N'Đặng Văn Cường', 1, '2006-07-22', N'Thái Bình', '10A2'),
    ('K10HS203', N'Nguyễn Văn Hải', 1, '2006-08-27', N'Hà Nội', '10A2'),
    ('K10HS204', N'Bùi Thị Lan', 0, '2006-09-08', N'Hải Phòng', '10A2'),
    ('K10HS205', N'Lê Thị Huệ', 0, '2006-10-10', N'Bắc Giang', '10A2'),
    ('K10HS301', N'Phạm Văn An', 1, '2006-11-12', N'Hà Nội', '10A3'),
    ('K10HS302', N'Lê Thị Hương', 0, '2006-12-15', N'Hải Dương', '10A3'),
    ('K10HS303', N'Trần Văn Hùng', 1, '2007-01-20', N'Bắc Ninh', '10A3'),
    ('K10HS304', N'Nguyễn Thị Bích', 0, '2007-02-25', N'Hà Nam', '10A3'),
    ('K10HS305', N'Vũ Đình Quân', 1, '2007-03-30', N'Hà Nội', '10A3'),

    ('K11HS1101', N'Nguyễn Văn Anh', 1, '2005-01-15', N'Hà Nội', '11A1'),
    ('K11HS1102', N'Phạm Thị Lan', 0, '2005-02-20', N'Hải Phòng', '11A1'),
    ('K11HS1103', N'Trần Văn Bình', 1, '2005-03-25', N'Hà Nam', '11A1'),
    ('K11HS1104', N'Lê Thị Hương', 0, '2005-04-10', N'Bắc Giang', '11A1'),
    ('K11HS1105', N'Vũ Văn Dương', 1, '2005-05-05', N'Thái Bình', '11A1'),
    ('K11HS1106', N'Vũ Thị Lan', 0, '2005-06-18', N'Hải Phòng', '11A2'),
    ('K11HS1107', N'Nguyễn Văn Bình', 1, '2005-07-22', N'Thái Bình', '11A2'),
    ('K11HS1108', N'Phạm Thị Hương', 0, '2005-08-27', N'Hà Nội', '11A2'),
    ('K11HS1109', N'Trần Đức Anh', 1, '2005-09-08', N'Hà Nam', '11A2'),
    ('K11HS1110', N'Đặng Văn Hải', 1, '2005-10-10', N'Bắc Giang', '11A2'),
    ('K11HS1111', N'Lê Thị Quân', 0, '2005-11-12', N'Hà Nội', '11A3'),
    ('K11HS1112', N'Nguyễn Văn Dũng', 1, '2005-12-15', N'Hải Dương', '11A3'),
    ('K11HS1113', N'Phạm Thị Hoa', 0, '2006-01-20', N'Bắc Ninh', '11A3'),
    ('K11HS1114', N'Trần Văn Đức', 1, '2006-02-25', N'Hà Nam', '11A3'),
    ('K11HS1115', N'Vũ Thị Lan', 0, '2006-03-30', N'Thái Bình', '11A3'),
    
    ('K12HS1201', N'Nguyễn Thị Hoa', 0, '2004-01-18', N'Hà Nội', '12A1'),
    ('K12HS1202', N'Trần Văn Cường', 1, '2004-02-22', N'Hải Dương', '12A1'),
    ('K12HS1203', N'Phạm Văn An', 1, '2004-03-27', N'Bắc Ninh', '12A1'),
    ('K12HS1204', N'Lê Thị Bình', 0, '2004-04-08', N'Hà Nam', '12A1'),
    ('K12HS1205', N'Đặng Văn Đức', 1, '2004-05-10', N'Thái Bình', '12A1'),
    ('K12HS1206', N'Nguyễn Văn Anh', 1, '2004-06-15', N'Hà Nội', '12A2'),
    ('K12HS1207', N'Trần Thị Lan', 0, '2004-07-20', N'Hà Nam', '12A2'),
    ('K12HS1208', N'Phạm Văn Bình', 1, '2004-08-25', N'Hải Phòng', '12A2'),
    ('K12HS1209', N'Lê Văn Dương', 1, '2004-09-08', N'Hải Dương', '12A2'),
    ('K12HS1210', N'Trần Thị Hoa', 0, '2004-10-10', N'Bắc Ninh', '12A2'),
    ('K12HS1211', N'Nguyễn Văn Hải', 1, '2003-07-20', N'Thái Bình', '12A3'),
    ('K12HS1212', N'Phạm Thị Bình', 0, '2003-08-25', N'Hà Nội', '12A3'),
    ('K12HS1213', N'Đặng Văn Cường', 1, '2003-09-30', N'Hải Dương', '12A3'),
    ('K12HS1214', N'Lê Thị Lan', 0, '2003-10-08', N'Bắc Giang', '12A3'),
    ('K12HS1215', N'Trần Văn An', 1, '2003-11-10', N'Thái Bình', '12A3');


