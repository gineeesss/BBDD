alter table DetallePedidos add iva integer(2.2) default 18;

START TRANSACTION;
   update DetallePedidos set iva=18 where CodigoPedido in(select CodigoPedido from Pedidos where FechaPedido>='2010-07-01');
   update DetallePedidos set iva=16 where CodigoPedido in(select CodigoPedido from Pedidos where FechaPedido<'2010-07-01');
COMMIT WORK;

START TRANSACTION;
<<<<<<< HEAD
    alter table DetallePedidos add TotalLinea float;
=======
    alter table DetallePedidos add TotalLinea decimal(8,2);
>>>>>>> ba56a12b1f968571ce7084cf4c10e8c15ad7a1a1
    update DetellePedidos set TotalLinea=((precioUnidad*Cantidad*iva)/100);
COMMIT WORK;

delete from Clientes where CodigoCliente=
(select CodigoCliente from Pagos where LimiteCredito=
(select min(LimiteCredito) from Clientes) Limit 1);
<<<<<<< HEAD
=======


CREATE TABLE Clientes2 LIKE Clientes; 
insert into Clientes2
select * from Clientes;
>>>>>>> ba56a12b1f968571ce7084cf4c10e8c15ad7a1a1
