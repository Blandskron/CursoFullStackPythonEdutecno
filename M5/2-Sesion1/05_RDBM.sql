-- Ejemplo 1: Creación de una base de datos para un gimnasio usando un sistema RDBMS.
CREATE DATABASE GimnasioDB;
USE GimnasioDB;

CREATE TABLE Miembros (
    miembro_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_inscripcion DATE
);

CREATE TABLE Clases (
    clase_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    duracion INT  -- Duración en minutos
);

CREATE TABLE Participaciones (
    participacion_id INT PRIMARY KEY,
    miembro_id INT,
    clase_id INT,
    fecha DATE,
    FOREIGN KEY (miembro_id) REFERENCES Miembros(miembro_id),
    FOREIGN KEY (clase_id) REFERENCES Clases(clase_id)
);

-- Ejemplo 2: Creación de una base de datos para una agencia de modelos usando un sistema RDBMS.
CREATE DATABASE AgenciaModelosDB;
USE AgenciaModelosDB;

CREATE TABLE Modelos (
    modelo_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    altura DECIMAL(5, 2)  -- Altura en metros
);

CREATE TABLE Proyectos (
    proyecto_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_inicio DATE
);

CREATE TABLE Asignaciones (
    asignacion_id INT PRIMARY KEY,
    modelo_id INT,
    proyecto_id INT,
    FOREIGN KEY (modelo_id) REFERENCES Modelos(modelo_id),
    FOREIGN KEY (proyecto_id) REFERENCES Proyectos(proyecto_id)
);
