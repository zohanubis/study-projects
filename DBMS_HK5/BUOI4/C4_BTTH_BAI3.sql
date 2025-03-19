CREATE DATABASE C4_BTTH_Bai3
USE C4_BTTH_Bai3
CREATE TABLE KHACHHANG (
    MaKH NVARCHAR(10) PRIMARY KEY,
    Hoten NVARCHAR(30),
    Diachi NVARCHAR(100),
    DT NVARCHAR(15)
);

CREATE TABLE MATHANG (
    MaMH NVARCHAR(10) PRIMARY KEY,
    TenMH NVARCHAR(30),
    DVT NVARCHAR(10),
    SLton INT,
    Dongia FLOAT
);

CREATE TABLE HOADON (
    SoHD NVARCHAR(10) PRIMARY KEY,
    Ngaylap DATE,
    MaKH NVARCHAR(10) REFERENCES KHACHHANG(MaKH)
);

CREATE TABLE CHITIET_HD (
    SoHD NVARCHAR(10) REFERENCES HOADON(SoHD),
    MaMH NVARCHAR(10) REFERENCES MATHANG(MaMH),
    SL INT,
    PRIMARY KEY (SoHD, MaMH)
);

-- Tạo các tài khoản người dùng
CREATE LOGIN NguyenA WITH PASSWORD = 'abc';
CREATE LOGIN NguyenB WITH PASSWORD = 'xyz';
CREATE LOGIN NguyenC WITH PASSWORD = 'abc';
CREATE LOGIN NguyenD WITH PASSWORD = 'xyz';
CREATE LOGIN NguyenE WITH PASSWORD = 'abc';
CREATE LOGIN NguyenF WITH PASSWORD = 'xyz';
CREATE LOGIN NguyenG WITH PASSWORD = 'abc';
CREATE LOGIN NguyenH WITH PASSWORD = 'xyz';

-- Tạo các tài khoản người dùng và gán vào nhóm quyền tương ứng
CREATE USER BanGiamDoc FOR LOGIN NguyenA ;
CREATE USER KeToan FOR LOGIN NguyenC;
CREATE USER KeToan FOR LOGIN NguyenD;
CREATE USER KinhDoanh FOR LOGIN NguyenE;
CREATE USER KinhDoanh FOR LOGIN NguyenF;
CREATE USER IT FOR LOGIN NguyenG;
CREATE USER IT FOR LOGIN NguyenH;

-- Tạo các nhóm quyền
CREATE ROLE BanGiamDocRole;
CREATE ROLE KeToanRole;
CREATE ROLE KinhDoanhRole;
CREATE ROLE ITRole;

-- Gán quyền cho các nhóm quyền
GRANT VIEW DEFINITION ON DATABASE::C4_BTTH_Bai3 TO BanGiamDocRole;
GRANT VIEW DEFINITION ON DATABASE::C4_BTTH_Bai3 TO KeToanRole;
GRANT VIEW DEFINITION ON DATABASE::C4_BTTH_Bai3 TO KinhDoanhRole;
GRANT CONTROL ON DATABASE::C4_BTTH_Bai3 TO ITRole;

-- Phân quyền cụ thể cho từng nhóm
-- Ban giám đốc có quyền chuyển tiếp quyền
GRANT IMPERSONATE ON LOGIN::NguyenA TO BanGiamDocRole;

-- Phòng kế toán được phép thêm, cập nhật trên bảng hóa đơn và chi tiết hóa đơn
GRANT INSERT, UPDATE ON HOADON TO KeToanRole;
GRANT INSERT, UPDATE ON CHITIET_HD TO KeToanRole;

-- Phòng kinh doanh được phép thêm, và cập nhật trên bảng khách hàng
GRANT INSERT, UPDATE ON KHACHHANG TO KinhDoanhRole;

-- Phòng IT được toàn quyền trên cơ sở dữ liệu
GRANT CONTROL ON DATABASE::C4_BTTH_Bai3 TO ITRole;

-- Không cho user NguyenC quyền cập nhật trên bảng hóa đơn và bảng chi tiết hóa đơn
DENY UPDATE ON HOADON TO NguyenC;
DENY UPDATE ON CHITIET_HD TO NguyenC;

-- Thu hồi quyền chuyển tiếp của ban giám đốc
REVOKE IMPERSONATE ON LOGIN::NguyenA TO BanGiamDocRole;