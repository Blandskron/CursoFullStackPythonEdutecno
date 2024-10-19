-- ================================================
-- OPTIMIZACIÓN DEL MODELO
-- ================================================
-- Este archivo cubre la optimización del modelo de base de datos mediante índices.

-- Crear índices en columnas utilizadas frecuentemente para mejorar el rendimiento.
CREATE INDEX idx_email_clientes ON Clientes(email);

-- Crear un índice compuesto en DetallesPedidos para mejorar las consultas.
CREATE INDEX idx_pedido_producto ON DetallesPedidos(pedido_id, producto_id);

-- Ejemplo de consulta optimizada usando el índice en email
SELECT cliente_id, nombre, email 
FROM Clientes 
WHERE email = 'maria.santos@email.com';

-- Ejemplo de consulta optimizada usando el índice compuesto en DetallesPedidos
SELECT pedido_id, producto_id, cantidad, subtotal 
FROM DetallesPedidos 
WHERE pedido_id = 1 AND producto_id = 2;
