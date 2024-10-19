-- Ejemplo 1: Creación de tablas relacionadas para un sistema de gestión de eventos.
CREATE TABLE Eventos (
    evento_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha DATE
);

CREATE TABLE Participantes (
    participante_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Relación entre eventos y participantes
CREATE TABLE Evento_Participante (
    evento_id INT,
    participante_id INT,
    PRIMARY KEY (evento_id, participante_id),
    FOREIGN KEY (evento_id) REFERENCES Eventos(evento_id),
    FOREIGN KEY (participante_id) REFERENCES Participantes(participante_id)
);

-- Ejemplo 2: Creación de tablas relacionadas para un sistema de alquiler de autos.
CREATE TABLE Autos (
    auto_id INT PRIMARY KEY,
    modelo VARCHAR(100),
    precio_por_dia DECIMAL(10, 2)
);

CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    licencia_conducir VARCHAR(50) UNIQUE
);

-- Relación entre autos y clientes
CREATE TABLE Alquileres (
    alquiler_id INT PRIMARY KEY,
    auto_id INT,
    cliente_id INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (auto_id) REFERENCES Autos(auto_id),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);
