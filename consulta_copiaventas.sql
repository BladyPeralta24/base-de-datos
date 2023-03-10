-- examen de base de datos consulta de ventas


/* 1. Realiza una consulta que muestre la cantidad total de porductos que ha comprado
cada cliente */
select v.dnicliente, c.nombre, sum(v.cantidad) 
from venta v, cliente c 
where c.dni = v.dnicliente  
group by dnicliente;

/* 2. Muestra la nacionalidad que ha comprado mayor número de productos de tipo
Menaje durante los dias 1 y 5 incluidos */
select cliente.pais, sum(venta.cantidad) as cantidad_max 
from venta, producto, cliente 
where venta.dnicliente = cliente.dni 
and venta.codigoproducto = producto.codigo
and producto.tipo = "Menaje" 
and day(venta.fechaventa) between 1 and 5 
group by cliente.pais
order by sum(venta.cantidad) desc
limit 1;

/* 3. Realiza una vista que muestre el nombre del cliente, el producto que compró,
 la fecha de compra de cada producto y el subtotal (resultado de multiplicar 
 la cantidad comprada de ese mismo articulo por su precio unitario). Se debe mostrar
 los datos organizados por nombre de cliente, fecha de venta y nombre de producto. */
create view subtotal_compra as select cliente.nombre as nombre_cliente, venta.fechaventa as fecha_de_venta, producto.nombre as nombre_producto, venta.cantidad * producto.precio as subtotal
from cliente, venta, producto 
where cliente.dni = venta.dnicliente 
and producto.codigo = venta.codigoproducto
order by cliente.nombre, venta.fechaventa, producto.nombre;

/* 4. A partir de la vista anterior con los subtotales calculados, obtener
 el importe total aplicando un IGIC al 6% para los articulos comprados 
 por un cliente en una misma fecha*/
select nombre_cliente, fecha_de_venta, round(sum(subtotal)) * 1.06 as importe_total 
from subtotal_compra
GROUP BY nombre_cliente, fecha_de_venta;

/* 5. Realiza una consulta que muestre el importe total de las compras
 de productos de Tipo 'Menaje' para cada uno de los clientes junto con el nombre
 de dicho cliente, incluyendo aquellos que no han comprado productos de ese tipo.*/

-- crear una vista 

select cliente.dni, cliente.nombre, producto.codigo, producto.nombre, producto.tipo, round(venta.cantidad * producto.precio, 2) as importe_total
from cliente
left join venta on cliente.dni = venta.dnicliente
left join producto on producto.codigo = venta.codigoproducto 
where tipo = 'Menaje';

/* 6. Mostrar el nombre del cliente o clientes que hayan comprado el producto más
 caro de todos. Mostrar en otra columna el nombre de ese producto.*/
select cliente.nombre, producto.nombre 
from cliente, producto, venta 
where cliente.dni = venta.dnicliente 
and producto.codigo = venta.codigoproducto 
and producto.precio = (select max(precio) from producto, venta where producto.codigo = venta.codigoproducto)
group by cliente.nombre, producto.nombre;

/* 7. Realizar una vista llamada 'Totales por Producto' con los siguientes datos:
Codigo del producto, nombre del producto, importe total de las ventas del
producto y fecha de la ultima venta del producto */

create view totales_por_producto as select producto.codigo, producto.nombre, sum(venta.cantidad * producto.precio) as importe_total, max(venta.fechaventa)
from venta, producto
where venta.codigoproducto = producto.codigo
GROUP BY producto.codigo, producto.nombre;

/* 8. Muestra los nombres de los productos que no han sido vendidos a ningun cliente */
select producto.codigo, producto.nombre 
from producto
left join venta on venta.codigoproducto = producto.codigo
where venta.codigoproducto is null;

/* 9. Muestra los nombres de los clientes que no han comprado producto alguno */
select cliente.dni, cliente.nombre 
from cliente
left join venta on venta.dnicliente = cliente.dni
where venta.dnicliente is null;

/* 10. Muestra los distintos tipos de productos junto al nombre del cliente
 que ha comprado mas unidades de ese tipo de producto.*/

select distinct producto.tipo, sum(venta.cantidad) as total_compra, cliente.nombre
from cliente, venta, producto
where cliente.dni = venta.dnicliente
and producto.codigo = venta.codigoproducto
group by producto.tipo, cliente.nombre
having sum(venta.cantidad) = (select max(total_compra_tipo) 
from (select producto.tipo, cliente.nombre, sum(venta.cantidad) as total_compra_tipo
from cliente, venta, producto
where cliente.dni = venta.dnicliente
and producto.codigo = venta.codigoproducto
group by producto.tipo, cliente.nombre) as t where t.tipo = producto.tipo);


/* Calcular para cada cliente el tiempo que lleva registrado en el sistema en años
y dias. La consulta resultante mostrará tres columnas: nombre del cliente,
numero de años y numero de dias. Obviamente el valor obtenido para la columna
numero de dias nunca podra ser mayor o igual a 365 dias */
select cliente.nombre, truncate(datediff(sysdate(), fechaalta)/365,0) as anhos, mod(datediff(sysdate(), fechaalta), 365) as dias
from cliente;

