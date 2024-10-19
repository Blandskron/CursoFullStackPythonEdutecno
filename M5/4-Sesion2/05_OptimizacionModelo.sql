-- ================================================
-- OPTIMIZACIÓN DEL MODELO
-- ================================================
-- Ejemplo de optimización de la base de datos utilizando índices y claves eficaces.

-- Crear índice para mejorar la búsqueda por nombre de cliente.
CREATE INDEX idx_nombre_clientes ON Clientes(nombre);

-- Crear un índice compuesto en la tabla DetallesPedidos para optimizar las consultas.
CREATE INDEX idx_pedido_producto ON DetallesFacturas(factura_id, producto_id);

-- Crear índice en la tabla Productos para mejorar las búsquedas por nombre.
CREATE INDEX idx_nombre_productos ON Productos(nombre);

-- Ejemplo de consulta optimizada usando el índice en nombre de cliente
SELECT cliente_id, nombre, direccion 
FROM Clientes 
WHERE nombre = 'Ana Gomez';

-- Ejemplo de consulta optimizada usando el índice compuesto en DetallesFacturas
SELECT * 
FROM DetallesFacturas 
WHERE factura_id = 1 AND producto_id = 1;
