	CREATE DATABASE HastaneDb ON PRIMARY
(NAME = HastaneDb_Data,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER11\MSSQL\DATA\HastaneDb_Data.mdf',
SIZE = 2MB, MAXSIZE = 10MB, FILEGROWTH = 10%)
LOG ON (NAME = HastaneDb_Log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER11\MSSQL\Log\HastaneDb_Log.ldf',
SIZE = 1MB, MAXSIZE = 5MB, FILEGROWTH = 10%)

create  type kod from SMALLINT  not null; 
create type tahlil_tur from char(3) not null;

 CREATE TABLE laboratuvar(
labNo kod primary key,
tahlilTur tahlil_tur,
kat tinyint
)
alter table laboratuvar add constraint def_kat default 3 for kat

create table tahlil(
TahlilNo kod primary key,
ornek tahlil_tur,
LabNo kod foreign key references laboratuvar(labNo)
)


create table poliklinik(
PolNo kod primary key,
kat tinyint ,
durum	bit not null,
)

alter table poliklinik add constraint def_pol_kat default 1 for kat

create table doktor(
DoktorNo kod primary key,
Ad varchar(45) not null,
polNo kod foreign key references poliklinik(polNo)
)

create table hasta(
hastaNo kod primary key,
Ad varchar (45) not null,
yas tinyint not null,
)

alter table hasta add constraint chck_yas check( yas>=18 and yas<=100)

create table servis (
servisNo kod primary key IDENTITY(1,1),
yataksayisi tinyint,
polNo kod foreign key references poliklinik(PolNo)
)
alter table servis add constraint chck_yatak1 check( yataksayisi>=0 and yataksayisi<=60)

create table hemsire (
HemNo kod primary key IDENTITY(1,1),
Ad varchar(45) not null,
ServisNo kod foreign key references servis(servisNo)
)

create table  Tahlil_Hasta(
HastaNo kod foreign key references hasta(hastaNo),
TahlilNo kod foreign key references tahlil(tahlilNo) primary key
)

create table  Tahlil_Doktor(
DoktorNo kod foreign key references doktor(doktorNo),
TahlilNo kod foreign key references tahlil(tahlilNo) primary key
)

create table  Poliklinik_Hasta(
HastaNo kod foreign key references hasta(hastaNo),
PolNo kod foreign key references poliklinik(PolNo)
)



alter table poliklinik add kapasite int  not null 
alter table poliklinik add mevcut_hasta int 
alter table poliklinik add constraint def_hasta default 0 for mevcut_hasta
alter table poliklinik drop column durum



create trigger yenihasta
on Poliklinik_Hasta
instead of  insert	
as 
begin
declare @polno smallint
declare @kapasite int
declare @mev_hasta int
declare @hno int
select @polno=PolNo from inserted
select @mev_hasta=P.mevcut_hasta from poliklinik P where P.PolNo=@polno
select @kapasite=P.kapasite from poliklinik P where P.PolNo=@polno
select @hno=hastano from inserted

if @mev_hasta < @kapasite 
begin
insert into Poliklinik_Hasta values(@hno,@polno)
update poliklinik set mevcut_hasta=P.mevcut_hasta +1 from poliklinik P join inserted I on I.PolNo=P.PolNo where P.PolNo=@polno
end
else
print 'Kapasite dolu.'
end

create trigger hastasilindi
on Poliklinik_Hasta
 after delete	
as 
begin
declare @polno smallint
select @polno=PolNo from inserted
update poliklinik set mevcut_hasta=mevcut_hasta-1 from
poliklinik P join deleted I on I.PolNo=P.PolNo

end



create trigger hastaCikis
on hasta 
after delete 
as 
declare @hasta int
select @hasta=hastaNo from deleted 

begin 
delete from Poliklinik_Hasta where HastaNo=@hasta
end



create proc hasta_giris 
 @no int  ,
 @pol smallint
 AS
 begin
insert into Poliklinik_Hasta (HastaNo,PolNo) values(@no,@pol)
end

create proc tahlil_giris 
 @dokno int  ,
 @hastano int,
 @tahlilno int
 AS
 begin
insert into Tahlil_Hasta (HastaNo,TahlilNo) values(@hastano,@tahlilno)
insert into Tahlil_Doktor (TahlilNo,DoktorNo) values(@tahlilno,@dokno)
end


create index jn_index on 
Tahlil_Doktor(doktorno)

create index jn_index1 on
Tahlil_Hasta(hastano)

create index jn_index2 on
Poliklinik_Hasta(polno)
