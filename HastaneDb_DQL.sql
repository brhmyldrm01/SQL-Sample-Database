select * from servis
select*  from poliklinik 
select*  from Poliklinik_Hasta
select*  from hasta
select*  from laboratuvar
select * from tahlil
select * from doktor
select * from Tahlil_Hasta
select * from Tahlil_Doktor
select * from hemsire


select  distinct  DoktorNo from Tahlil_Doktor
select distinct Hastano from Tahlil_Hasta

select * from hasta where yas >30
select * from hasta where yas between 30 and 50

select *from hemsire order by HemNo 

select * from hasta where ad like 'hasta%'
select * from hasta where  ad like '___'

select * from (hasta h  right join Poliklinik_Hasta P on h.hastaNo=p.HastaNo )
join poliklinik pol on pol.PolNo=p.PolNo

select * from doktor t join Tahlil_Doktor td  on t.DoktorNo=td.DoktorNo

select * from poliklinik p join doktor d on p.PolNo=d.polNo

select * from hasta h left join Tahlil_Hasta t on h.hastaNo = t.HastaNo order by ad desc


select distinct ornek as 'ornektipi',COUNT(tahlilNo) 'tahlilsayisi'  from tahlil group by ornek


