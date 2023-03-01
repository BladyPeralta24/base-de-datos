select cliente.nombre, sum(venta.cantidad) from cliente, venta where cliente.dni = venta.dnicliente group by cliente.nombre;


select cliente.nombre, sum(venta.cantidad) from cliente
left join venta on cliente.dni = venta.dnicliente
group by cliente.nombre;

select cliente.nombre, sum(venta.cantidad) from cliente left join venta on cliente.dni = venta.dnicliente group by cliente.nombre;

select cliente.pais, sum(venta.cantidad) from cliente, producto, venta
where cliente.dni = venta.dnicliente and producto.codigo = venta.codigoproducto
and tipo = 'Menaje'
and DAY(fechaventa) in (1,2,3,4,5)
group by cliente.pais
order by sum(venta.cantidad) desc;
