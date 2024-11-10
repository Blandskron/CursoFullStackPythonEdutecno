BEGIN;  -- Inicia la transacción

INSERT INTO clientes (nombre, apellido, correo) VALUES ('Juan', 'Pérez', 'juan.perez@example.com');

INSERT INTO pedidos (cliente_id, fecha, total) 
VALUES ((SELECT cliente_id FROM clientes WHERE correo = 'juan.perez@example.com'), CURRENT_DATE, 100.00);

COMMIT;  -- Confirma los cambios
