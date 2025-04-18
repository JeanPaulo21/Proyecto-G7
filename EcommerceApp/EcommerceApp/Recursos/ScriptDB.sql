-- Creación de la base de datos (opcional)
CREATE DATABASE TiendaVirtual;
USE TiendaVirtual;

-- Tabla: Categorías
CREATE TABLE Categorias (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL
);

-- Tabla: Usuarios
CREATE TABLE Usuarios (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Correo NVARCHAR(100) UNIQUE NOT NULL,
    Contraseña NVARCHAR(255) NOT NULL,  -- Hash almacenado
    Rol NVARCHAR(50) NOT NULL DEFAULT 'Cliente'  -- Ej: 'Admin', 'Cliente'
);

-- Tabla: Productos
CREATE TABLE Productos (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(500),
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL DEFAULT 0,
    Imagen NVARCHAR(255),  -- Ruta de la imagen
    CategoriaID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(ID)
);

-- Tabla: Carrito
CREATE TABLE Carrito (
    ID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT NOT NULL,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL DEFAULT 1,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ID),
    CONSTRAINT UC_Carrito UNIQUE (UsuarioID, ProductoID)  -- Evita duplicados
);

-- Tabla: Pedidos
CREATE TABLE Pedidos (
    ID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT NOT NULL,
    Fecha DATETIME NOT NULL DEFAULT GETDATE(),
    Estado NVARCHAR(50) NOT NULL DEFAULT 'Pendiente',  -- 'Completado', 'Cancelado', etc.
    Total DECIMAL(10, 2) NOT NULL,
    DireccionEnvio NVARCHAR(255),  -- Opcional
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID)
);

-- Tabla: Pagos
CREATE TABLE Pagos (
    ID INT PRIMARY KEY IDENTITY(1,1),
    PedidoID INT NOT NULL,
    Metodo NVARCHAR(50) NOT NULL,  -- 'Tarjeta', 'PayPal', etc.
    Estado NVARCHAR(50) NOT NULL DEFAULT 'Pendiente',
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(ID)
);
CREATE INDEX IX_Productos_CategoriaID ON Productos(CategoriaID);