-- Crear un esquema para gestionar una base de datos de una tienda en línea
CREATE SCHEMA tienda_online;

-- Crear una tabla de clientes con diferentes tipos de datos y configurar la clave primaria
CREATE TABLE tienda_online.clientes (
    cliente_id SERIAL PRIMARY KEY, -- Identificador único y automático para cada cliente
    nombre VARCHAR(100) NOT NULL, -- Nombre del cliente con un máximo de 100 caracteres
    correo VARCHAR(100) UNIQUE NOT NULL, -- Correo único para cada cliente
    telefono CHAR(10), -- Teléfono con longitud fija de 10 caracteres
    direccion TEXT -- Dirección del cliente
);

-- Crear una tabla de productos con información detallada
CREATE TABLE tienda_online.productos (
    producto_id SERIAL PRIMARY KEY, -- Identificador único y automático para cada producto
    nombre VARCHAR(100) NOT NULL, -- Nombre del producto
    descripcion TEXT, -- Descripción detallada del producto
    precio NUMERIC(10, 2) NOT NULL CHECK (precio > 0), -- Precio del producto con restricción para valores positivos
    stock INT NOT NULL CHECK (stock >= 0) -- Cantidad de stock, asegurando no ser negativa
);

-- Crear una tabla de pedidos que vincula clientes y productos, incluye cantidad comprada
CREATE TABLE tienda_online.pedidos (
    pedido_id SERIAL PRIMARY KEY, -- Identificador único para cada pedido
    cliente_id INT NOT NULL, -- Clave foránea referenciando al cliente
    fecha_pedido DATE NOT NULL DEFAULT CURRENT_DATE, -- Fecha del pedido con valor por defecto del día actual
    FOREIGN KEY (cliente_id) REFERENCES tienda_online.clientes (cliente_id) -- Relación con tabla clientes
);

-- Crear una tabla de detalles de pedidos para manejar productos por pedido
CREATE TABLE tienda_online.detalles_pedido (
    detalle_id SERIAL PRIMARY KEY, -- Identificador único para cada detalle
    pedido_id INT NOT NULL, -- Clave foránea para referenciar al pedido
    producto_id INT NOT NULL, -- Clave foránea para referenciar al producto
    cantidad INT NOT NULL CHECK (cantidad > 0), -- Cantidad de producto asegurando números positivos
    FOREIGN KEY (pedido_id) REFERENCES tienda_online.pedidos (pedido_id), -- Relaciones foráneas a tablas
    FOREIGN KEY (producto_id) REFERENCES tienda_online.productos (producto_id)
);

-- Insertar algunos clientes en la tabla de clientes
INSERT INTO tienda_online.clientes (nombre, correo, telefono, direccion) VALUES
('Luis Mendoza', 'luis@gmail.com', '1234567890', '123 Calle Falsa'),
('Ana Torres', 'ana@gmail.com', '0987654321', '456 Avenida Siempre Viva');

-- Insertar productos en la tabla de productos
INSERT INTO tienda_online.productos (nombre, descripcion, precio, stock) VALUES
('Portátil', 'Laptop de última generación con 16GB RAM', 1200.00, 10),
('Teclado', 'Teclado mecánico retroiluminado', 85.00, 50);

-- Registrar un pedido y detalles, vinculando clientes y productos
INSERT INTO tienda_online.pedidos (cliente_id) VALUES
(1);

INSERT INTO tienda_online.detalles_pedido (pedido_id, producto_id, cantidad) VALUES
(1, 1, 1), -- Pedido de 1 portátil
(1, 2, 2); -- Pedido de 2 teclados

-- Consultar los detalles de los pedidos de un cliente específico por nombre
SELECT c.nombre AS Cliente, p.pedido_id AS Pedido, pr.nombre AS Producto, d.cantidad AS Cantidad
FROM tienda_online.detalles_pedido d
JOIN tienda_online.pedidos p ON d.pedido_id = p.pedido_id
JOIN tienda_online.clientes c ON p.cliente_id = c.cliente_id
JOIN tienda_online.productos pr ON d.producto_id = pr.producto_id
WHERE c.nombre = 'Luis Mendoza';

-- Actualizar el stock de un producto después de un pedido
UPDATE tienda_online.productos SET stock = stock - 1 WHERE producto_id = 1; -- Restar la cantidad comprada de portátil

-- Borrar un cliente, lo cual eliminará en cascada sus pedidos si configurado (requiere ON DELETE CASCADE)
DELETE FROM tienda_online.clientes WHERE cliente_id = 2;

-- Crear un índice para acelerar búsquedas en la tabla de productos
CREATE INDEX idx_producto_nombre ON tienda_online.productos (nombre);

-- Crear un usuario con permisos específicos
CREATE USER marketing WITH PASSWORD 'SecurePass2023';

-- Conceder permisos específicos al usuario para leer datos de productos
GRANT SELECT ON tienda_online.productos TO marketing;
GRANT SELECT ON tienda_online.clientes TO marketing;

-- Crear un rol para la gestión de pedidos
CREATE ROLE gestion_pedidos;

-- Conceder todos los privilegios en el esquema tienda_online al rol de gestión
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA tienda_online TO gestion_pedidos;

-- Transacción para asegurar consistencia al actualizar múltiples tablas
BEGIN;
UPDATE tienda_online.productos SET stock = stock - (SELECT cantidad FROM tienda_online.detalles_pedido WHERE producto_id = 1 AND pedido_id = 1) WHERE producto_id = 1;
INSERT INTO tienda_online.detalles_pedido (pedido_id, producto_id, cantidad) VALUES (1, 1, 1);
COMMIT;

-- Eliminar esquema junto con todas las tablas del esquema
DROP SCHEMA IF EXISTS tienda_online CASCADE;
