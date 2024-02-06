-- 1 cuantas actuaciones en Torrelavega
select count(*) 
from ayuntamientos 
inner join zonasyaytos on ayuntamiento=IdAyto
inner join zonas on idzona=zonasyaytos.zona
inner join plantasyzonas on idzona=plantasyzonas.zona
inner join actuaciones on idplantazona=plantazona
where ayuntamientos.nombre='Torrelavega';
-- 2 cuantas actuaciones en cada ayuntamiento
select count(*), ayuntamientos.nombre
from ayuntamientos 
inner join zonasyaytos on ayuntamiento=IdAyto
inner join zonas on idzona=zonasyaytos.zona
inner join plantasyzonas on idzona=plantasyzonas.zona
inner join actuaciones on idplantazona=plantazona
group by ayuntamientos.nombre
order by count(*) desc;
-- 3 sacar el ayuntamiento con el máximo numero de actuaciones
select count(*), ayuntamientos.nombre
from ayuntamientos 
inner join zonasyaytos on ayuntamiento=IdAyto
inner join zonas on idzona=zonasyaytos.zona
inner join plantasyzonas on idzona=plantasyzonas.zona
inner join actuaciones on idplantazona=plantazona
group by ayuntamientos.nombre
order by count(*) desc limit 1;

-- 4 sacar cuantas actuaciones se han hecho con herbicida
select count(*) 
from actuaciones
inner join erradicaconherbicida on actuacion=codactuacion;

-- sacar cuantas actuaciones se han hecho de forma manual
select count(*)
from actuaciones 
inner join erradicamanual on actuacion=codactuacion;

-- 5 sacar cuantas actuaciones se han hecho  forma manual y con herbicida
select * from actuaciones 
inner join erradicaconherbicida on erradicaconherbicida.actuacion=codactuacion
inner join erradicamanual on erradicamanual.actuacion=codactuacion;

-- 6 en que ayuntamientos se ha actuado contra el plumero de la pampa
select distinct a.Nombre
from ayuntamientos a
inner join zonasyaytos z on a.IdAyto=z.ayuntamiento
inner join zonas zs on z.zona=zs.idzona
inner join plantasyzonas pz on zs.idzona=pz.zona
inner join actuaciones ac on pz.Idplantazona=ac.plantazona
inner join especies e on e.codespecie=pz.planta
where nomvulgar='Plumero de la Pampa';

-- 7 que ayuntamientos recoge la zona de la Sierra de Ibio
select ayuntamientos.nombre
from ayuntamientos
inner join zonasyaytos on IdAyto=ayuntamiento
inner join zonas on zona=idzona
where zonas.nombre='Sierra de Ibio';

-- 8 indica las zonas que incluyen más de un ayuntamiento, indicando cuantos ayuntamientos incluyen
select zonas.nombre, count(*)
from zonas
inner join zonasyaytos on zona=idzona
inner join ayuntamientos on ayuntamiento=IdAyto
group by zonas.nombre
having count(*)>1
order by count(*) desc;

-- 9 indica los ayuntamientos que hay por cada comarca
select comarcas.nombre, count(*)
from ayuntamientos
inner join comarcas on comarca=idcomarca
group by comarcas.nombre
order by count(*) desc;

-- 10 cuantas actuaciones se han llevado a cabo en la comarca de Trasmiera, Besaya y Santander, indicando el número de actuaciones para cada comarca
-- Indica cuantas actuaciones se han llevado a cabo en cada una de estas comarcas: Trasmiera, Besaya y Santander.
select com.nombre, count(*)
from comarcas com
inner join ayuntamientos ayto on ayto.comarca=com.idcomarca
inner join zonasyaytos zya on zya.ayuntamiento=ayto.IdAyto
inner join zonas zon on zon.idzona=zya.zona
inner join plantasyzonas pyz on pyz.zona=zon.idzona
inner join actuaciones act on act.plantazona=pyz.zona
where com.nombre in ('Trasmiera','Besaya','Santander')
group by com.nombre;

-- 11 indica en que zonas se encuentra el plumero de la pampa

select zon.nombre
from especies e 
inner join plantasyzonas pyz on e.codespecie=pyz.planta
inner join zonas zon on zon.idzona=pyz.zona
where e.nomvulgar='Plumero de la pampa';

-- 11 indica en cuantas zonas se encuentran cada una de las especies invasoras.

select count(*), nomvulgar
from especies e 
inner join plantasyzonas pyz on e.codespecie=pyz.planta
inner join zonas zon on zon.idzona=pyz.zona
group by nomvulgar
order by count(*) desc;

-- 12 indica el total de km cuadrados afectados por el plumero de la pampa

select sum(superafectakm2)
from especies e 
inner join plantasyzonas pyz on e.codespecie=pyz.planta
inner join zonas zon on zon.idzona=pyz.zona
where e.nomvulgar='Plumero de la pampa';

-- 13 indica el total de km cuadrados afectados por cada una de las plantas invasoras

select sum(superafectakm2), nomvulgar
from especies e 
inner join plantasyzonas pyz on e.codespecie=pyz.planta
inner join zonas zon on zon.idzona=pyz.zona
group by nomvulgar
order by count(*) desc;

-- 14 calcula cual ha sido la desviación entre el presupuesto inicial y el coste final de las actuaciones que se han hecho sobre el plumero de la pampa

select sum(presupuesto) as 'Total presupuestado', sum(costefinal) as 'Total coste final',
sum(costefinal)-sum(presupuesto) as 'Desviación coste menos presupuesto'
from actuaciones
inner join plantasyzonas on Idplantazona=plantazona
inner join especies on planta=codespecie;

/*15 En la zona del parque de la viesca, se ha hecho una actuación sobre la Uña de gato en una superficie afectada de 2.5 km2. La actuación comenzó hace una semana y
finalizó hoy mismo. Contaba con un prespuesto de 785 euros pero su coste final fue de 1300 euros. La superficie erradicada fue de 2 km2. Como la erradicación ha sido manual, se han eliminado
12 kg de esta planta invasora. 
Debes dar de alta todos estos datos en la base de datos. 
Una vez dados de alta todos los datos, debes modificar en la tabla plantas y zonas que la superficie afectada ha pasado de 2.5 a solo 0.5 km2.*/

insert into plantasyzonas
values(
(select * from (select max(idplantazona)+1 from plantasyzonas)as a),
(select codespecie from especies where nomvulgar='Uña de gato'),
(select idzona from zonas where nombre='Parque de la Viesca'),
2.5);

insert into actuaciones
values(
(select * from (select max(codactuacion)+1 from actuaciones)as a),
subdate(curdate(),interval 1 week),
curdate(),
785, 1300,
17,
2);

insert into erradicamanual
values(7,12);

update plantasyzonas
set superafectakm2=0.5
where idplantazona=17;

-- 16 modifica el contenido de la tabla especies por zonas, y actualiza el numero de km2 afectados por cada especie. Puedes modificarlo, o borrar todo e insertar los datos de nuevo
select * from especiesporzonas;
delete from especiesporzonas;
insert into especiesporzonas
select nomvulgar, sum(superafectakm2)
from especies
inner join plantasyzonas on codespecie=planta
group by nomvulgar;

select * from especiesporzonas;