-- Crear base de datos
CREATE DATABASE ventas_empresa;
\c ventas_empresa;  -- Conectar a la base de datos ventas_empresa

-- Tabla clientes
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    ciudad VARCHAR(50)
);

-- Tabla categorias_productos
CREATE TABLE categorias_productos (
    categoria_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla productos
CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC(10, 2) NOT NULL CHECK (precio > 0),
    categoria_id INT REFERENCES categorias_productos(categoria_id)
);

-- Tabla pedidos (relación muchos a muchos entre clientes y productos)
CREATE TABLE pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    producto_id INT REFERENCES productos(producto_id),
    cantidad INT CHECK (cantidad > 0),
    fecha_pedido DATE DEFAULT CURRENT_DATE
);

-- Insertar datos en la tabla clientes
INSERT INTO clientes (nombre, apellido, ciudad) VALUES 
    ('Laura', 'Gonzalez', 'Madrid'),
    ('Diego', 'Martinez', 'Barcelona'),
    ('Sara', 'Lopez', 'Valencia');

-- Insertar datos en la tabla categorias_productos
INSERT INTO categorias_productos (nombre) VALUES 
    ('Electrónica'),
    ('Ropa'),
    ('Hogar');

-- Insertar datos en la tabla productos
INSERT INTO productos (nombre, precio, categoria_id) VALUES 
    ('Televisor', 500.00, 1),
    ('Camisa', 30.00, 2),
    ('Silla', 80.00, 3);

-- Insertar datos en la tabla pedidos
INSERT INTO pedidos (cliente_id, producto_id, cantidad) VALUES 
    (1, 1, 2),
    (2, 2, 1),
    (3, 3, 5);

-- EJEMPLOS DE OPERACIONES ENTRE TABLAS

-- 1. Unión: Lista combinada de todos los clientes y nombres de productos
SELECT cliente_id AS id, nombre, 'Cliente' AS tipo FROM clientes
UNION
SELECT producto_id AS id, nombre, 'Producto' AS tipo FROM productos;

-- 2. Intersección: Clientes que han comprado tanto 'Televisor' como 'Camisa'
SELECT c.nombre, c.apellido
FROM clientes c
JOIN pedidos p1 ON c.cliente_id = p1.cliente_id
JOIN productos prod1 ON p1.producto_id = prod1.producto_id AND prod1.nombre = 'Televisor'
JOIN pedidos p2 ON c.cliente_id = p2.cliente_id
JOIN productos prod2 ON p2.producto_id = prod2.producto_id AND prod2.nombre = 'Camisa';

-- 3. Diferencia: Clientes que NO han comprado 'Silla'
SELECT nombre, apellido 
FROM clientes
WHERE cliente_id NOT IN (
    SELECT cliente_id
    FROM pedidos p
    JOIN productos prod ON p.producto_id = prod.producto_id
    WHERE prod.nombre = 'Silla'
);

-- 4. Producto Cartesiano: Combinación de todos los clientes y productos para posibles compras
SELECT c.nombre AS cliente, p.nombre AS producto
FROM clientes c, productos p;

-- TIPOS DE RELACIONES

-- Relación Uno a Uno: Tabla `contactos` con información de contacto única para cada cliente
CREATE TABLE contactos (
    contacto_id SERIAL PRIMARY KEY,
    cliente_id INT UNIQUE REFERENCES clientes(cliente_id),
    telefono VARCHAR(15),
    email VARCHAR(50)
);

-- Insertar datos en la tabla contactos
INSERT INTO contactos (cliente_id, telefono, email) VALUES 
    (1, '123456789', 'laura.gonzalez@example.com'),
    (2, '987654321', 'diego.martinez@example.com');

-- Relación Uno a Varios: Productos en una misma categoría
SELECT p.nombre AS producto, c.nombre AS categoria
FROM productos p
JOIN categorias_productos c ON p.categoria_id = c.categoria_id;

-- Relación Muchos a Muchos: Clientes y productos comprados
SELECT c.nombre AS cliente, p.nombre AS producto, pd.cantidad
FROM clientes c
JOIN pedidos pd ON c.cliente_id = pd.cliente_id
JOIN productos p ON pd.producto_id = p.producto_id;

-- Relación Indeterminada: Clientes sin pedidos registrados
SELECT c.nombre AS cliente, p.nombre AS producto
FROM clientes c
LEFT JOIN pedidos pd ON c.cliente_id = pd.cliente_id
LEFT JOIN productos p ON pd.producto_id = p.producto_id
WHERE pd.pedido_id IS NULL;
