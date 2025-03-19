CREATE DATABASE TEST;

USE TEST;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Salary INT
);

CREATE DATABASE SACH;

USE SACH;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title NVARCHAR(100),
    Author NVARCHAR(50),
    Price DECIMAL(10, 2)
);

CREATE DATABASE SINHVIEN;

USE SINHVIEN;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    GPA DECIMAL(3, 2)
);
----------------------------------------------------------------------------------
-- Tạo tài khoản đăng nhập SV1
CREATE LOGIN SV1 WITH PASSWORD = 'SV1';

-- Tạo tài khoản đăng nhập GV1
CREATE LOGIN GV1 WITH PASSWORD = 'GV1';

-- Tạo tài khoản đăng nhập ADM1
CREATE LOGIN ADM1 WITH PASSWORD = 'AD1';
----------------------------------------------------------------------------------

-- Chuyển đến cơ sở dữ liệu SACH
USE SACH;

-- Tạo người dùng SV1 và gán quyền
CREATE USER SinhVien1 FOR LOGIN SV1;
GRANT SELECT ON Books TO SinhVien1;

-- Tạo người dùng GV1 và gán quyền
CREATE USER GV1 FOR LOGIN GV1;
GRANT SELECT ON Books TO GV1;
----------------------------------------------------------------------------------


-- Thu hồi quyền đọc dữ liệu trên tất cả các bảng của ‘SV1’
DENY SELECT ON SCHEMA :: dbo TO SinhVien1;

-- Tạo nhóm GiaoVien1 và GiaoVien2
CREATE ROLE GiaoVien1;
CREATE ROLE GiaoVien2;

-- Phân quyền cho nhóm GiaoVien1
GRANT SELECT, INSERT ON Books TO GiaoVien1;

-- Phân quyền cho nhóm GiaoVien2
GRANT INSERT, SELECT, UPDATE, DELETE ON Books TO GiaoVien2;

-- Thêm NSD GV1 vào nhóm GiaoVien1
EXEC sp_addrolemember 'GiaoVien1', 'GV1';

-- Thu hồi quyền trên nhóm quyền Giaovien1
REVOKE SELECT, INSERT ON Books TO GiaoVien1;
