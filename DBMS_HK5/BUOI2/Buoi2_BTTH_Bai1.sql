CREATE DATABASE Buoi2_BTTH_Bai1
USE Buoi2_BTTH_Bai1

DECLARE @hoten varchar(20)
DECLARE @tuoi int

SET @hoten = 'Nguyen Van Khanh'
SET @tuoi = 20

PRINT 'Ho ten: ' + @hoten
PRINT 'Tuoi: ' + CAST(@tuoi AS varchar)
