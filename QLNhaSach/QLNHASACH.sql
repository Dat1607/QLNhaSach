--TẠO CƠ SỞ DỮ LIỆU QUẢN LÝ NHÀ SÁCH
CREATE DATABASE QUANLI_NHASACH ON PRIMARY
(
	NAME='QLNHASACH_PRIMARY',
	FILENAME='D:\THHQTCSDL\DOAN_QUANLI_NHASACH\QUANLI_NHASACH_PRIMARY.MDF',
	SIZE=3MB,
	MAXSIZE=10MB,
	FILEGROWTH=10%
)

LOG ON
(
	NAME='QUANLI_NHASACH_LOG',
	FILENAME='D:\THHQTCSDL\DOAN_QUANLI_NHASACH\QLNHASACH_LOG.LDF',
	SIZE=3MB,
	MAXSIZE=5MB,
	FILEGROWTH=10%
)
GO
CREATE DATABASE QUANLI_NHASACH
GO
USE QUANLI_NHASACH
GO


--TẠO BẢNG NHÀ SẢN XUẤT
CREATE TABLE NHASANXUAT
(
	MANSX CHAR(10) NOT NULL,
	TENNSX NVARCHAR(25),
	DCNSX NVARCHAR(30),
	DTNSX CHAR(10),
	CONSTRAINT pk_NHASANXUAT PRIMARY KEY(MANSX),
)
GO


CREATE TABLE LOAIMATHANG
(
	MALH CHAR(10) NOT NULL,
	TENLH NVARCHAR(20),
	CONSTRAINT pk_LOAIMATHANG PRIMARY KEY(MALH)
)
GO

CREATE TABLE MATHANG
(
	MAMH CHAR(10) NOT NULL,
	MANSX CHAR(10),
	MALH CHAR(10),
	TENMH NVARCHAR(20),
	SOLUONG INT,
	NAMSX INT,
	CONSTRAINT pk_MATHANG PRIMARY KEY(MAMH),
	CONSTRAINT fk_MANSX_MATHANG FOREIGN KEY(MANSX) REFERENCES NHASANXUAT(MANSX),
	CONSTRAINT fk_MALH_MATHANG FOREIGN KEY(MALH) REFERENCES LOAIMATHANG(MALH),
)
GO

CREATE TABLE NHANVIEN
(
	MANV CHAR(10) NOT NULL,
	TENNV NVARCHAR(20),
	GIOITINH NVARCHAR(5),
	NGAYSINH DATE,
	MANQL CHAR(10),
	LUONG FLOAT,
	CONSTRAINT pk_NHANVIEN PRIMARY KEY(MANV),
	CONSTRAINT fk_NHANVIEN_MANV FOREIGN KEY(MANQL) REFERENCES NHANVIEN(MANV),
)
GO

CREATE TABLE HOADON
(
	MAHD CHAR(10) NOT NULL,
	MANV CHAR(10) NOT NULL,
	MAMH CHAR(10) NOT NULL,
	NGAYXHD DATE,
	SOLUONG INT,
	DONGIA FLOAT,
	TRIGIA FLOAT,
	CONSTRAINT pk_HOADON PRIMARY KEY(MAHD,MANV,MAMH),
	CONSTRAINT fk_MANV_HOADON FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV),
	CONSTRAINT fk_MAMH_HOADON FOREIGN KEY(MAMH) REFERENCES MATHANG(MAMH)
)
GO

CREATE TABLE THANNHAN
(
	MATN CHAR(10),
	MANV CHAR(10),
	TENTN NVARCHAR(20),
	GIOITINH NVARCHAR(5),
	MQH NVARCHAR(10),
	CONSTRAINT pk_THANNHAN PRIMARY KEY(MATN,MANV),
	CONSTRAINT fk_THANNHAN FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV),
)
GO


SET DATEFORMAT DMY

INSERT INTO NHASANXUAT VALUES
('NSX001',N'Thiên Long',N'TP.HCM','0978762674'),
('NSX002',N'Kim Đồng',N'Đà Nẵng','0962564176'),
('NSX003',N'Hùng Thuận Phát',N'TP.HCM','0772238142'),
('NSX004',N'Trung Nguyên',N'Đồng Nai','0928971144'),
('NSX005',N'Thái Minh Thành',N'Thái Nguyên','0981234567'),
('NSX006',N'Đa Lộc',N'Bình Dương','0122658770')
GO

INSERT INTO LOAIMATHANG VALUES
('LH123',N'Máy tính'),
('LH456',N'Sách'),
('LH789',N'Bút')
GO

INSERT INTO MATHANG VALUES
('MH0001','NSX006','LH456',N'Sách văn',50,2008),
('MH0002','NSX003','LH789',N'Bút xóa nước',77,2009),
('MH0003','NSX001','LH789',N'Bút bi xanh',110,2003),
('MH0004','NSX006','LH456',N'Sách khoa học',10,2013),
('MH0005','NSX003','LH456',N'Sách CNXHKH',33,1999),
('MH0006','NSX005','LH123',N'Máy tính casio',15,2011),
('MH0007','NSX004','LH456',N'Sách toán',28,2008),
('MH0008','NSX003','LH789',N'Bút chì',44,2013)
GO

INSERT INTO NHANVIEN VALUES
('NV0001',N'Nguyễn Thị Lan',N'Nữ','13/02/1992','NV0005',10000000),
('NV0002',N'Trần Văn Tiến',N'Nam','04/06/2000','NV0005',7500000),
('NV0003',N'Nguyễn Tấn Tài',N'Nam','28/01/1989','NV0006',12000000),
('NV0004',N'Ngô Lan Anh',N'Nữ','12/12/1998','NV0006',7500000),
('NV0005',N'Đinh Huy Hoàng',N'Nam','01/01/1992','NV0003',10000000),
('NV0006',N'Trịnh Như Quỳnh',N'Nữ','20/08/1998','NV0003',12000000),
('NV0007',N'Lê Thị Duyên',N'Nữ','30/10/1999','NV0001',7500000),
('NV0008',N'Tạ Minh Quang',N'Nam','08/09/1982','NV0001',15000000)
GO

INSERT INTO HOADON VALUES
('HD111','NV0007','MH0005','24/07/2019',3,61000,NULL),
('HD112','NV0003','MH0006','27/12/2021',2,210000,NULL),
('HD113','NV0001','MH0007','30/01/2020',5,18500,NULL),
('HD114','NV0008','MH0001','01/06/2020',7,20000,NULL),
('HD115','NV0007','MH0005','08/09/2019',1,61000,NULL),
('HD116','NV0002','MH0003','15/03/2021',11,5500,NULL),
('HD117','NV0001','MH0005','18/10/2020',3,61000,NULL),
('HD118','NV0007','MH0001','01/06/2020',2,20000,NULL),
('HD119','NV0004','MH0004','17/04/2019',1,8000,NULL)
GO

INSERT INTO THANNHAN VALUES
('TN001','NV0003',N'Nguyễn Thế Thành',N'Nam',N'Bố'),
('TN002','NV0005',N'Nguyễn Thị Ánh',N'Nữ',N'Mẹ'),
('TN003','NV0001',N'Lê Quang Định',N'Nam',N'Bố'),
('TN004','NV0004',N'Lê Thanh An',N'Nam',N'Bố'),
('TN005','NV0007',N'Tô Ánh Hồng',N'Nữ',N'Mẹ')
GO

--BẢNG NHÂN VIÊN GIỚI TÍNH PHẢI LÀ NAM HAY NỮ
ALTER TABLE NHANVIEN
ADD CONSTRAINT KT_GIOITINH CHECK (GIOITINH IN (N'NAM',N'NỮ'))
--BẢNG NHÂN VIÊN LƯƠNG MẶC ĐỊNH 800.000
ALTER TABLE NHANVIEN
ADD CONSTRAINT DF_LUONG DEFAULT '800000' FOR LUONG
--BẢNG NHÂN VIÊN NHẬP VÀO GIÁ TRỊ "KHÔNG CÓ NGƯỜI QUẢN LÝ" KHI THÊM DỮ LIỆU ĐỂ TRỐNG CỘT MANQL
ALTER TABLE NHANVIEN
ADD CONSTRAINT DF_MANQL DEFAULT N'KHÔNG CÓ NGƯỜI QUẢN LÝ' FOR MANQL
--BẢNG MATHANG TÊN MẶT HÀNG KHÔNG TRÙNG NHAU 
ALTER TABLE MATHANG
ADD CONSTRAINT UNIQUE_TENMH UNIQUE(TENMH)

-- Viết trigger kiểm tra chỉ cho xóa những nhân viên có lương dưới 10000000
create trigger XOA_NV ON NHANVIEN
for delete
as
if(select LUONG from deleted)<10000000
	commit tran
else
	begin
		print N'Không thể xóa nhân viên này!'
		rollback tran
	end

drop trigger XOA_NV
select * from NHANVIEN
-- Không hợp lệ
INSERT INTO NHANVIEN VALUES
('NV0010',N'Nguyễn An An',N'Nữ','16/02/1992','NV0001',15000000);

delete from NHANVIEN
where MANV='NV0010'
-- Hợp Lệ
INSERT INTO NHANVIEN VALUES
('NV0011',N'Nguyễn Minh Anh',N'Nữ','16/08/1987','NV0002',9000000);

delete from NHANVIEN
where MANV='NV0011'



--Viết trigger kiểm tra khi nhập liệu vào bảng NHANVIEN thì LUONG lớn hơn 5000000
create trigger KT_LUONG on NHANVIEN
for insert
as
if(select LUONG from inserted) >5000000
	commit tran
else
	begin 
		print N'Lương phải lớn ơn 5000000!'
		rollback tran
	end

drop trigger KT_LUONG
-- Không hợp lệ
INSERT INTO NHANVIEN VALUES
('NV0012',N'Nguyễn Hồng Phúc',N'Nam','17/08/1987','NV0004',4000000);
-- Hợp lệ
INSERT INTO NHANVIEN VALUES
('NV0012',N'Nguyễn Hồng Phúc',N'Nam','17/08/1987','NV0004',8000000);
---check----
select * from NHANVIEN
----xóa----
delete from NHANVIEN
where MANV='NV0012'



--Viết trigger chỉ cho cập nhật tăng lương của nhân viên không quá 20%
Create trigger KT_CN_LUONG on NHANVIEN
for UPDATE
as
if(select LUONG from inserted) <=1.2 * (select LUONG from deleted)
	commit tran
else
	begin
		print N'Tăng Lương Không quá 20%'
		rollback tran
	end

drop trigger KT_CN_LUONG
-----Thêm 1 nv mới
INSERT INTO NHANVIEN VALUES
('NV0010',N'Nguyễn An An',N'Nữ','16/02/1992','NV0001',10000000);
----xóa---
delete from NHANVIEN 
where MANV='NV0010'
------check
select * from NHANVIEN
-- Không hợp lệ
update NHANVIEN
set LUONG = LUONG * 1.3
where MANV='NV0010'
-- Hợp lệ
update NHANVIEN
set LUONG = LUONG * 1.1
where MANV='NV0010'

--PhanTanDung
--Viết thủ tục truyền vào một tham số mã hóa đơn,tham số tổng tiền là tham số đầu ra nhận kết quả trả về là tổng tiền của hóa đơn
CREATE PROC TONGTIEN @MAHD CHAR(10),@TONGTIEN FLOAT OUTPUT
AS
	SELECT @TONGTIEN = SOLUONG*DONGIA FROM HOADON WHERE MAHD = @MAHD
GO

--GỌI THỦ TỤC
DECLARE @TONGTIEN_HD FLOAT
EXEC TONGTIEN 'HD111', @TONGTIEN_HD OUTPUT
PRINT N'TỔNG TIỀN CỦA HÓA ĐƠN LÀ ' + CONVERT(CHAR(10),@TONGTIEN_HD)

--Viết thủ tục trả về họ tên nhân viên và tổng số hóa đơn mà nhân viên đó lập khi truyền vào tham số mã nhân viên 
CREATE PROC TONGHDLAP @MANV CHAR(10), @TONGHD INT OUTPUT
AS
	SET @TONGHD = (SELECT COUNT(MAHD) AS SOLUONGHD FROM HOADON, NHANVIEN WHERE HOADON.MANV = NHANVIEN.MANV AND NHANVIEN.MANV = @MANV)
GO

DECLARE @TONGHD_HD INT
EXEC TONGHDLAP 'NV0001', @TONGHD_HD OUTPUT
PRINT N'TỔNG HÓA ĐƠN LẬP LÀ ' + CONVERT(CHAR(10),@TONGHD_HD)

--Viết hàm truyền vào tham số mã mặt hàng và tên mặt hàng trả về 'không có hàng' nếu như không có mặt hàng đó, trả về 'đủ hàng' nếu số lượng hàng hóa >= 50, trả về 'thiếu hàng' nếu số lượng hàng < 50
CREATE FUNCTION DSMH (@MAMH CHAR(10), @TENMH NVARCHAR(20))
RETURNS FLOAT
AS
BEGIN
DECLARE @SOLUONGMH FLOAT
	IF EXISTS(SELECT MAMH,TENMH FROM MATHANG MH WHERE MAMH = @MAMH AND TENMH = @TENMH )
	BEGIN
		SET @SOLUONGMH=(SELECT SOLUONG FROM MATHANG WHERE MAMH = @MAMH AND TENMH = @TENMH )
	END
	RETURN @SOLUONGMH
END

--Thực thi
DECLARE @SOLUONG FLOAT
SET @SOLUONG =(SELECT DBO.DSMH ('MH0008',N'Bút bi xanh'))
IF @SOLUONG >= 50
PRINT N'ĐỦ HÀNG' 
ELSE IF @SOLUONG <50
PRINT N'THIẾU HÀNG'
ELSE
PRINT N'KHÔNG CÓ HÀNG'

--Viết hàm truyền vào tham số mã nhân viên quản lý và tên nhân viên trả về về số lượng nhân viên mà nhân viên đó quản lý
CREATE FUNCTION NVQL (@MANVQL CHAR(10))
RETURNS TABLE
AS
RETURN SELECT MANQL,COUNT(MANV) AS SOLUONGNVQL FROM NHANVIEN WHERE MANQL= @MANVQL  GROUP BY MANQL

--Thực thi
SELECT * FROM NVQL ('NV0006')

--Định nghĩa cursor_nv có kiểu cursor gồm mã nhân viên, tên nhân viên, tuổi của các nhân viên có người thân là bố. Đọc và xuất từng dòng dữ liệu
DECLARE CURSOR_NV CURSOR
DYNAMIC
FOR SELECT NV.MANV,TENNV,(YEAR(GETDATE()) - YEAR(NGAYSINH)) AS TUOI FROM NHANVIEN NV, THANNHAN TN WHERE NV.MANV = TN.MANV AND MQH = N'Bố'

--Mở cursor
OPEN CURSOR_NV

--Đọc và xử lý dữ liệu trong cursor
DECLARE @MANV CHAR(10), @TENNV NVARCHAR(20), @TUOI INT
FETCH NEXT FROM CURSOR_NV INTO @MANV, @TENNV, @TUOI
WHILE (@@FETCH_STATUS =0)
BEGIN
	PRINT @MANV+ @TENNV +N'     TUỔI: '+ CONVERT(CHAR(10),@TUOI)
	FETCH NEXT FROM CURSOR_NV INTO @MANV, @TENNV, @TUOI
END

--Đóng và hủy cursor cursor_nv
CLOSE CURSOR_NV

--Định nghĩa cursor_nv có kiểu cursor gồm mã nhân viên, tên nhân viên, tuổi của các nhân viên có người thân là bố. Đọc và xuất từng dòng dữ liệu
DECLARE CURSOR_MH CURSOR
DYNAMIC
FOR SELECT LMH.MALH,TENLH,COUNT(MAMH) AS SOLUONGLMATHANG FROM LOAIMATHANG LMH, MATHANG MH WHERE LMH.MALH = MH.MALH GROUP BY LMH.MALH, TENLH

--Mở cursor
OPEN CURSOR_MH

--Đọc và xử lý dữ liệu trong cursor
DECLARE @MALH CHAR(10), @TENLH NVARCHAR(20), @SOLUONGLMH INT
FETCH NEXT FROM CURSOR_MH INTO @MALH, @TENLH ,@SOLUONGLMH
WHILE (@@FETCH_STATUS =0)
BEGIN
	PRINT @MALH+ @TENLH +N'     SỐ LƯỢNG: '+ CONVERT(CHAR(10),@SOLUONGLMH)
	FETCH NEXT FROM CURSOR_MH INTO @MALH, @TENLH, @SOLUONGLMH
END

--Đóng và hủy cursor cursor_nv
CLOSE CURSOR_MH


-- Dương Thành Đạt
-- STORED PROCEDURE
-- Kiểm tra lương nếu dưới 8000000 thì xuất ra nhân viên mới còn lại thì là nhân viên cũ
CREATE PROC SP_NhanVien @manv char(10)
AS
DECLARE @luong float
set @luong=(select LUONG from NHANVIEN where MANV=@manv)
begin
	IF @luong < 8000000
	PRINT N'Nhân viên mới'
	ELSE
	PRINT N'Nhân viên cũ'
end
-- thực thi
EXEC SP_NhanVien 'NV0003';
-- xóa
DROP PROCEDURE SPNhanVien;

-- Thủ tục tăng 10% lương cho các nhân viên
CREATE PROC Tang_luong
AS
    UPDATE NHANVIEN SET LUONG = LUONG * 1.1
GO
-- Thực thi
EXEC Tang_luong
-- test
select Luong from NHANVIEN
-- Xóa
drop proc Tang_luong
-- FUNCTION
-- Đếm số hóa đơn của nhân viên
CREATE FUNCTION func1_hoadon(@manv char(10))
RETURNS INT
AS
	BEGIN
		DECLARE @dem INT
		SELECT @dem=COUNT(MAHD)
		FROM HOADON
		WHERE MANV=@manv
		RETURN @dem
	END

GO
-- thực thi
SELECT dbo.func1_hoadon('NV0001')
GO
--- Lấy ra tên nhân viên và tên thân nhân của nhân viên đó 
 CREATE FUNCTION func2_LaydiemSV()
 RETURNS TABLE RETURN
 SELECT NHANVIEN.TENNV,THANNHAN.TENTN
  FROM  dbo.THANNHAN INNER JOIN dbo.NHANVIEN
 ON THANNHAN.MANV = NHANVIEN.MANV 
 go
 -- Thực thi
 SELECT * FROM dbo.func2_LaydiemSV()
 go
 -- Từ tuổi nv. Nếu lớn hơn 35 thì lương là 15000000 lớn hơn 25 là 10000000 còn lại là 8000000
 declare NhanVienCursor CURSOR FOR SELECT MANV,YEAR(GETDATE()) - YEAR(NGAYSINH) from dbo.NHANVIEN
 open NhanVienCursor

 declare @manv char(10)
 declare @tuoi int 

 fetch next from NhanVienCursor into @manv, @tuoi

 while @@FETCH_STATUS=0
 begin
	if @tuoi >35
	begin
		update dbo.NHANVIEN set LUONG = 15000000 where MANV=@manv
	end
	else
	if @tuoi > 25
	begin
		update dbo.NHANVIEN set LUONG = 10000000 where MANV=@manv
	end
	else
	begin
		update dbo.NHANVIEN set LUONG = 8000000 where MANV=@manv
	end
	 fetch next from NhanVienCursor into @manv, @tuoi
end

close NhanVienCursor
deallocate NhanVienCursor

select * from HOADON
-- Sử dụng Cursor xuất ra mã hóa đơn và tiền của hóa đơn đó
declare HoaDon_Cursor Cursor for select MAHD,SOLUONG* DONGIA from dbo.HOADON
open HoaDon_Cursor
declare @mahd char,@thanhtien money 
fetch next from HoaDon_Cursor into @mahd,@thanhtien
while(@@FETCH_STATUS=0)
begin
	print @mahd+': '+convert(varchar(20),@thanhtien) 
	fetch next from HoaDon_Cursor
end
close HoaDon_Cursor
deallocate HoaDon_Cursor

-- TÀI ĐẠI DUY HÙNG
-- PHẦN FUNCTION 
-- 1. XUẤT HÓA ĐƠN CỦA KHÁCH HÀNG, KHI TRUYỀN VÀO THAM SỐ LÀ TENKH
CREATE FUNCTION TIMHOADON_KH (@tenkh nvarchar(20))
RETURNS TABLE
AS
RETURN (
	SELECT * FROM HOADON WHERE TENKH = @tenkh
)
GO


SELECT * FROM TIMHOADON_KH (N'Trần Tiến Đạt')

--2. HÀM TÌM MẶT HÀNG ĐƯỢC SẢN XUẤT KHI TRUYỀN VÀO NĂM

CREATE FUNCTION TIMMATHANGTHEONAM(@NAM int)
RETURNS TABLE 
AS
RETURN (SELECT TENMH, SOLUONG,NAMSX FROM MATHANG WHERE NAMSX = @NAM )
GO 

SELECT * FROM TIMMATHANGTHEONAM (1999)

--PHẦN THỦ TỤC
-- 1. XÂY DỤNG THỦ TỤC THỐNG KÊ SỐ LƯỢNG HÀNG BÁN ĐƯỢC CỦA MỘT MẶT HÀM(THAM SỐ THỦ TỤC)
CREATE PROC SP_THONGKEBANHANG(@mathang char(10))
AS
	SELECT MATHANG.MAMH, TENMH,
		SUM(HOADON.SOLUONG) AS TONGSOLUONG
	FROM MATHANG LEFT JOIN HOADON
	ON MATHANG.MAMH = HOADON.MAMH
	WHERE MATHANG.MAMH = @mathang
	GROUP BY MATHANG.MAMH, TENMH

EXEC SP_THONGKEBANHANG 'MH0001'
--2. TÍNH GIÁ TRỊ ĐƠN HÀNG 
CREATE PROC GIATRIDONHANG(@MAHOADON char(10))
AS
BEGIN
SELECT HOADON.MAHD, HOADON.DONGIA, HOADON.SOLUONG,
SUM(SOLUONG *DONGIA) AS TONGDONHANG
FROM HOADON
WHERE MAHD =@MAHOADON 
GROUP BY HOADON.MAHD, HOADON.DONGIA, HOADON.SOLUONG
END

EXEC GIATRIDONHANG 'MH0001'

-- CURSOR
-- 1. IN  RA CÁC MẶT HÀNG ĐƯỢC SẢN XUẤT TRÔNG KHOẢNG NĂM 1999 ĐẾN 2019
DECLARE CURSOR_NSXMATHANG CURSOR
DYNAMIC
FOR SELECT MAMH, TENMH FROM MATHANG WHERE NAMSX > 1999  AND NAMSX <2019

-- MỞ CURSOR
OPEN CURSOR_NSXMATHANG 
-- ĐỌC VÀ XỬ LÍ CURSOR
DECLARE @MAMH CHAR(10), @TENMH NVARCHAR(20)
FETCH NEXT FROM CURSOR_NSXMATHANG INTO @MAMH, @TENMH
WHILE(@@FETCH_STATUS = 0)
BEGIN 
	PRINT @MAMH +@TENMH 
	FETCH NEXT FROM CURSOR_NSXMATHANG INTO @MAMH, @TENMH
END

CLOSE  CURSOR_NSXMATHANG
DEALLOCATE CURSOR_NSXMATHANG

-- Huỳnh Công Quốc
--PROCEDURE
--Viết thủ tục kiểm tra số lượng mặt hàng nếu trên 60 thì xuất ra mặt hàng mới nhập còn lại là mặt hàng tồn kho
CREATE PROC SL_MatHang (@MAMH CHAR(10))
AS
DECLARE @SOLUONG FLOAT
SET @SOLUONG=(SELECT SOLUONG FROM MATHANG WHERE MAMH=@MAMH)
BEGIN
	IF @SOLUONG > 60
	PRINT N'Mặt hàng mới nhập'
	ELSE
	PRINT N'Mặt hàng tồn kho'
END
-- Thực thi
EXEC SL_MatHang'MH0002';
-- Xóa
DROP PROCEDURE SL_MatHang;

--Viết thủ tục in ra tên thân nhân của 1 nhân viên
CREATE PROC TN_ThanNhan(@MANV CHAR(10))
AS
BEGIN
SELECT dbo.THANNHAN.TENTN
FROM dbo.THANNHAN LEFT JOIN dbo.NHANVIEN
ON NHANVIEN.MANV = THANNHAN.MANV
WHERE dbo.NHANVIEN.MANV = @MANV
END
-- Thực thi
EXEC dbo.TN_ThanNhan @MANV = 'NV0007';
-- Xóa
DROP PROCEDURE TN_ThanNhan;

-- FUNCTION
--- Lấy ra tên loại hàng và tên mặt hàng
CREATE FUNCTION FC_LayTenMH()
 RETURNS TABLE 
 AS
 RETURN
	SELECT LOAIMATHANG.TENLH,MATHANG.TENMH
	FROM  dbo.MATHANG INNER JOIN dbo.LOAIMATHANG
	ON MATHANG.MALH = LOAIMATHANG.MALH 
GO
-- Thực thi
SELECT * FROM FC_LayTenMH()
GO
--Xóa 
DROP FUNCTION FC_LayTenMH
--Kiểm tra năm sinh của nhân viên có phải năm nhuận không
CREATE FUNCTION kiemtra_namnhuan(@MANV CHAR(10))
RETURNS NVARCHAR(100)
AS
    BEGIN
        DECLARE @namsinh INT
        SELECT @namsinh = YEAR(NGAYSINH) FROM NHANVIEN WHERE MANV = @MANV
        IF(@namsinh%400 = 0)
            RETURN N'Năm sinh của nhân viên này là năm nhuận'
        ELSE IF(@namsinh%4=0 and @namsinh % 100 !=0 )
            RETURN N'Năm sinh của nhân viên này là năm nhuận'
        ELSE RETURN N'Năm sinh của nhân viên này không phải năm nhuận'
    RETURN N'null'
END
--Thực thi--
SELECT dbo.kiemtra_namnhuan(MANV) AS [KẾT QUẢ KIỂM TRA NĂM SINH CỦA NHÂN VIÊN] FROM dbo.NHANVIEN
--Xóa
DROP FUNCTION kiemtra_namnhuan

--CURSOR
--Sử dụng NhanVien_Cursor đọc và xuất ra mã nhân viên và lương của nhân viên đó
DECLARE NhanVien_Cursor CURSOR FOR SELECT MANV,LUONG FROM dbo.NHANVIEN

OPEN NhanVien_Cursor

DECLARE @manv CHAR,@luong MONEY 
FETCH NEXT FROM NhanVien_Cursor INTO @manv,@luong
WHILE(@@FETCH_STATUS=0)
BEGIN
	PRINT @manv+': '+convert(VARCHAR(20),@luong) 
	FETCH NEXT FROM NhanVien_Cursor
END

CLOSE NhanVien_Cursor

DEALLOCATE NhanVien_Cursor 

--Sử dụng Contro_Cursor hiển thị danh sách mặt hàng năm 2011 bán ra có đạt doanh số <=50 không.
DECLARE Contro_Cursor CURSOR 
FOR SELECT MH.MAMH, TENMH, Year(NAMSX) AS NAMSX from MATHANG MH 
where Year(NAMSX) = 2011 or NAMSX IS NULL group by MH.MAMH, TENMH

OPEN Contro_Cursor

DECLARE @MAMH CHAR(10), @TENMH NVARCHAR(50), @SOLUONG int
FETCH NEXT FROM Contro_Cursor INTO @MAMH,@TENMH,@SOLUONG 
WHILE (@@FETCH_STATUS=0)
BEGIN
	if @SOLUONG <= 50
		print N'Không Đạt Yêu Cầu Doanh Số'
	else
		print N'Đạt Yêu Cầu Doanh Số'
		SELECT @MAMH, @TENMH, @SOLUONG
		FETCH NEXT FROM Contro_Cursor INTO @MAMH, @TENMH, @SOLUONG
END

CLOSE Contro_Cursor 
DEALLOCATE Contro_Cursor

select * from dbo.MATHANG drop table dbo.MATHANG


--TA KHANH NHAN---


--In ra đơn giá cao nhất
CREATE PROC HOADON_CN @TENMH NVARCHAR(20),@SANPHAM FLOAT OUTPUT
AS
	SELECT DONGIA
	FROM HOADON
	WHERE DONGIA = (SELECT MAX(DONGIA)
							FROM HOADON)
GO
DECLARE @SANPHAM_NN FLOAT
EXEC HOADON_CN N'SACH VAN', @SANPHAM_NN OUTPUT
DROP PROCEDURE HOADON_CN;

-- giảm 10% đơn giá 
CREATE PROC giamgia
AS	
UPDATE HOADON SET DONGIA = DONGIA /1.1
GO
-- Thực thi
EXEC giamgia
-- test
select DONGIA from HOADON
-- Xóa
drop proc giamgia

select * from HOADON

----- Lấy ra tên nhà sản xuất và mặt hàng của nhà sản xuất đó
CREATE FUNCTION NXB()
 RETURNS TABLE RETURN
 SELECT NHASANXUAT.TENNSX,MATHANG.TENMH
  FROM  dbo.MATHANG INNER JOIN dbo.NHASANXUAT 
 ON NHASANXUAT.MANSX = MATHANG.MANSX
 GO
 -- Thực thi
 SELECT * FROM dbo.NXB()
 go
 DROP FUNCTION dbo.NXB



 ---Cho biết trị giá hóa đơn thấp nhất là bao nhiêu
 CREATE FUNCTION MIN()
 RETURNS TABLE RETURN
 SELECT MIN(DONGIA) AS 'DON GIA CO GIA TRI THAP NHAT' 
 FROM HOADON
 GO
 SELECT *FROM dbo.MIN()
 GO
 DROP FUNCTION dbo.MIN

 select * from HOADON
 -- Hiển thị NSX
create proc HienThi_NSX
as
begin
select * from NHASANXUAT
end
 -- Thêm NSX
create proc Them_NSX
@MANSX CHAR(10),
@TENNSX NVARCHAR(25),
@DCNSX NVARCHAR(30),
@DTNSX CHAR(10)
as
begin
insert into NHASANXUAT(MANSX,TENNSX,DCNSX,DTNSX)
values(@MANSX,@TENNSX,@DCNSX,@DTNSX)
end

-- Sửa NSX
create proc Sua_NSX
@MANSX CHAR(10),
@TENNSX NVARCHAR(25),
@DCNSX NVARCHAR(30),
@DTNSX CHAR(10)
as
begin
UPDATE NHASANXUAT SET TENNSX = @TENNSX, DCNSX = @DCNSX, DTNSX = @DTNSX WHERE MANSX = @MANSX
end
-- Xóa NSX
create proc Xoa_NSX
@MANSX CHAR(10)
as
begin
DELETE FROM NHASANXUAT WHERE MANSX = @MANSX
end
-- Tìm kiếm
create proc Tim_NSX
@MANSX CHAR(10)
as
begin
SELECT * FROM NHASANXUAT WHERE MANSX=@MANSX
end
drop proc Tim_NSX
-- hiển thị mặt hàng
create proc HienThi_MH
as
begin
SELECT * FROM MATHANG
end
-- Thêm mặt hàng
create proc Them_MH
@MAMH CHAR(10),
@MANSX CHAR(10),
@MALH CHAR(10),
@TENMH NVARCHAR(20),
@SOLUONG INT,
@NAMSX INT
as 
begin
INSERT INTO MATHANG(MAMH,MANSX,MALH,TENMH,SOLUONG,NAMSX)
VALUES (@MAMH,@MANSX,@MALH,@TENMH,@SOLUONG,@NAMSX)
end
-- Xóa mặt hàng
create proc Xoa_MH
@MAMH CHAR(10)
as
begin
DELETE FROM MATHANG WHERE MAMH = @MAMH
end
-- Sửa mặt hàng
create proc Sua_MH
@MAMH CHAR(10),
@MANSX CHAR(10),
@MALH CHAR(10),
@TENMH NVARCHAR(20),
@SOLUONG INT,
@NAMSX INT
as 
begin
UPDATE MATHANG SET MANSX = @MANSX, MALH = @MALH, TENMH = @TENMH, SOLUONG = @SOLUONG, NAMSX = @NAMSX WHERE MAMH = @MAMH
end