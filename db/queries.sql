-- 1. Mostrar el número de ventas de cada producto, ordenado de más a menos ventas.

SELECT (SELECT p2.name FROM products p2 WHERE p2.code = s.product), count(s.product) AS totalProduct FROM sale s 
INNER JOIN products p ON p.code = s.product  
GROUP BY s.product 
ORDER BY  s.product asc;

SELECT 
    p.name AS product_name, 
    COUNT(s.product) AS total_product 
FROM 
    sale s 
INNER JOIN 
    products p ON p.code = s.product  
GROUP BY 
    p.name
ORDER BY  total_product desc ;

--2. Obtener un informe completo de ventas, indicando el nombre del cajero que realizo la
--venta, nombre y precios de los productos vendidos, y el piso en el que se encuentra la
-- máquina registradora donde se realizó la venta.

SELECT c.fullname, p."name", p.price, cr.floor from sale s 
INNER JOIN products p on p.code = s.product 
INNER JOIN cash_registers cr on cr.code = s.register 
INNER JOIN cashiers c on c.code = s.cashier;

--3. Obtener las ventas totales realizadas en cada piso. 
SELECT count(p.code) as count_sale, cr.floor  from sale s 
INNER join products p on p.code = s.product 
INNER join cash_registers cr on cr.code = s.register 
group by cr.floor 

--4. Obtener el código y nombre de cada cajero junto con el importe total de sus ventas

SELECT c.code , c.fullname, SUM(p.price) as total_sale from sale s 
INNER JOIN products p on p.code = s.product  
INNER JOIN cashiers c on c.code = s.cashier group by c.code ORDER BY  total_sale desc ;


--5. Obtener el código y nombre de aquellos cajeros que hayan realizado ventas en pisos
--cuyas ventas totales sean inferiores a los 5000 pesos.

SELECT 
    c.Code AS cashier_code, 
    c.FullName AS cashier_name,
    SUM(p.Price) AS total_sales  -- Total de ventas por cajero
FROM 
    CASHIERS c
INNER JOIN 
    SALE s ON c.Code = s.Cashier
INNER JOIN 
    PRODUCTS p ON s.Product = p.Code
INNER JOIN 
    CASH_REGISTERS cr ON s.Register = cr.Code
GROUP BY 
    c.Code, c.FullName
HAVING 
    SUM(p.Price) < 5000 -- Filtrar por ventas totales inferiores a 5000
ORDER BY  total_sales desc;

