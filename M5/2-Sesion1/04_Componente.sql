-- Ejemplo 1: Creación de componentes para una base de datos de una clínica dental.
CREATE TABLE Dentistas (
    dentista_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    especialidad VARCHAR(100)
);

CREATE TABLE Pacientes (
    paciente_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE Citas (
    cita_id INT PRIMARY KEY,
    paciente_id INT,
    dentista_id INT,
    fecha DATE,
    hora TIME,
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(paciente_id),
    FOREIGN KEY (dentista_id) REFERENCES Dentistas(dentista_id)
);

-- Ejemplo 2: Creación de componentes para una base de datos de una escuela de música.
CREATE TABLE Profesores (
    profesor_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    instrumento VARCHAR(50)
);

CREATE TABLE Estudiantes (
    estudiante_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    instrumento VARCHAR(50)
);

CREATE TABLE Clases (
    clase_id INT PRIMARY KEY,
    profesor_id INT,
    estudiante_id INT,
    fecha DATE,
    FOREIGN KEY (profesor_id) REFERENCES Profesores(profesor_id),
    FOREIGN KEY (estudiante_id) REFERENCES Estudiantes(estudiante_id)
);
