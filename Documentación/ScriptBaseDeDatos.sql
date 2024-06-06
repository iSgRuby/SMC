-- Verificar en qué base de datos nos encontramos
SELECT DB_NAME() AS CurrentDatabase;

-- Regresar a master
USE master;

-- Eliminar la base de datos si ya existe
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'cafeteria_ESIME_Culhuacan')
BEGIN
    ALTER DATABASE cafeteria_ESIME_Culhuacan SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE cafeteria_ESIME_Culhuacan;
END;

-- Crear la nueva base de datos
CREATE DATABASE cafeteria_ESIME_Culhuacan;
GO

-- Usar la nueva base de datos
USE cafeteria_ESIME_Culhuacan;
GO

--Crear tabla CATEGORIAS
CREATE TABLE CATEGORIAS (
    Id_Categoria INT IDENTITY(1,1) PRIMARY KEY,
    Nombre_Categoria VARCHAR(20) NOT NULL
);
GO


-- Crear tabla SUBCATEGORIAS
CREATE TABLE SUBCATEGORIAS (
    Id_Subcategoria INT IDENTITY(1,1) PRIMARY KEY,
    Nombre_Subcategoria VARCHAR(20) NOT NULL,
    Id_Categoria INT NOT NULL,
    FOREIGN KEY (Id_Categoria) REFERENCES CATEGORIAS(Id_Categoria)
);
GO


-- Crear tabla PRODUCTOS
CREATE TABLE PRODUCTOS (
    Id_Producto INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(30) NOT NULL,
    Descripcion VARCHAR(100) NOT NULL,
    Disponibilidad BIT NOT NULL,
    Id_Subcategoria INT NOT NULL,
    Precio DECIMAL(4,2) NOT NULL,
    FOREIGN KEY (Id_Subcategoria) REFERENCES SUBCATEGORIAS(Id_Subcategoria)
);
GO

-- Crear tabla PRODUCTOS
CREATE TABLE MENUS_DEL_DIA (
    Menu_ID INT IDENTITY(1,1) PRIMARY KEY,
	Descripcion NVARCHAR(100) NOT NULL,
	Precio DECIMAL(4,2) NOT NULL
);
GO


-- Insertar en tabla CATEGORIAS
INSERT INTO CATEGORIAS (Nombre_Categoria) VALUES ('Comidas');
INSERT INTO CATEGORIAS (Nombre_Categoria) VALUES ('Bebidas frías');
INSERT INTO CATEGORIAS (Nombre_Categoria) VALUES ('Bebidas calientes');
INSERT INTO CATEGORIAS (Nombre_Categoria) VALUES ('Snacks');
INSERT INTO CATEGORIAS (Nombre_Categoria) VALUES ('Dulces');
GO

SELECT * FROM CATEGORIAS;

-- SUBCATEGORIAS
-- Comidas
INSERT INTO SUBCATEGORIAS (Nombre_Subcategoria, Id_Categoria) VALUES ('Tacos', 1);
INSERT INTO SUBCATEGORIAS (Nombre_Subcategoria, Id_Categoria) VALUES ('Tortas', 1);
INSERT INTO SUBCATEGORIAS (Nombre_Subcategoria, Id_Categoria) VALUES ('Hamburguesas', 1);
INSERT INTO SUBCATEGORIAS (Nombre_Subcategoria, Id_Categoria) VALUES ('Molletes', 1);
INSERT INTO SUBCATEGORIAS (Nombre_Subcategoria, Id_Categoria) VALUES ('Burritos', 1);
INSERT INTO SUBCATEGORIAS (Nombre_Subcategoria, Id_Categoria) VALUES ('Chilaquiles', 1);

-- Bebidas frías
INSERT INTO SUBCATEGORIAS (Nombre_Subcategoria, Id_Categoria) VALUES ('Jugos', 2);
INSERT INTO SUBCATEGORIAS (Nombre_Subcategoria, Id_Categoria) VALUES ('Refrescos', 2);

-- Bebidas calientes
INSERT INTO SUBCATEGORIAS (Nombre_Subcategoria, Id_Categoria) VALUES ('Cafés', 3);
INSERT INTO SUBCATEGORIAS (Nombre_Subcategoria, Id_Categoria) VALUES ('Tés', 3);

-- Snacks
INSERT INTO SUBCATEGORIAS (Nombre_Subcategoria, Id_Categoria) VALUES ('Frituras', 4);
INSERT INTO SUBCATEGORIAS (Nombre_Subcategoria, Id_Categoria) VALUES ('Galletas', 4);

-- Dulces
INSERT INTO SUBCATEGORIAS (Nombre_Subcategoria, Id_Categoria) VALUES ('Chicles', 5);
INSERT INTO SUBCATEGORIAS (Nombre_Subcategoria, Id_Categoria) VALUES ('Chocolates', 5);
INSERT INTO SUBCATEGORIAS (Nombre_Subcategoria, Id_Categoria) VALUES ('Barritas', 5);
GO

SELECT * FROM SUBCATEGORIAS;

-- PRODUCTOS
USE cafeteria_ESIME_Culhuacan;
GO

-- Tacos
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Taco de Pastor', 'Taco de pastor con cebolla y cilantro', 1, 1, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Taco de Bisteck', 'Taco de bisteck con cebolla y cilantro', 1, 1, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Taco de Suadero', 'Taco de suadero con cebolla y cilantro', 1, 1, 11.00);

-- Tortas
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Torta de Jamón', 'Torta con jamón, queso y aguacate', 1, 2, 15.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Torta de Milanesa', 'Torta con milanesa, queso y aguacate', 1, 2, 20.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Torta Cubana', 'Torta cubana con milanesa, jamón, salchicha y queso', 1, 2, 25.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Torta de Queso', 'Torta con queso panela, jitomate y aguacate', 1, 2, 18.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Torta de Pastor', 'Torta con carne al pastor, piña y cebolla', 1, 2, 22.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Torta de Suadero', 'Torta con carne de suadero, aguacate y cebolla', 1, 2, 21.00);

-- Hamburguesas
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Hamburguesa Sencilla', 'Hamburguesa con carne, lechuga, jitomate y queso', 1, 3, 30.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Hamburguesa Doble', 'Hamburguesa con doble carne, lechuga, jitomate y queso', 1, 3, 45.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Hamburguesa Hawaiana', 'Hamburguesa con carne, piña, jamón y queso', 1, 3, 40.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Hamburguesa con Tocino', 'Hamburguesa con carne, tocino, lechuga, jitomate y queso', 1, 3, 50.00);

-- Molletes
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Mollete Sencillo', 'Mollete con frijoles y queso', 1, 4, 15.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Mollete con Longaniza', 'Mollete con frijoles, queso y longaniza', 1, 4, 20.00);

-- Burritos
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Burrito Sencillo', 'Burrito con frijoles, arroz y queso', 1, 5, 20.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Burrito con Longaniza', 'Burrito con frijoles, arroz, queso y longaniza', 1, 5, 25.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Burrito con Suadero', 'Burrito con frijoles, arroz, queso y suadero', 1, 5, 30.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Burrito con Pastor', 'Burrito con frijoles, arroz, queso y pastor', 1, 5, 28.00);

-- Chilaquiles
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Chilaquiles Rojos Sencillos', 'Chilaquiles rojos con crema y queso', 1, 6, 18.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Chilaquiles Verdes Sencillos', 'Chilaquiles verdes con crema y queso', 1, 6, 18.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Chilaquiles Rojos con Pollo', 'Chilaquiles rojos con pollo, crema y queso', 1, 6, 25.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Chilaquiles Verdes con Pollo', 'Chilaquiles verdes con pollo, crema y queso', 1, 6, 25.00);

-- Jugos
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Jugo de Naranja', 'Jugo natural de naranja', 1, 7, 15.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Jugo de Zanahoria', 'Jugo natural de zanahoria', 1, 7, 15.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Jugo de Mango', 'Jugo natural de mango', 1, 7, 18.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Jugo de Betabel', 'Jugo natural de betabel', 1, 7, 18.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Jugo Verde', 'Jugo verde con nopal, piña y apio', 1, 7, 20.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Boing de Manzana', 'Jugo Boing sabor manzana', 1, 7, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Boing de Fresa', 'Jugo Boing sabor fresa', 1, 7, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Boing de Guanabana', 'Jugo Boing sabor guanabana', 1, 7, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Boing de Mango', 'Jugo Boing sabor mango', 1, 7, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Boing de Durazno', 'Jugo Boing sabor durazno', 1, 7, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Boing de Guayaba', 'Jugo Boing sabor guayaba', 1, 7, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Boing de Naranja', 'Jugo Boing sabor naranja', 1, 7, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Boing de Uva', 'Jugo Boing sabor uva', 1, 7, 12.00);

-- Refrescos
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Coca-Cola', 'Refresco Coca-Cola', 1, 8, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Sprite', 'Refresco Sprite', 1, 8, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Fanta', 'Refresco Fanta', 1, 8, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Sidral Mundet', 'Refresco Sidral Mundet', 1, 8, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Fresca', 'Refresco Fresca', 1, 8, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Pepsi', 'Refresco Pepsi', 1, 8, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Mirinda', 'Refresco Mirinda', 1, 8, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('7up', 'Refresco 7up', 1, 8, 10.00);

-- Cafés
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Café Negro', 'Café negro', 1, 9, 20.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Café con Leche', 'Café con leche', 1, 9, 25.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Café de Vainilla', 'Café sabor vainilla', 1, 9, 30.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Café Espresso', 'Café espresso', 1, 9, 35.00);

-- Tés
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Té Verde', 'Té verde', 1, 10, 15.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Té de Limón', 'Té de limón', 1, 10, 15.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Té de Manzanilla', 'Té de manzanilla', 1, 10, 15.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Té de Anís', 'Té de anís', 1, 10, 15.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Té de Menta', 'Té de menta', 1, 10, 15.00);

-- Frituras
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Sabritas Naturales', 'Frituras Sabritas naturales', 1, 11, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Sabritas Adobadas', 'Frituras Sabritas adobadas', 1, 11, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Sabritas Crema y Especias', 'Frituras Sabritas crema y especias', 1, 11, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Sabritas Limón', 'Frituras Sabritas limón', 1, 11, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Sabritas Habanero', 'Frituras Sabritas habanero', 1, 11, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Sabritas Flaming Hot', 'Frituras Sabritas flaming hot', 1, 11, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Doritos', 'Frituras Doritos', 1, 11, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Ruffles', 'Frituras Ruffles', 1, 11, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Cheetos Bolitas', 'Frituras Cheetos bolitas', 1, 11, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Cheetos Torcidos', 'Frituras Cheetos torcidos', 1, 11, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Cheetos Nachos', 'Frituras Cheetos nachos', 1, 11, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Rancheritos', 'Frituras Rancheritos', 1, 11, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Fritos', 'Frituras Fritos', 1, 11, 12.00);

-- Galletas
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Chokis', 'Galletas Chokis', 1, 12, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Oreo', 'Galletas Oreo', 1, 12, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Emperador', 'Galletas Emperador', 1, 12, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Principe', 'Galletas Principe', 1, 12, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Maravillas', 'Galletas Maravillas', 1, 12, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Marias', 'Galletas Marias', 1, 12, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Arcoiris', 'Galletas Arcoiris', 1, 12, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Lords', 'Galletas Lords', 1, 12, 10.00);

-- Chicles
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Bubbaloo Menta', 'Chicles Bubbaloo sabor menta', 1, 13, 5.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Bubbaloo Yerbabuena', 'Chicles Bubbaloo sabor yerbabuena', 1, 13, 5.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Bubbaloo Chicle', 'Chicles Bubbaloo sabor chicle', 1, 13, 5.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Bubbaloo Fresa', 'Chicles Bubbaloo sabor fresa', 1, 13, 5.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Bubbaloo Plátano', 'Chicles Bubbaloo sabor plátano', 1, 13, 5.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Bubbaloo Piña', 'Chicles Bubbaloo sabor piña', 1, 13, 5.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Bubbaloo Mora Azul', 'Chicles Bubbaloo sabor mora azul', 1, 13, 5.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Trident Menta', 'Chicles Trident sabor menta', 1, 13, 5.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Trident Yerbabuena', 'Chicles Trident sabor yerbabuena', 1, 13, 5.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Trident Chicle', 'Chicles Trident sabor chicle', 1, 13, 5.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Trident Fresa', 'Chicles Trident sabor fresa', 1, 13, 5.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Trident Plátano', 'Chicles Trident sabor plátano', 1, 13, 5.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Trident Menta Fuerte', 'Chicles Trident sabor menta fuerte', 1, 13, 5.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Trident Mora Azul', 'Chicles Trident sabor mora azul', 1, 13, 5.00);

-- Chocolates
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Hersheys', 'Chocolate Hersheys', 1, 14, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Carlos V', 'Chocolate Carlos V', 1, 14, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Milky Way', 'Chocolate Milky Way', 1, 14, 15.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Snickers', 'Chocolate Snickers', 1, 14, 15.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Crunch', 'Chocolate Crunch', 1, 14, 12.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Kit-Kat', 'Chocolate Kit-Kat', 1, 14, 15.00);

-- Barritas
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Barritas de Fresa', 'Barritas de fresa', 1, 15, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Barritas de Piña', 'Barritas de piña', 1, 15, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Barritas de Mora Azul', 'Barritas de mora azul', 1, 15, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Bran Frut de Fresa', 'Bran Frut sabor fresa', 1, 15, 10.00);
INSERT INTO PRODUCTOS (Nombre, Descripcion, Disponibilidad, Id_Subcategoria, Precio) VALUES ('Bran Frut de Piña', 'Bran Frut sabor piña', 1, 15, 10.00);

SELECT * FROM PRODUCTOS;

INSERT INTO MENUS_DEL_DIA(Descripcion, Precio)
VALUES
	('Huevito con jamon', 50.40),
	('Jamon con huevito', 40.50);

SELECT * FROM MENUS_DEL_DIA;

