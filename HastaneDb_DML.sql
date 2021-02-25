insert into hasta values('ayse',18)
insert into hasta values('ali',19)
insert into hasta values('aliiii',19)
insert into hasta values('hasta1',18)
insert into hasta values('hasta2',25)
insert into hasta values('hasta3',58)
insert into hasta values('hasta4',19)
insert into hasta values('hasta5',51)
insert into hasta values('hasta6',44)


insert into poliklinik (kat,kapasite) values (2,2);
insert into poliklinik (kapasite) values (5);
insert into poliklinik (kapasite) values (3);
insert into poliklinik (kapasite) values (12);

insert into Poliklinik_Hasta (HastaNo,PolNo) values(21,22)
insert into Poliklinik_Hasta (HastaNo,PolNo) values(22,22)
insert into Poliklinik_Hasta (HastaNo,PolNo) values(23,22)
insert into Poliklinik_Hasta (HastaNo,PolNo) values(24,25)
insert into Poliklinik_Hasta (HastaNo,PolNo) values(25,25)
insert into Poliklinik_Hasta (HastaNo,PolNo) values(26,24)

insert into Poliklinik_Hasta (HastaNo,PolNo) values(27,24)
insert into Poliklinik_Hasta (HastaNo,PolNo) values(28,23)
insert into Poliklinik_Hasta (HastaNo,PolNo) values(29,23)

delete from Poliklinik_Hasta where hastaNo=22
delete from hasta where hastaNo=23
delete from hasta where hastaNo=21


update hasta set yas = 20 where hastaNo=22

insert into servis (yataksayisi,polNo)values(45,22)
insert into servis (yataksayisi,polNo)values(5,23)
insert into servis (yataksayisi,polNo)values(15,24)
insert into servis (yataksayisi,polNo)values(40,25)


insert into laboratuvar (tahlilTur) values('IDR')
insert into laboratuvar (tahlilTur) values('KAN')

insert into tahlil (ornek,LabNo) values('IDR',6)
insert into tahlil (ornek,LabNo) values('IDR',6)
insert into tahlil (ornek,LabNo) values('IDR',6)
insert into tahlil (ornek,LabNo) values('IDR',6)
insert into tahlil (ornek,LabNo) values('IDR',6)
insert into tahlil (ornek,LabNo) values('IDR',6)
insert into tahlil (ornek,LabNo) values('IDR',6)
insert into tahlil (ornek,LabNo) values('KAN',7)
insert into tahlil (ornek,LabNo) values('KAN',7)
insert into tahlil (ornek,LabNo) values('KAN',7)
insert into tahlil (ornek,LabNo) values('KAN',7)


insert into Tahlil_Hasta (HastaNo,TahlilNo) values(22,4)
insert into Tahlil_Hasta (HastaNo,TahlilNo) values(22,11)
insert into Tahlil_Hasta (HastaNo,TahlilNo) values(24,5)
insert into Tahlil_Hasta (HastaNo,TahlilNo) values(24,12)
insert into Tahlil_Hasta (HastaNo,TahlilNo) values(25,6)
insert into Tahlil_Hasta (HastaNo,TahlilNo) values(25,13)
insert into Tahlil_Hasta (HastaNo,TahlilNo) values(26,7)
insert into Tahlil_Hasta (HastaNo,TahlilNo) values(26,14)
insert into Tahlil_Hasta (HastaNo,TahlilNo) values(27,8)
insert into Tahlil_Hasta (HastaNo,TahlilNo) values(28,9)
insert into Tahlil_Hasta (HastaNo,TahlilNo) values(29,10)

insert into doktor (ad,polNo) values('doktor1',22)
insert into doktor (ad,polNo) values('doktor2',23)
insert into doktor (ad,polNo) values('doktor3',24)
insert into doktor (ad,polNo) values('doktor4',25)

insert into Tahlil_Doktor (DoktorNo,TahlilNo) values(1,13)
insert into Tahlil_Doktor (DoktorNo,TahlilNo) values(1,14)
insert into Tahlil_Doktor (DoktorNo,TahlilNo) values(1,6)
insert into Tahlil_Doktor (DoktorNo,TahlilNo) values(2,4)
insert into Tahlil_Doktor (DoktorNo,TahlilNo) values(2,5)
insert into Tahlil_Doktor (DoktorNo,TahlilNo) values(3,7)
insert into Tahlil_Doktor (DoktorNo,TahlilNo) values(3,8)
insert into Tahlil_Doktor (DoktorNo,TahlilNo) values(4,9)
insert into Tahlil_Doktor (DoktorNo,TahlilNo) values(4,10)
insert into Tahlil_Doktor (DoktorNo,TahlilNo) values(2,11)
insert into Tahlil_Doktor (DoktorNo,TahlilNo) values(3,12)


insert into hemsire (ad,ServisNo) values('hem1',2)
insert into hemsire (ad,ServisNo) values('hem2',2)
insert into hemsire (ad,ServisNo) values('hem3',3)
insert into hemsire (ad,ServisNo) values('hem4',2)
insert into hemsire (ad,ServisNo) values('hem5',3)
insert into hemsire (ad,ServisNo) values('hem6',6)
insert into hemsire (ad,ServisNo) values('hem7',4)
insert into hemsire (ad,ServisNo) values('hem8',6)

insert into hasta (ad,yas) values ('ibo',58)
insert into tahlil (ornek,LabNo)  values('KAN',7)

exec hasta_giris @no=30,@pol=25
exec tahlil_giris @dokno=4,@hastano=30,@tahlilno=15

delete from Poliklinik_Hasta where HastaNo=255

