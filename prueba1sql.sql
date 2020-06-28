CREATE DATABASE prueba1sql;

CREATE TABLE clientes(
    id_cliente SERIAL,
    nombre_cliente VARCHAR(100) NOT NULL,
    rut_cliente VARCHAR(10) NOT NULL UNIQUE,
    direccion_cliente VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_cliente)
);

INSERT INTO clientes(nombre_cliente, rut_cliente, direccion_cliente) VALUES ('Bernardita', '15377966-K', 'Los abetos 1569');
INSERT INTO clientes(nombre_cliente, rut_cliente, direccion_cliente) VALUES ('Barbara', '15958528-K', 'Teruel 1176');
INSERT INTO clientes(nombre_cliente, rut_cliente, direccion_cliente) VALUES ('Joaquin', '7034698-9', 'Lota 2783');
INSERT INTO clientes(nombre_cliente, rut_cliente, direccion_cliente) VALUES ('Trinidad', '13550479-9', 'Los romanos 1429');
INSERT INTO clientes(nombre_cliente, rut_cliente, direccion_cliente) VALUES ('Rafael', '12377550-4', 'Monte Real 12083');

CREATE TABLE categorias_productos(
    id_categoria SERIAL,
    nombre_categoria VARCHAR(30) NOT NULL,
    descripcion_categoria VARCHAR(300) NOT NULL, 
    PRIMARY KEY (id_categoria)
);

INSERT INTO categorias_productos(nombre_categoria, descripcion_categoria) VALUES ('Electrodomesticos', 'maquinaria hogar');
INSERT INTO categorias_productos(nombre_categoria, descripcion_categoria) VALUES ('Herramientas', 'herramientas hogar');
INSERT INTO categorias_productos(nombre_categoria, descripcion_categoria) VALUES ('Jardin', 'plantas jardin');

CREATE TABLE productos(
    id_producto SERIAL,
    nombre_producto VARCHAR(30) NOT NULL,
    id_categoria INT NOT NULL, 
    descripcion_producto VARCHAR(300),
    valor_unitario INT,
    PRIMARY KEY (id_producto),
    FOREIGN KEY (id_categoria) REFERENCES categorias_productos (id_categoria)
);

INSERT INTO productos(nombre_producto, id_categoria, descripcion_producto, valor_unitario) VALUES ('refrigerador', 1, 'para enfriar', 500);
INSERT INTO productos(nombre_producto, id_categoria, descripcion_producto, valor_unitario) VALUES ('lavadora', 1, 'para lavar', 400);
INSERT INTO productos(nombre_producto, id_categoria, descripcion_producto, valor_unitario) VALUES ('gomero', 3, 'planta interior', 80);
INSERT INTO productos(nombre_producto, id_categoria, descripcion_producto, valor_unitario) VALUES ('lilium', 3, 'flores', 25);
INSERT INTO productos(nombre_producto, id_categoria, descripcion_producto, valor_unitario) VALUES ('martillo', 2, 'para martillar', 120);
INSERT INTO productos(nombre_producto, id_categoria, descripcion_producto, valor_unitario) VALUES ('desatornillador cruz', 2, 'para desatornillar en cruz', 80);
INSERT INTO productos(nombre_producto, id_categoria, descripcion_producto, valor_unitario) VALUES ('desatornillador paleta', 2, 'para desatornillar en paleta', 75);
INSERT INTO productos(nombre_producto, id_categoria, descripcion_producto, valor_unitario) VALUES ('veronica', 3, 'planta exterior', 50);

CREATE TABLE facturas(
    numero_factura SERIAL,
    id_cliente INT,
    fecha DATE NOT NULL,
    subtotal INT,
    iva INT,
    precio_total INT,
    PRIMARY KEY (numero_factura),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

INSERT INTO facturas(id_cliente, fecha, subtotal, iva, precio_total) VALUES (1, '20/03/2019', 900, 171, 1071);
INSERT INTO facturas(id_cliente, fecha, subtotal, iva, precio_total) VALUES (1, '22/03/2019', 195, 37, 232);
INSERT INTO facturas(id_cliente, fecha, subtotal, iva, precio_total) VALUES (2, '18/03/2019', 480, 91, 571);
INSERT INTO facturas(id_cliente, fecha, subtotal, iva, precio_total) VALUES (2, '15/03/2019', 655, 124, 779);
INSERT INTO facturas(id_cliente, fecha, subtotal, iva, precio_total) VALUES (2, '2/03/2019', 75, 14, 89);
INSERT INTO facturas(id_cliente, fecha, subtotal, iva, precio_total) VALUES (3, '30/03/2019', 500, 95, 595);
INSERT INTO facturas(id_cliente, fecha, subtotal, iva, precio_total) VALUES (4, '29/03/2019', 450, 85, 535);
INSERT INTO facturas(id_cliente, fecha, subtotal, iva, precio_total) VALUES (4, '27/03/2019', 195, 37, 232);
INSERT INTO facturas(id_cliente, fecha, subtotal, iva, precio_total) VALUES (4, '13/03/2019', 1055, 200, 1255);
INSERT INTO facturas(id_cliente, fecha, subtotal, iva, precio_total) VALUES (4, '10/03/2019', 80, 15, 95);

CREATE TABLE detalles_facturas(
    numero_factura INT,
    id_producto INT,
    cantidad_producto INT,
    FOREIGN KEY (numero_factura) REFERENCES facturas (numero_factura),
    FOREIGN KEY (id_producto) REFERENCES productos (id_producto)
);

INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (1, 2, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (1, 1, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (2, 5, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (2, 4, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (2, 8, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (3, 2, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (3, 3, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (4, 1, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (4, 6, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (4, 7, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (5, 8, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (5, 4, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (6, 1, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (7, 8, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (7, 2, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (8, 1, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (8, 5, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (8, 8, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (9, 1, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (9, 6, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (9, 7, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (9, 2, 1);
INSERT INTO detalles_facturas(numero_factura, id_producto, cantidad_producto) VALUES (10, 3, 1);

SELECT * FROM facturas FULL OUTER JOIN clientes ON facturas.id_cliente = clientes.id_cliente ORDER BY precio_total DESC; 
SELECT * FROM facturas FULL OUTER JOIN clientes ON facturas.id_cliente = clientes.id_cliente WHERE precio_total > 100; 
SELECT * FROM detalles_facturas FULL OUTER JOIN facturas ON detalles_facturas.numero_factura = facturas.numero_factura WHERE id_producto = 6; 