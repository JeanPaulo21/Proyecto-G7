create database EcommerceApp;
use EcommerceApp;

-- Create Database (if it doesn't exist)
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'EcommerceApp')
BEGIN
    CREATE DATABASE EcommerceApp;
END
GO

USE EcommerceApp;
GO

-- Create Products Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Productos')
BEGIN
    CREATE TABLE Productos (
        Id INT PRIMARY KEY IDENTITY(1,1),
        Nombre NVARCHAR(100) NOT NULL,
        Descripcion NVARCHAR(500) NULL,
        Precio DECIMAL(10, 2) NOT NULL,
        ImagenUrl NVARCHAR(255) NULL,
        FechaCreacion DATETIME DEFAULT GETDATE(),
        Activo BIT DEFAULT 1
    );
END
GO

-- Create Categories Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Categorias')
BEGIN
    CREATE TABLE Categorias (
        Id INT PRIMARY KEY IDENTITY(1,1),
        Nombre NVARCHAR(100) NOT NULL,
        Descripcion NVARCHAR(500) NULL,
        Activo BIT DEFAULT 1
    );
END
GO

-- Create Product-Category Relationship Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'ProductoCategoria')
BEGIN
    CREATE TABLE ProductoCategoria (
        ProductoId INT NOT NULL,
        CategoriaId INT NOT NULL,
        PRIMARY KEY (ProductoId, CategoriaId),
        FOREIGN KEY (ProductoId) REFERENCES Productos(Id),
        FOREIGN KEY (CategoriaId) REFERENCES Categorias(Id)
    );
END
GO

-- Create Users Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Usuarios')
BEGIN
    CREATE TABLE Usuarios (
        Id INT PRIMARY KEY IDENTITY(1,1),
        Nombre NVARCHAR(100) NOT NULL,
        Email NVARCHAR(150) NOT NULL UNIQUE,
        Password NVARCHAR(255) NOT NULL,
        FechaRegistro DATETIME DEFAULT GETDATE(),
        Activo BIT DEFAULT 1
    );
END
GO

-- Create Orders Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Pedidos')
BEGIN
    CREATE TABLE Pedidos (
        Id INT PRIMARY KEY IDENTITY(1,1),
        UsuarioId INT NOT NULL,
        FechaPedido DATETIME DEFAULT GETDATE(),
        Estado NVARCHAR(50) DEFAULT 'Pendiente',
        Total DECIMAL(10, 2) NOT NULL,
        DireccionEnvio NVARCHAR(500) NULL,
        FOREIGN KEY (UsuarioId) REFERENCES Usuarios(Id)
    );
END
GO

-- Create Order Details Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'DetallesPedido')
BEGIN
    CREATE TABLE DetallesPedido (
        Id INT PRIMARY KEY IDENTITY(1,1),
        PedidoId INT NOT NULL,
        ProductoId INT NOT NULL,
        Cantidad INT NOT NULL,
        PrecioUnitario DECIMAL(10, 2) NOT NULL,
        Subtotal DECIMAL(10, 2) NOT NULL,
        FOREIGN KEY (PedidoId) REFERENCES Pedidos(Id),
        FOREIGN KEY (ProductoId) REFERENCES Productos(Id)
    );
END
GO