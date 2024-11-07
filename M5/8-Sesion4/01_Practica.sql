-- EXERCISE 1: CREANDO SENTENCIAS DDL
-- Creación de la tabla "Productos" con restricciones y valores por defecto

CREATE TABLE Productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) CHECK (precio > 0) DEFAULT 10.00,  -- Precio positivo, valor por defecto de 10.00
    stock INT CHECK (stock >= 0) DEFAULT 0,                   -- Stock no negativo, valor por defecto de 0
    categoria VARCHAR(50) NOT NULL
);

-- Agregar una nueva columna "fecha_creacion" a la tabla
ALTER TABLE Productos
ADD COLUMN fecha_creacion DATE DEFAULT CURRENT_DATE;

-- Cambiar el nombre de la tabla "Productos" a "InventarioProductos"
ALTER TABLE Productos RENAME TO InventarioProductos;

-- Renombrar la columna "categoria" a "tipo_producto"
ALTER TABLE InventarioProductos RENAME COLUMN categoria TO tipo_producto;

-- EXERCISE 2: PASANDO DE UN MODELO RACIONAL A UNO FÍSICO
-- Creación de tablas y establecimiento de relaciones de llave foránea

CREATE TABLE Proveedores (
    proveedor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(50),
    telefono VARCHAR(20)
);

CREATE TABLE Compras (
    compra_id SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    proveedor_id INT,
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores (proveedor_id)
);

CREATE TABLE DetalleCompras (
    detalle_id SERIAL PRIMARY KEY,
    compra_id INT,
    producto_id INT,
    cantidad INT CHECK (cantidad > 0),
    precio_unitario DECIMAL(10, 2) CHECK (precio_unitario > 0),
    FOREIGN KEY (compra_id) REFERENCES Compras (compra_id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES InventarioProductos (producto_id)
);

-- EXERCISE 3: CREANDO SENTENCIAS DML
-- Inserción de datos en la tabla "Proveedores"
INSERT INTO Proveedores (nombre, contacto, telefono)
VALUES 
    ('Proveedor 1', 'contacto1@empresa.com', '+123456789'),
    ('Proveedor 2', 'contacto2@empresa.com', '+987654321');

-- Inserción de productos en la tabla "InventarioProductos"
INSERT INTO InventarioProductos (nombre, precio, stock, tipo_producto)
VALUES 
    ('Producto A', 15.00, 100, 'Alimentos'),
    ('Producto B', 30.00, 50, 'Electrónica');

-- Inserción de compras en la tabla "Compras"
INSERT INTO Compras (fecha, proveedor_id)
VALUES 
    ('2023-01-15', 1),
    ('2023-02-20', 2);

-- Inserción de detalles de compra en la tabla "DetalleCompras"
INSERT INTO DetalleCompras (compra_id, producto_id, cantidad, precio_unitario)
VALUES 
    (1, 1, 10, 15.00),
    (1, 2, 5, 30.00),
    (2, 1, 20, 15.00);

-- Actualización del stock de un producto en "InventarioProductos"
UPDATE InventarioProductos
SET stock = stock + 30
WHERE producto_id = 1;

-- Eliminar un proveedor específico de la tabla "Proveedores"
DELETE FROM Proveedores
WHERE proveedor_id = 2;

-- Ejemplo de condicional CASE
SELECT nombre, precio,
    CASE 
        WHEN precio < 20 THEN 'Económico'
        WHEN precio BETWEEN 20 AND 50 THEN 'Moderado'
        ELSE 'Caro'
    END AS categoria_precio
FROM InventarioProductos;

-- Ejemplo de eliminar una columna de la tabla
ALTER TABLE InventarioProductos DROP COLUMN fecha_creacion;

-- Ejemplo de desactivar una restricción temporalmente
ALTER TABLE DetalleCompras DISABLE CONSTRAINT detallecompras_compra_id_fkey;

-- Re-activar la restricción
ALTER TABLE DetalleCompras ENABLE CONSTRAINT detallecompras_compra_id_fkey;

-- Eliminar la tabla InventarioProductos para finalizar
DROP TABLE IF EXISTS InventarioProductos CASCADE;
