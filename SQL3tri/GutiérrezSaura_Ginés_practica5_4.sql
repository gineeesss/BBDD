alter table DetallePedidos add iva integer(2.2) default 18;

START TRANSACTION;
   update DetallePedidos set iva=18 where CodigoPedido in(select CodigoPedido from Pedidos where FechaPedido>='2010-07-01');
   update DetallePedidos set iva=16 where CodigoPedido in(select CodigoPedido from Pedidos where FechaPedido<'2010-07-01');
COMMIT WORK;

START TRANSACTION;
    alter table DetallePedidos add TotalLinea float;
    update DetellePedidos set TotalLinea=((precioUnidad*Cantidad*iva)/100);
COMMIT WORK;

delete from Clientes where CodigoCliente=
(select CodigoCliente from Pagos where LimiteCredito=
(select min(LimiteCredito) from Clientes) Limit 1);
