-- Archivo: ecommerce_funcion_pedido.sql
-- Base de datos: Ecommerce

-- Crear base de datos
CREATE DATABASE ecommerce;
\c ecommerce;  -- Conectar a la base de datos ecommerce

-- Tabla usuarios
CREATE TABLE usuarios (
    usuario_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    correo VARCHAR(50) UNIQUE,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla productos
CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC(10, 2) NOT NULL CHECK (precio > 0),
    stock INT CHECK (stock >= 0) DEFAULT 0
);

-- Tabla pedidos
CREATE TABLE pedidos (
    pedido_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuarios(usuario_id),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total NUMERIC(12, 2) DEFAULT 0
);

-- Tabla detalles_pedido
CREATE TABLE detalles_pedido (
    detalle_id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedidos(pedido_id) ON DELETE CASCADE,
    producto_id INT REFERENCES productos(producto_id),
    cantidad INT CHECK (cantidad > 0),
    subtotal NUMERIC(10, 2)
);

-- Insertar datos iniciales
INSERT INTO usuarios (nombre, correo) VALUES 
    ('Juan Perez', 'juan@example.com'),
    ('Maria Lopez', 'maria@example.com');

INSERT INTO productos (nombre, precio, stock) VALUES 
    ('Laptop', 1200.00, 10),
    ('Smartphone', 700.00, 25);

-- FUNCION ALMACENADA PARA REALIZAR PEDIDO

CREATE OR REPLACE FUNCTION realizar_pedido(usuario INT, producto INT, cantidad INT) RETURNS VOID AS $$
DECLARE
    stock_actual INT;
    nuevo_pedido_id INT;
BEGIN
    -- Comprobar el stock del producto
    SELECT stock INTO stock_actual FROM productos WHERE producto_id = producto;

    IF stock_actual >= cantidad THEN
        -- Iniciar la transacción
        BEGIN
            -- Insertar el pedido
            INSERT INTO pedidos (usuario_id, total) VALUES (usuario, 0) RETURNING pedido_id INTO nuevo_pedido_id;

            -- Insertar el detalle del pedido
            INSERT INTO detalles_pedido (pedido_id, producto_id, cantidad, subtotal)
            VALUES (nuevo_pedido_id, producto, cantidad, (SELECT precio FROM productos WHERE producto_id = producto) * cantidad);

            -- Actualizar el stock del producto
            UPDATE productos SET stock = stock - cantidad WHERE producto_id = producto;

            -- Actualizar el total del pedido
            UPDATE pedidos SET total = (SELECT SUM(subtotal) FROM detalles_pedido WHERE pedido_id = nuevo_pedido_id)
            WHERE pedido_id = nuevo_pedido_id;

            -- Confirmar la transacción
            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE NOTICE 'Error en la transacción. No se pudo completar el pedido.';
        END;
    ELSE
        RAISE NOTICE 'Stock insuficiente para completar el pedido.';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Ejemplo de uso de la función para realizar un pedido
SELECT realizar_pedido(1, 1, 2);

-- CONTROL DE ACCESO CON DCL

-- Crear rol para administrador con permisos completos
CREATE ROLE administrador;

-- Otorgar permisos completos en todas las tablas
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO administrador;

-- Crear rol para cliente con permisos limitados
CREATE ROLE cliente;

-- Otorgar permisos solo de lectura para productos y pedidos
GRANT SELECT ON productos, pedidos TO cliente;

-- Revocar permisos de modificación para clientes
REVOKE INSERT, UPDATE, DELETE ON productos, pedidos FROM cliente;

-- TCL (LENGUAJE DE CONTROL TRANSACCIONAL)

-- Transacción para realizar un reembolso de un pedido
BEGIN;

-- Revertir el stock del producto
UPDATE productos SET stock = stock + 1 
WHERE producto_id = (SELECT producto_id FROM detalles_pedido WHERE pedido_id = 1 LIMIT 1);

-- Eliminar el detalle del pedido y actualizar el total
DELETE FROM detalles_pedido WHERE pedido_id = 1;

-- Actualizar el total del pedido tras el reembolso
UPDATE pedidos SET total = (SELECT SUM(subtotal) FROM detalles_pedido WHERE pedido_id = 1) WHERE pedido_id = 1;

COMMIT;

-- CONSULTAS ADICIONALES

-- Consultar total de ventas
SELECT SUM(total) AS total_ventas FROM pedidos;

-- Consultar los productos con bajo stock
SELECT nombre, stock FROM productos WHERE stock < 5;

-- Consultar pedidos y detalles del usuario
SELECT u.nombre, p.pedido_id, d.producto_id, d.cantidad, d.subtotal
FROM usuarios u
JOIN pedidos p ON u.usuario_id = p.usuario_id
JOIN detalles_pedido d ON p.pedido_id = d.pedido_id
WHERE u.nombre = 'Juan Perez';

-- Fin del archivo SQL para ecommerce
