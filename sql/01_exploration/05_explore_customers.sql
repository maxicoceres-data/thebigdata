-- Issue #5
-- Exploración inicial de tablas
-- Consultas a las tablas principales de la base de datos
-- Voy a inspeccionar customers.
-- objetivo: 
-- Cantidad de filas
-- Cantidad de columnas con valores nulos
-- rango temporal (max y min)
-- top 5 valores unicos de la columna categorica mas importante


use classicmodels;

-- Customers
SELECT COUNT(*) FROM customers;

-- nulos customers
SELECT
SUM(CASE WHEN customerNumber IS NULL THEN 1 ELSE 0 END) AS nulls_customerNumber,
SUM(CASE WHEN customerName IS NULL THEN 1 ELSE 0 END) AS nulls_customerName,
SUM(CASE WHEN contactLastName IS NULL THEN 1 ELSE 0 END) AS nulls_contactLastName,
SUM(CASE WHEN contactFirstName IS NULL THEN 1 ELSE 0 END) AS nulls_contactFirstName,
SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) AS nulls_phone,
SUM(CASE WHEN addressLine1 IS NULL THEN 1 ELSE 0 END) AS nulls_addressLine1,
SUM(CASE WHEN addressLine2 IS NULL THEN 1 ELSE 0 END) AS nulls_addressLine2,
SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS nulls_city,
SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) AS nulls_state,
SUM(CASE WHEN postalCode IS NULL THEN 1 ELSE 0 END) AS nulls_postalCode,
SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS nulls_country,
SUM(CASE WHEN salesRepEmployeeNumber IS NULL THEN 1 ELSE 0 END) AS nulls_salesRepEmployeeNumber,
SUM(CASE WHEN creditLimit IS NULL THEN 1 ELSE 0 END) AS nulls_creditLimit
FROM customers;

SELECT country, state, SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) AS nulls_state
FROM customers
GROUP BY country, state;

-- MAX Y MIN
SELECT MAX(creditLimit) AS max_creditlimit, MIN(creditLimit) AS min_creditlimit
FROM customers;

-- top 5 valores categoricos
SELECT city, COUNT(*) AS ct
FROM customers
GROUP BY city
ORDER BY ct ASC
LIMIT 5; 

SELECT country, COUNT(*) AS cnt
FROM customers
GROUP BY country
ORDER BY cnt DESC
LIMIT 5;

-- CONCLUSIONES
-- Cantidad de datos 122
-- Son pocas columnas las que tienen valores nulos, es un dataset completo para trabajar.
-- Los valores nulos a verificar serian de las columnas null_state ( hay que ver por que no estan registrados y como completarlos), null_postalCode podemos completarlo verificando la comparación de la direccion y completarlo con el numero correcto.
-- Los valores nulos de null_state son de paises fuera de USA.
-- Los valores nulos de salesRepEmployeeNumber es un error del empleado. Se puede estudiar si el empleado esta divido por zona de trabajo, de no ser asi son datos irrelevantes por ahora. 
-- Los valores nulos de addressLine2 suman la cantidad de 100, es decir la mayoria de los clientes no tienen una segunda dirección para aportar.

-- El maximo de limite de credito es de 227600 y el minimo es de 0, esto es correcto? Se puede marcar como un limite el 0 si no se va a dar credito?

-- Los países con mas cantidad de apariciones son USA, GERMANY, FRANCE, SPAIN, AUSTRALIA.
