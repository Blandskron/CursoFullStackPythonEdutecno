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

-- TRANSACCIÓN PARA REALIZAR PEDIDO

BEGIN;

-- Comprobar que hay suficiente stock del producto antes de continuar
-- Si no hay suficiente stock, revertir la transacción
UPDATE productos
SET stock = stock - 2
WHERE producto_id = 1 AND stock >= 2;

-- Verificar si el producto tiene suficiente stock
-- Si no hay suficiente stock, revertir la transacción
SELECT stock FROM productos WHERE producto_id = 1 AND stock >= 0;

-- Insertar el pedido
INSERT INTO pedidos (usuario_id, total)
VALUES (1, 0);

-- Obtener el ID del pedido recién creado
WITH pedido_actual AS (
    SELECT MAX(pedido_id) AS pedido_id
    FROM pedidos
)
INSERT INTO detalles_pedido (pedido_id, producto_id, cantidad, subtotal)
SELECT pedido_actual.pedido_id, producto_id, cantidad, (SELECT precio * cantidad)
FROM detalles_pedido;

COMMIT;
