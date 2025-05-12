/*create database tienda*/

use tienda;
/*CREATE TABLE clientes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    direccion VARCHAR(100),
    correo_electronico VARCHAR(100) UNIQUE,
    telefono VARCHAR(20)
);*/
/*INSERT INTO clientes (nombre, apellido, direccion, correo_electronico, telefono) VALUES
('Ana', 'Pérez', 'Calle Falsa 123', 'ana.perez@email.com', '0412-1234567'),
('Luis', 'González', 'Avenida Principal 456', 'luis.gonzalez@email.com', '0212-9876543'),
('María', 'Rodríguez', 'Urb. El Bosque 789', 'maria.rodriguez@email.com', '0414-5555555'),
('Carlos', 'López', 'Res. La Colina 101', 'carlos.lopez@email.com', '0212-1112233'),
('Sofía', 'Martínez', 'Calle Las Flores 222', 'sofia.martinez@email.com', '0424-7778899');*/

/*CREATE TABLE productos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    categoria VARCHAR(50),
    stock INT
);*/

/*INSERT INTO productos (nombre, descripcion, precio, categoria, stock) VALUES
('Camiseta Básica Blanca', 'Camiseta de algodón manga corta', 15.99, 'Camisetas', 100),
('Pantalón Vaquero Recto', 'Pantalón denim corte recto', 39.99, 'Pantalones', 50),
('Vestido de Verano Floral', 'Vestido ligero con estampado de flores', 29.99, 'Vestidos', 75),
('Chaqueta de Cuero Sintético', 'Chaqueta moderna de piel sintética', 59.99, 'Chaquetas', 30),
('Zapatillas Deportivas', 'Zapatillas cómodas para correr', 45.50, 'Calzado', 60),
('Camiseta Estampada', 'Camiseta de algodón con diseño gráfico', 18.50, 'Camisetas', 80);*/

/*CREATE TABLE pedidos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_cliente INT NOT NULL,
    fecha DATE NOT NULL,
    estado VARCHAR(20),
    total DECIMAL(10, 2),
    FOREIGN KEY (ID_cliente) REFERENCES clientes(ID)
);


INSERT INTO pedidos (ID_cliente, fecha, estado, total) VALUES
(1, '2025-04-15', 'Entregado', 55.98),
(2, '2025-04-20', 'Enviado', 39.99),
(3, '2025-05-01', 'Entregado', 89.97),
(1, '2025-05-05', 'Pendiente', 15.99),
(4, '2024-12-20', 'Entregado', 119.98),
(2, '2025-05-10', 'Enviado', 75.49),
(5, '2025-03-25', 'Entregado', 29.99);*/

/*CREATE TABLE ventas (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_pedido INT NOT NULL,
    ID_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_venta DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_pedido) REFERENCES pedidos(ID),
    FOREIGN KEY (ID_producto) REFERENCES productos(ID)
);*/

/*INSERT INTO ventas (ID_pedido, ID_producto, cantidad, precio_venta) VALUES
(1, 1, 2, 15.99),
(1, 2, 1, 24.00),
(2, 2, 1, 39.99),
(3, 3, 3, 29.99),
(4, 1, 1, 15.99),
(5, 4, 2, 59.99),
(6, 2, 1, 39.99),
(6, 5, 1, 35.50),
(7, 3, 1, 29.99),
(1, 6, 1, 16.00);*/


/*Obtener el nombre completo, dirección y correo electrónico de todos los clientes
que han realizado pedidos en los últimos 30 días*/
/*SELECT
    CONCAT(c.nombre, ' ', c.apellido) AS nombre_completo,
    c.direccion,
    c.correo_electronico
FROM
    clientes c
JOIN
    pedidos p ON c.ID = p.ID_cliente
WHERE
    p.fecha >= DATE_SUB(CURDATE(), INTERVAL 30 DAY) AND p.fecha <= CURDATE();*/
    /*: Mostrar los productos con mayor cantidad de ventas en el último mes, junto con el
total vendido de cada uno.*/
 /*   SELECT
    p.nombre AS nombre_producto,
    SUM(v.cantidad) AS cantidad_total_vendida,
    SUM(v.cantidad * v.precio_venta) AS total_vendido
FROM
    productos p
JOIN
    ventas v ON p.ID = v.ID_producto
JOIN
    pedidos pe ON v.ID_pedido = pe.ID
WHERE
    pe.fecha >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND pe.fecha <= CURDATE()
GROUP BY
    p.nombre
ORDER BY
    cantidad_total_vendida DESC;*/
    
    /* Listar los clientes que han realizado más pedidos en el último año, ordenados por
mayor cantidad de pedidos*/
/*    SELECT
    CONCAT(c.nombre, ' ', c.apellido) AS nombre_completo,
    c.correo_electronico,
    COUNT(p.ID) AS cantidad_pedidos
FROM
    clientes c
JOIN
    pedidos p ON c.ID = p.ID_cliente
WHERE
    p.fecha >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND p.fecha <= CURDATE()
GROUP BY
    c.ID
ORDER BY
    cantidad_pedidos DESC;*/

/*Aumentar el precio de todos los productos de la categoría "Camisetas" en un
10%.
*/

/*UPDATE productos
SET precio = precio * 1.10
WHERE categoria = 'Camisetas';


/*Eliminar los pedidos que no tengan ventas asociada*/
/*DELETE FROM pedidos
WHERE NOT EXISTS (
    SELECT 1
    FROM ventas
    WHERE ventas.ID_pedido = pedidos.ID
);*/




/*Crear una vista llamada "vista_clientes_pedidos" que muestre el nombre completo del
cliente, la fecha del pedido y el total del pedido.*/

/*CREATE VIEW vista_clientes_pedidos AS
SELECT
    CONCAT(c.nombre, ' ', c.apellido) AS nombre_completo,
    p.fecha AS fecha_pedido,
    p.total AS total_pedido
FROM
    clientes c
JOIN
    pedidos p ON c.ID = p.ID_cliente;*/
SELECT * FROM vista_clientes_pedidos;




