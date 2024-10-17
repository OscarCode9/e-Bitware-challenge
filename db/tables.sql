CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Eliminar tablas anteriores si existen
DROP TABLE IF EXISTS SALE CASCADE;
DROP TABLE IF EXISTS CASHIERS CASCADE;
DROP TABLE IF EXISTS PRODUCTS CASCADE;
DROP TABLE IF EXISTS CASH_REGISTERS CASCADE;

SELECT gen_random_uuid()

CREATE TABLE CASHIERS (
   	Code SERIAL PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL
);

CREATE TABLE PRODUCTS (
    Code SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Price INT
);

CREATE TABLE CASH_REGISTERS (
    Code SERIAL PRIMARY KEY,
    Floor INT
);

-- Crear tabla SALE que referencia UUIDs
-- Es importante considerar que la definición actual de la clave primaria en la tabla SALE es:
-- PRIMARY KEY (Cashier, Register, Product)
-- Esto puede ser problemático, ya que permite la posibilidad de que un cajero utilice la misma caja 
-- registradora para vender el mismo producto varias veces. 
-- Esta situación podría ocurrir especialmente en el caso de productos que están en stock. 
-- Para solucionar este problema, es recomendable utilizar un UUID como clave primaria para cada venta individual. 
-- Esto permitirá registrar múltiples transacciones del mismo producto por el mismo cajero y en la misma caja, 
-- garantizando la integridad y flexibilidad de la base de datos.
CREATE TABLE SALE (
    Cashier INT,
    Register INT,
    Product INT,
    Code UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    FOREIGN KEY (Cashier) REFERENCES CASHIERS(Code),
    FOREIGN KEY (Register) REFERENCES CASH_REGISTERS(Code),
    FOREIGN KEY (Product) REFERENCES PRODUCTS(Code)
);
