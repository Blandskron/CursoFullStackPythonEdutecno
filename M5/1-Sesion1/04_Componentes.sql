-- Ejemplo 1: Creación de componentes de una base de datos para una tienda online.
CREATE TABLE Productos (
    producto_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2),
    stock INT
);

CREATE TABLE Categorias (
    categoria_id INT PRIMARY KEY,
    nombre VARCHAR(50)
);

-- Relación entre productos y categorías
CREATE TABLE Producto_Categoria (
    producto_id INT,
    categoria_id INT,
    PRIMARY KEY (producto_id, categoria_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id),
    FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)
);

-- Ejemplo 2: Creación de componentes de una base de datos para una agencia de viajes.
CREATE TABLE Viajes (
    viaje_id INT PRIMARY KEY,
    destino VARCHAR(100),
    precio DECIMAL(10, 2)
);

CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

-- Relación entre viajes y clientes
CREATE TABLE Reservaciones (
    reservacion_id INT PRIMARY KEY,
    viaje_id INT,
    cliente_id INT,
    fecha_reservacion DATE,
    FOREIGN KEY (viaje_id) REFERENCES Viajes(viaje_id),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);
