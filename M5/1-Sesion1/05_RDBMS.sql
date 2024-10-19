-- Ejemplo 1: Creación de una base de datos para un restaurante usando un sistema RDBMS.
CREATE DATABASE RestauranteDB;
USE RestauranteDB;

CREATE TABLE Mesas (
    mesa_id INT PRIMARY KEY,
    numero_mesa INT,
    capacidad INT
);

CREATE TABLE Ordenes (
    orden_id INT PRIMARY KEY,
    mesa_id INT,
    fecha_orden DATE,
    FOREIGN KEY (mesa_id) REFERENCES Mesas(mesa_id)
);

-- Ejemplo 2: Creación de una base de datos para una clínica usando un sistema RDBMS.
CREATE DATABASE ClinicaDB;
USE ClinicaDB;

CREATE TABLE Doctores (
    doctor_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    especialidad VARCHAR(100)
);

CREATE TABLE Pacientes (
    paciente_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_nacimiento DATE
);

CREATE TABLE Consultas (
    consulta_id INT PRIMARY KEY,
    doctor_id INT,
    paciente_id INT,
    fecha_consulta DATE,
    FOREIGN KEY (doctor_id) REFERENCES Doctores(doctor_id),
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(paciente_id)
);
