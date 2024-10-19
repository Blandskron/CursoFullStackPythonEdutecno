-- ================================================
-- NORMALIZACIÓN
-- ================================================
-- Proceso de normalización aplicado a la estructura de las tablas.

-- Creamos una tabla Proveedores asegurando que los datos sean atómicos (1NF)
CREATE TABLE Proveedores (
    proveedor_id INT PRIMARY KEY,        -- Llave primaria
    nombre VARCHAR(100) NOT NULL,        -- Nombre del proveedor
    telefono VARCHAR(15) NOT NULL        -- Número de teléfono
);

-- La tabla Productos mantiene la dependencia completa con las llaves primarias (2NF)
CREATE TABLE Productos (
    producto_id INT PRIMARY KEY,         -- Llave primaria
    proveedor_id INT,                    -- Llave foránea para Proveedores
    nombre VARCHAR(100) NOT NULL,        -- Nombre del producto
    precio DECIMAL(10, 2) NOT NULL,      -- Precio del producto
    stock INT NOT NULL,                  -- Cantidad en inventario
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(proveedor_id)
);

-- Aseguramos que cada tabla esté libre de dependencias transitivas (3NF)
CREATE TABLE Categorias (
    categoria_id INT PRIMARY KEY,        -- Llave primaria
    nombre VARCHAR(100) NOT NULL         -- Nombre de la categoría
);

-- Ejemplo de inserciones de datos normalizados
INSERT INTO Proveedores (proveedor_id, nombre, telefono) 
VALUES (1, 'Proveedor A', '123456789');

INSERT INTO Productos (producto_id, proveedor_id, nombre, precio, stock)
VALUES (1, 1, 'Teclado', 45.00, 100);

INSERT INTO Categorias (categoria_id, nombre)
VALUES (1, 'Electrónica');
