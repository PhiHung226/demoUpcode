create database web_quan_ao_tre_em
go
use web_quan_ao_tre_em
go

create table Admins(
	idAdmins varchar(20) not null primary key,
	hoTen nvarchar(50) not null,
	gioiTinh bit default 0 not null,
	passAdmins nvarchar(20) not null,
	namSinh date not null,
	queQuan nvarchar(100) not null,
	phone nvarchar (13) not null,
	email nvarchar(30) null,
	img nvarchar(100) null,
	chucVu bit default 0,
	ngayLap date default getDate(),
)
create table Users(
	idUsers varchar(13) not null primary key,
	passUsers nvarchar(30) null,
	hoTen nvarchar(30) null,
	diaChi nvarchar(100) not null,
	email nvarchar(30) null,
	img nvarchar(100) null,
	trangThai bit default 1,
)
--Tính chất của sản phẩm
-- Độ tuổi (trẻ sơ sinh, học sinh tiểu học, học sinh mẫu giáo..)(0-1 tuổi, 1-3 tuổi...) tạo bảng
create table TheLoai(
	idTheLoai int IDENTITY(1,1) not null primary key,
	tenTheLoai nvarchar(50) not null,
)
create table KichThuoc(
	idKichThuoc int IDENTITY(1,1) not null primary key,
	tenKichThuoc varchar(10) not null,
	chieuCaoMax int null,--dự án rộng có thể phải tạo bảng cho cả chiều cao lẫn cân nặng
	chieuCaoMin int null,
	canNangMax int null,
	canNangMin int null,
	tuoiMax int null,--tuổi cho vào bảng độ tuổi
	tuoiMin int null,
)
create table MauSac(
	idMauSac int IDENTITY(1,1) not null primary key,
	tenMauSac nvarchar(20) not null,
)
create table ChatLieu(
	idChatLieu int IDENTITY(1,1) not null primary key,
	tenChatLieu nvarchar(20) not null,
)
create table ThoiTiet(
	idThoiTiet int IDENTITY(1,1) not null primary key,
	tenThoiTiet nvarchar(20) not null,
)
create table XuatXu(
	idXuatXu int IDENTITY (1,1) not null primary key,
	tenXuatXu nvarchar(50) not null,
)
create table SanPham(
	idSanPham int IDENTITY(1000,1) not null primary key,
	tenSanPham nvarchar(100) not null,
	gioiTinh bit default 0,--(cho bé nam, cho bé nữ, cả nam và nữ đề mặc được)

	idTheLoai int not null foreign key references TheLoai(idTheLoai),
	idKichThuoc int not null foreign key references KichThuoc(idKichThuoc),
	idMauSac int not null foreign key references MauSac(idMauSac),
	idChatLieu int not null foreign key references ChatLieu(idChatLieu),
	idThoiTiet int not null foreign key references ThoiTiet(idThoiTiet),
	idXuatXu int not null foreign key references XuatXu(idXuatXu),
	giaSanpham int not null,
	img varchar(100) not null,
	trangThai bit default 1,
	ngayNhap date default getDate(),
)
--Phiếu xuất hàng
create table PhieuXuatHang(
	idPhieuXuatHang int IDENTITY(1000,1) not null primary key,
	idAdmins varchar(20) null foreign key references Admins(idAdmins),
	idUsers varchar(13) not null foreign key references Users(idUsers),
	ngayDatMua Date default getDate(),
	trangThai bit default 1,
	hoanThienDon bit default 0,
)
create table PhieuXuatHangChiTiet(
	idPXHCT int IDENTITY(1,1) not null primary key,
	idPhieuXuatHang int not null foreign key references PhieuXuatHang(idPhieuXuatHang) ON DELETE CASCADE,
	idSanPham int not null foreign key references SanPham(idSanPham),
	soLuong int default 1,
)
--Khuyến mãi
create table KhuyenMai(
	idChiTietKhuyenMai int IDENTITY(1,1) not null primary key,
	idSanPham int not null foreign key references SanPham(idSanPham) ON DELETE CASCADE,
	idAdmins varchar(20) foreign key references Admins(idAdmins),
	mucDoKhuyenMai float default 0,
	soLuong int default 1,
	ngayDangKhuyenMai date default getDate(),
)
--Đánh giá sản phẩm
create table DanhGia(
	idDanhGia int IDENTITY(1,1) not null primary key,
	YKien nvarchar(500) null,
	idUsers varchar(13) not null foreign key references Users(idusers),
	ngayDanhGia date default getDate(),
)

select * from Admins
select * from Users
select * from TheLoai
select * from KichThuoc
select * from MauSac
select * from ChatLieu
select * from XuatXu
select * from SanPham
select * from PhieuXuatHang
select * from phieuXuatHangChiTiet
select * from KhuyenMai
select * from DanhGia

drop database web_quan_ao_tre_em

--insert database
insert into Admins values('camtu',N'Ong Thị Cẩm Tú',1,'123','10/23/1990',N'Hà Nội','0904556123','ongthicamtu@gamil.com','img.jpg',1)
insert into Admins values('vangiang',N'Nguyễn Thị Vân Giang',1,'456','05/10/1998',N'Ninh Bình','0904556123','nguyenthivangiang@gmail.com','img.jpg',0)

insert into Users values('0912333123','111',N'Trần Văn Đạt',N'Hà Nội', 'datdaudit@gamil.com','image.jpg',1)

insert into TheLoai values(N'Quần')
insert into TheLoai values(N'Áo')
insert into TheLoai values(N'Váy')

insert into KichThuoc values ('S','','','','',10,6)
insert into KichThuoc values ('M','','','','',10,6)
insert into KichThuoc values ('L','','','','',10,6)
insert into KichThuoc values ('XL','','','','',10,6)

insert into MauSac values(N'Đỏ')
insert into MauSac values(N'Vàng')
insert into MauSac values(N'Đen')
insert into MauSac values(N'Trắng')

insert into ChatLieu values(N'Nỉ')
insert into ChatLieu values(N'Cotton')
insert into ChatLieu values(N'Len')
insert into ChatLieu values(N'Bông')

insert into ThoiTiet values (N'Đông')
insert into ThoiTiet values (N'Hè')
insert into ThoiTiet values (N'Xuân')
insert into ThoiTiet values (N'Thu')

insert into XuatXu values (N'Việt Nam')
insert into XuatXu values (N'Trung Quốc')
insert into XuatXu values (N'Nhật Bản')
insert into XuatXu values (N'Thái Lan')

insert into SanPham values (N'Quần dài bông cho trẻ nam',0,1,1,1,4,1,1,200000,'imageSP.jpg',1,'11/07/2020')
insert into SanPham values (N'Quần dài bông cho trẻ nam',0,1,1,2,4,1,1,200000,'imageSP.jpg',1,'11/07/2020')
insert into SanPham values (N'Quần dài bông cho trẻ nam',0,1,1,3,4,1,1,200000,'imageSP.jpg',1,'11/07/2020')
insert into SanPham values (N'Quần dài bông cho trẻ nam',0,1,1,4,4,1,1,200000,'imageSP.jpg',1,'11/07/2020')

insert into PhieuXuatHang values ('vangiang', '0912333123','11/7/2020',1,1)

insert into PhieuXuatHangChiTiet values (1000,1000,1)
insert into PhieuXuatHangChiTiet values (1000,1001,1)

insert into KhuyenMai values (1000,'camtu',10,1,'11/07/2020')

insert into DanhGia values ('Sản phẩm tốt','0912333123','11/07/2020')
