--create database DoAnTN
use DoAnTN

create table MaGiamGia(
	id int primary key,
	tenMGG nvarchar(50),
	phanTramGG int,
	nguoiTao int,
	sl int
)

create table DonHang(
	id int primary key,
	ngayDat date,
	trangThai nvarchar(20),
	tongTien float, 
	maGiamGia int,

	constraint fk_dh_mgg foreign key (maGiamGia) references MaGiamGia (id)
)

create table DanhMuc(
	id int primary key,
	tenDM nvarchar(50),
	nguoiTao nvarchar(20)
)

create table ThuongHieu(
	id int primary key,
	tenTH nvarchar(50)
)

create table Shop(
	id int primary key,
	tenShop nvarchar(50),
	hinhAnh nvarchar(150),
	moTa nvarchar(300),
	video nvarchar(150)
)

create table SanPham(
	id int primary key,
	tenSP nvarchar(50),
	danhMuc int,
	gia float,
	moTa nvarchar(200),
	thuongHieu int,
	hinhAnh nvarchar(150),
	video nvarchar(150),
	canNang int,
	kichThuoc nvarchar(15),
	tinhTrang nvarchar(15),
	slTon int,
	shop int,

	constraint fk_sp_dm foreign key (danhMuc) references DanhMuc (id),
	constraint fk_sp_th foreign key (thuongHieu) references ThuongHieu (id),
	constraint fk_sp_s foreign key (shop) references Shop (id)
)

create table ChiTietDonHang(
	donHang int,
	sanPham int,
	sl int,
	maGG int,

	primary key(donHang,sanPham),
	constraint fk_ctdh_dh foreign key (donHang) references DonHang (id),
	constraint fk_ctdh_sp foreign key (sanPham) references SanPham (id),
	constraint fk_ctdh_mgg foreign key (maGG) references MaGiamGia (id)
)

create table NhaVanChuyen(
	id int primary key,
	tenNVC nvarchar(50),
	sdt nvarchar(11),
	moTa nvarchar(200)
)

create table NguoiDung(
	id int primary key, 
	username nvarchar(50), 
	email nvarchar(100),
	sdt char(10),
	hoTen nvarchar(100),
	matKhau nvarchar(100),
	gioiTinh bit,
	ngaySinh date,
	hinhAnh nvarchar(150),
	shop int,

	constraint fk_nd_shop foreign key (shop) references Shop (id)
)

create table DiaChi(
	id int primary key,
	diaChi nvarchar(200)
)

create table DiaChiNguoiDung(
	nguoiDung int,
	diaChi int,
	macDinh bit,

	primary key(nguoiDung, diaChi),
	constraint fk_nd_dcnd foreign key (nguoiDung) references NguoiDung(id),
	constraint fk_dc_dcnd foreign key (diaChi) references DiaChi(id)
)

create table NguoiQuanTri(
	id int primary key,
	username nvarchar(50),
	email nvarchar(100),
	matKhau nvarchar(100),
	hoTen nvarchar(100),
	sdt nvarchar(11),
	diaChi nvarchar(100),
	cmnd nvarchar(12),
)

create table Quyen(
	id int primary key,
	tenQuyen nvarchar(20)
)

create table QuyenQuanTri(
	ngQuanTri int,
	quyen int,

	primary key(ngQuanTri, quyen),
	constraint fk_qqt_ngt foreign key (ngQuanTri) references NguoiQuanTri (id),
	constraint fk_qqt_q foreign key (quyen) references Quyen(id)
)

create table GioHang(
	id int primary key,
	nguoiDung int,
	tongTien float,
	maGG int,

	constraint fk_gh_nd foreign key (nguoiDung) references NguoiDung(id),
	constraint fk_gh_mgg foreign key (maGG) references MaGiamGia(id)
)

create table ChiTietGioHang(
	sanPham int,
	gioHang int,
	sl int default(1),
	soTien float,
	trangThaiChon bit,
	maGG int,

	primary key(sanPham,gioHang),
	constraint fk_ctgh_sp foreign key (sanPham) references SanPham(id),
	constraint fk_ctgh_gh foreign key (gioHang) references GioHang(id),
	constraint fk_ctgh_mgg foreign key (maGG) references MaGiamGia(id)
)


alter table ThuongHieu
add nguoiTao int

alter table ThuongHieu
add constraint fk_th_nqt foreign key (nguoiTao) references NguoiQuanTri(id)

alter table NhaVanChuyen
add nguoiTao int

alter table NhaVanChuyen
add constraint fk_nvc_nqt foreign key (nguoiTao) references NguoiQuanTri(id)

alter table ChiTietDonHang
add soTien float

alter table DonHang
add nguoiDung int

alter table DonHang 
add constraint fk_dh_nd foreign key (nguoiDung) references NguoiDung(id)

alter table DanhMuc
add trangThai int default(1)

alter table DiaChi
add trangThai int default(1)

alter table DiaChiNguoiDung
add trangThai int default(1)

alter table NguoiDung
add trangThai int default(1)

alter table NguoiQuanTri
add trangThai int default(1)

alter table NhaVanChuyen
add trangThai int default(1)

alter table Quyen
add trangThai int default(1)

alter table QuyenQuanTri
add trangThai int default(1)

alter table SanPham
add trangThai int default(1)

alter table Shop
add trangThai int default(1)

alter table ThuongHieu
add trangThai int default(1)