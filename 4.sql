create database xn_hang;
use xn_hang;
create table phieu_xuat(
	id_px int primary key auto_increment,
    sopx int,
    ngay_xuat date
);
create table vat_tu(
	id_vt int primary key auto_increment,
    maVTU varchar (225), 
    tenVTU varchar(225)
);
create table phieu_nhap(
	id_pn int primary key auto_increment,
    sopn int,
    ngay_nhap date
);
create table don_dh(
	idddh int primary key auto_increment,
    sodh int ,
    ngaydh date 
);
create table nha_cc(
	id_cc int primary key auto_increment,
    mancc varchar(225),
    tenncc varchar(225),
    diachi varchar(225),
    phone(11)
);
create table ct_px(
	id_ctpx int primary key auto_increment,
    id_px int,
    id_vt int,
    dg_xuat int,
    sl_xuat int,
    foreign key(id_px)references phieu_xuat(id_px),
    foreign key(id_vt)references vat_tu(id_vt)
);
create table ct_pn(
	id_ct_pn int primary key auto_increment,
    id_vt int,
    id_pn int,
    dg_nhap int,
    sl_nhap int,
    foreign key (id_vt)references vat_tu(id_vt),
	foreign key (id_pn)references phieu_nhap(id_pn)
);
create table ct_ddh(
	id_ct int primary key auto_increment,
    id_vt int,
    id_dh int,
    foreign key(id_vt)references vat_tu(id_vt),
    foreign key(id_dh) references don_dh(id_ddh)
);
create table cc(
	id_cc int primary key auto_increment,
    id_ddh int,
    id_ncc int,
    foreign key (id_ddh) references don_dh(idddh),
    foreign key(id_ncc) references nha_cc(id_cc)
);
