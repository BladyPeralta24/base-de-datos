--1
create view totales_por_coche as select coche.codcoche, coche.marca, coche.preciodia * reserva.dias as Importe_Total, reserva.fechareserva
from coche, reserva
where coche.codcoche = reserva.codcoche;

--2
select coche.marca, sum(coche.preciodia * reserva.dias) as Recaudacion
from coche, reserva
where coche.codcoche = reserva.codcoche
and coche.marca = "Ferrari";

--3
select cliente.nombre, coche.marca, reserva.fechareserva, coche.preciodia * reserva.dias as total_pagado
from cliente, coche, reserva
where cliente.codcliente = reserva.codcliente and coche.codcoche = reserva.codcoche
order by coche.marca;

--4
select nombre 
from cliente
where timestampdiff(year, fechalta, now()) > 3;

--5
select coche.marca
from coche
left join reserva on reserva.codcoche = coche.codcoche
where reserva.codcoche is null;

--6
select coche.marca
from coche, reserva
where coche.codcoche = reserva.codcoche
group by coche.marca
order by count(reserva.codcoche) desc
limit 1;

--7
select distinct cliente.nombre, count(reserva.codcoche) as 'numero_de_coches'
from cliente, coche, reserva
where cliente.codcliente = reserva.codcliente and coche.codcoche = reserva.codcoche
group by cliente.nombre;

--8
/*Muestra los coches junto al nombre del cliente que ha reservado más veces ese vehículo. 
select distinct coche.marca, cliente.nombre,
from coche, cliente, reserva
where coche.codcoche = reserva.codcoche and cliente.codcliente = reserva.codcliente
group by coche.marca, cliente.nombre; */

--9
select cliente.nombre
from cliente
left join reserva on reserva.codcliente = cliente.codcliente
where reserva.codcliente is null;

--10
select distinct coche.marca, count(reserva.dias)
from coche, reserva
where coche.codcoche = reserva.codcoche
group by coche.marca;

--11
create view vista1 as select distinct coche.marca as marca, reserva.fechareserva as fechareserva, count(reserva.fechareserva) as num_reservas
from reserva, coche
where reserva.codcoche = coche.codcoche
group by reserva.fechareserva, coche.codcoche 
order by count(reserva.fechareserva) desc;
select marca 
from vista1
where num_reservas = (select max(num_reservas) from vista1);



--12
select cliente.nombre, cliente.credito, sum(cliente.credito - (coche.preciodia * reserva.dias)) as importe_total_gastado
from cliente, coche, reserva
where cliente.codcliente = reserva.codcliente and coche.codcoche = reserva.codcoche
group by cliente.nombre, cliente.credito;

--13
select distinct cliente.nombre
from cliente, reserva
where cliente.codcliente = reserva.codcliente
group by cliente.nombre
order by count(reserva.codcoche) desc
limit 1;

--14
select datediff(max(fechalta), min(fechalta)) as diferencia_dias
from cliente;


--15
select cliente.nombre, fechalta 
from cliente 
where month(fechalta) = 5 
and year(fechalta) = 2019;