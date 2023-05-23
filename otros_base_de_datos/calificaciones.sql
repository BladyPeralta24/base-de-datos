
create table calificacion(
        ident int primary key,
        nombre varchar(100) not null,
        nota float not null
        );

insert into calificacion (ident, nombre, nota) values (101, 'Fernando Alvarez', 4);
insert into calificacion (ident, nombre, nota) values (102, 'Roberto Moreno', 6.1);
insert into calificacion (ident, nombre, nota) values (103, 'Cristina Ávila', 7.5);
insert into calificacion (ident, nombre, nota) values (104, 'Lorena Valdivia', 5.5);
insert into calificacion (ident, nombre, nota) values (105, 'Cristian López', 9.3);
insert into calificacion (ident, nombre, nota) values (106, 'Inma Cabello', 10);



select ident, nombre, case
when nota < 5 then 'suspenso'
when nota >= 5 and nota < 6 then 'aprobado'
when nota >= 6 and nota < 7 then 'bien'
when nota >= 7 and nota < 9 then 'notable'
when nota >= 9 then 'sobresaliente'
end
from calificacion;
