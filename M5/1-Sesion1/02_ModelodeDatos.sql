-- Ejemplo 1: Modelo relacional para una biblioteca con libros y autores.
CREATE TABLE Libros (
    libro_id INT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    fecha_publicacion DATE
);

CREATE TABLE Autores (
    autor_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Relación entre libros y autores
CREATE TABLE Libro_Autor (
    libro_id INT,
    autor_id INT,
    PRIMARY KEY (libro_id, autor_id),
    FOREIGN KEY (libro_id) REFERENCES Libros(libro_id),
    FOREIGN KEY (autor_id) REFERENCES Autores(autor_id)
);

-- Ejemplo 2: Modelo relacional para un hospital con pacientes y doctores.
CREATE TABLE Pacientes (
    paciente_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE
);

CREATE TABLE Doctores (
    doctor_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100)
);

-- Relación entre doctores y pacientes
CREATE TABLE Doctor_Paciente (
    doctor_id INT,
    paciente_id INT,
    PRIMARY KEY (doctor_id, paciente_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctores(doctor_id),
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(paciente_id)
);
