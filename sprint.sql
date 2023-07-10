CREATE DATABASE telovendo_sprint;
USE telovendo_sprint;

CREATE TABLE cliente(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apeliido VARCHAR(30) NOT NULL,
    edad INT NOT NULL,
    correo_electronico VARCHAR(50) NOT NULL,
    numero_accesos INT NOT NULL DEFAULT 1
);

CREATE TABLE operario(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apeliido VARCHAR(30) NOT NULL,
    edad INT NOT NULL,
    correo_electronico VARCHAR(50) NOT NULL,
    numero_soporte INT NOT NULL DEFAULT 1
);

CREATE TABLE registro_soporte(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_operario INT,
    id_cliente INT,
    fecha DATE NOT NULL,
    evaluacion INT NOT NULL,
    FOREIGN KEY(id_operario) REFERENCES operario(id),
    FOREIGN KEY(id_cliente) REFERENCES cliente(id)
);

INSERT INTO cliente 
VALUES
	(default, 'Martín', 'Gambóa', 35, 'martin.g@example.com', 5),
	(default,'María', 'Pereira', 58, 'maria.pereira@example.com',8),
	(default,'Catalina', 'Soto', 50, 'catalina.soto@example.com', 2),
	(default,'Paz', 'Pérez', 32, 'paz.p@example.com',9),
	(default,'Camilo', 'Martínez', 23, 'carlos.martinez@example.com', 4);

INSERT INTO operario 
VALUES
	(default, 'Rocio', 'Muñoz', 21, 'rocio.munoz@example.com', 3),
	(default, 'Henrique', 'Campos', 34, 'H.Campos@example.com', 7),
	(default, 'Andres', 'Santomé', 52, 'andres.santome@example.com',5),
	(default, 'Lucía', 'Tapia', 39, 'luta@example.com', 9),
	(default, 'Gonzalo', 'Vera', 19 , 'go.ta@example.com', 15);
    
INSERT INTO registro_soporte 
VALUES
	(default, 5, 2, '2023-01-12', 6),
    (default, 4, 4, '2023-02-11', 2),
    (default, 3, 4, '2022-03-13', 5),
    (default, 5, 1, "2023-04-17", 6),
	(default, 2, 4, "2023-05-11", 4),
	(default, 4, 5, "2023-06-22", 1),
	(default, 2, 3, "2022-07-25", 7),
    (default, 1, 3, "2023-08-19", 2),
	(default, 3, 5, "2021-09-15", 5),
	(default, 4, 1, "2023-10-21", 3);
    
SELECT * FROM registro_soporte
ORDER BY evaluacion DESC
LIMIT 3;

SELECT * FROM registro_soporte
ORDER BY evaluacion
LIMIT 3;

SELECT nombre AS nombre_operario, COUNT(*) AS cantidad_operaciones FROM registro_soporte
JOIN operario ON operario.id = registro_soporte.id_operario
GROUP BY id_operario
ORDER BY cantidad_operaciones DESC
LIMIT 1;

ALTER TABLE cliente
RENAME COLUMN correo_electronico TO email;

ALTER TABLE operario
RENAME COLUMN correo_electronico TO email;

SELECT * FROM operario
WHERE edad >= 20;

