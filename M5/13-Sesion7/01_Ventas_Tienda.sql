-- Crear base de datos
CREATE DATABASE ventas_tienda;
\c ventas_tienda;  -- Conectar a la base de datos ventas_tienda

-- Crear tabla clientes
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    ciudad VARCHAR(50)
);

-- Crear tabla productos
CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC(10, 2) NOT NULL CHECK (precio > 0),
    categoria VARCHAR(50)
);

-- Crear tabla pedidos
CREATE TABLE pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    fecha_pedido DATE DEFAULT CURRENT_DATE
);

-- Crear tabla detalles_pedido para registrar cada producto en un pedido
CREATE TABLE detalles_pedido (
    detalle_id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedidos(pedido_id) ON DELETE CASCADE,
    producto_id INT REFERENCES productos(producto_id),
    cantidad INT CHECK (cantidad > 0),
    precio_unitario NUMERIC(10, 2) NOT NULL CHECK (precio_unitario > 0)
);

-- Insertar datos en la tabla clientes
INSERT INTO clientes (nombre, email, ciudad) VALUES 
    ('Juan Pérez', 'juan.perez@example.com', 'Madrid'),
    ('Ana García', 'ana.garcia@example.com', 'Barcelona'),
    ('Luis Ramírez', 'luis.ramirez@example.com', 'Valencia');

-- Insertar datos en la tabla productos
INSERT INTO productos (nombre, precio, categoria) VALUES 
    ('Laptop', 800.00, 'Electrónica'),
    ('Smartphone', 500.00, 'Electrónica'),
    ('Mesa', 150.00, 'Muebles');

-- Insertar datos en la tabla pedidos
INSERT INTO pedidos (cliente_id, fecha_pedido) VALUES 
    (1, '2023-05-10'),
    (2, '2023-05-11'),
    (3, '2023-05-12');

-- Insertar datos en la tabla detalles_pedido
INSERT INTO detalles_pedido (pedido_id, producto_id, cantidad, precio_unitario) VALUES 
    (1, 1, 2, 800.00),   -- Juan compra 2 Laptops
    (1, 2, 1, 500.00),   -- Juan compra 1 Smartphone
    (2, 3, 1, 150.00),   -- Ana compra 1 Mesa
    (3, 2, 2, 500.00);   -- Luis compra 2 Smartphones

-- SUBCONSULTAS

-- 1. Subconsulta en la cláusula WHERE
-- Obtener el nombre y ciudad de los clientes que han realizado pedidos de más de $1000 en total
SELECT nombre, ciudad
FROM clientes
WHERE cliente_id IN (
    SELECT p.cliente_id
    FROM pedidos p
    JOIN detalles_pedido d ON p.pedido_id = d.pedido_id
    GROUP BY p.cliente_id
    HAVING SUM(d.cantidad * d.precio_unitario) > 1000
);

-- 2. Subconsulta en la cláusula FROM
-- Listar los productos y mostrar el total de cantidad vendida por cada uno
SELECT p.nombre AS producto, ventas_totales.total_cantidad
FROM productos p
JOIN (
    SELECT producto_id, SUM(cantidad) AS total_cantidad
    FROM detalles_pedido
    GROUP BY producto_id
) AS ventas_totales ON p.producto_id = ventas_totales.producto_id;

-- 3. Subconsulta en la cláusula SELECT
-- Obtener el nombre de cada cliente junto con el total gastado en sus pedidos
SELECT nombre,
       (SELECT SUM(d.cantidad * d.precio_unitario)
        FROM pedidos p
        JOIN detalles_pedido d ON p.pedido_id = d.pedido_id
        WHERE p.cliente_id = c.cliente_id) AS total_gastado
FROM clientes c;

-- CONSULTAS COMPLEJAS

-- 4. Consulta Compleja para obtener el producto más vendido
-- Paso 1: Calcular la cantidad total vendida por cada producto
WITH cantidades_vendidas AS (
    SELECT producto_id, SUM(cantidad) AS total_vendido
    FROM detalles_pedido
    GROUP BY producto_id
)
-- Paso 2: Seleccionar el producto con la mayor cantidad vendida
SELECT p.nombre AS producto, qv.total_vendido
FROM productos p
JOIN cantidades_vendidas qv ON p.producto_id = qv.producto_id
WHERE qv.total_vendido = (SELECT MAX(total_vendido) FROM cantidades_vendidas);

-- 5. Consulta Compleja para obtener los clientes que han comprado en múltiples categorías
-- Paso 1: Obtener todas las categorías que ha comprado cada cliente
WITH categorias_por_cliente AS (
    SELECT DISTINCT c.cliente_id, p.categoria
    FROM clientes c
    JOIN pedidos ped ON c.cliente_id = ped.cliente_id
    JOIN detalles_pedido dp ON ped.pedido_id = dp.pedido_id
    JOIN productos p ON dp.producto_id = p.producto_id
)
-- Paso 2: Seleccionar clientes que tienen más de una categoría en sus compras
SELECT c.nombre, c.email
FROM clientes c
JOIN categorias_por_cliente cat ON c.cliente_id = cat.cliente_id
GROUP BY c.cliente_id, c.nombre, c.email
HAVING COUNT(DISTINCT cat.categoria) > 1;

-- 6. Consulta Compleja para calcular el ingreso total de la tienda y el ingreso por categoría
-- Paso 1: Calcular el ingreso total de cada categoría
WITH ingreso_por_categoria AS (
    SELECT p.categoria, SUM(d.cantidad * d.precio_unitario) AS ingreso_categoria
    FROM productos p
    JOIN detalles_pedido d ON p.producto_id = d.producto_id
    GROUP BY p.categoria
)
-- Paso 2: Calcular el ingreso total sumando todas las categorías
SELECT categoria, ingreso_categoria,
       (SELECT SUM(ingreso_categoria) FROM ingreso_por_categoria) AS ingreso_total
FROM ingreso_por_categoria;
