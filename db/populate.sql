--Generar script para poblar todas las tablas.

-- Insertar más datos en la tabla CASHIERS
INSERT INTO CASHIERS (FullName)
VALUES
('Laura Martínez'),
('Pedro Pérez'),
('Ana González'),
('Carlos Ruiz'),
('Luis Fernández'),
('Marta Sánchez'),
('José López');

select gen_random_uuid()
-- Insertar más datos en la tabla PRODUCTS
INSERT INTO PRODUCTS (Name, Price)
VALUES
('Milk', 4),
('Bread', 3),
('Butter', 5),
('Cheese', 6),
('Yogurt', 2),
('Cereal', 4),
('Chicken Breast', 10),
('Fish Fillet', 12),
('Ground Beef', 8),
('Soda', 2),
('Chocolate Bar', 1),
('Eggs (Dozen)', 3),
('Tomato', 1),
('Potato', 1),
('Onion', 1);

-- Insertar más datos en la tabla CASH_REGISTERS
INSERT INTO CASH_REGISTERS (Floor)
VALUES
(1),
(2),
(2),
(3),
(3),
(4),
(4),
(5);

-- Insertar más datos en la tabla SALE
INSERT INTO SALE (Cashier, Register, Product)
VALUES
(4, 4, 6),  -- Carlos Ruiz vende Cereal en la caja 4
(5, 5, 7),  -- Luis Fernández vende Chicken Breast en la caja 5
(6, 6, 8),  -- Marta Sánchez vende Fish Fillet en la caja 6
(7, 7, 9),  -- José López vende Ground Beef en la caja 7
(1, 1, 10), -- Laura Martínez vende Soda en la caja 1
(2, 2, 11), -- Pedro Pérez vende Chocolate Bar en la caja 2
(3, 3, 12), -- Ana González vende Eggs en la caja 3
(4, 4, 13), -- Carlos Ruiz vende Tomato en la caja 4
(5, 5, 14), -- Luis Fernández vende Potato en la caja 5
(6, 6, 15); -- Marta Sánchez vende Onion en la caja 6
-- Insertar más datos en la tabla SALE

INSERT INTO SALE (Cashier, Register, Product)
VALUES
(4, 4, 6),  -- Carlos Ruiz vende Cereal en la caja 4
(5, 5, 7),  -- Luis Fernández vende Chicken Breast en la caja 5
(6, 6, 8);  -- Marta Sánchez vende Fish Fillet en la caja 6