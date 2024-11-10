BEGIN;

INSERT INTO clientes (nombre, apellido, correo) VALUES ('Ana', 'García', 'ana.garcia@example.com');
SAVEPOINT sp_cliente;  -- Punto de retorno

INSERT INTO pedidos (cliente_id, fecha, total)
VALUES ((SELECT cliente_id FROM clientes WHERE correo = 'ana.garcia@example.com'), CURRENT_DATE, 200.00);

ROLLBACK TO sp_cliente;  -- Revertir solo hasta el punto guardado, si es necesario

COMMIT;
