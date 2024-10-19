-- Ejemplo 1: Modelo relacional para una aplicación de reserva de vuelos.
CREATE TABLE Vuelos (
    vuelo_id INT PRIMARY KEY,
    destino VARCHAR(100) NOT NULL,
    fecha_salida DATE
);

CREATE TABLE Pasajeros (
    pasajero_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pasaporte VARCHAR(20) UNIQUE
);

-- Relación entre vuelos y pasajeros
CREATE TABLE Reservas (
    reserva_id INT PRIMARY KEY,
    vuelo_id INT,
    pasajero_id INT,
    fecha_reserva DATE,
    FOREIGN KEY (vuelo_id) REFERENCES Vuelos(vuelo_id),
    FOREIGN KEY (pasajero_id) REFERENCES Pasajeros(pasajero_id)
);

-- Ejemplo 2: Modelo relacional para una plataforma de cursos en línea.
CREATE TABLE Cursos (
    curso_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    duracion INT  -- Duración en semanas
);

CREATE TABLE Estudiantes (
    estudiante_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

-- Relación entre cursos y estudiantes
CREATE TABLE Inscripciones (
    inscripcion_id INT PRIMARY KEY,
    curso_id INT,
    estudiante_id INT,
    fecha_inscripcion DATE,
    FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id),
    FOREIGN KEY (estudiante_id) REFERENCES Estudiantes(estudiante_id)
);
