use northwind;
-- Fes una query en SQL que mostri totes les columnes de tots els productes per
--     pantalla. És a dir retorna totes les columnes i totes les files de la taula Products
select * from products;

-- Mostra només la columna descripció de la taula Categories.
select categories.Description from northwind.categories;

-- Retorna la informació de tots els clients per pantalla usant la taula Customers.
select * from northwind.customers;

-- Mostra ara les columnes CategoryName i Description de la taula Categories.

select categories.CategoryName, categories.Description from northwind.categories;

-- Mostra ara només la columna descripció de la taula Categories i només per la fila on CategoryName = “Grains/Cereals”.
select categories.Description from northwind.categories where categories.CategoryName = "Grains/Cereals";

-- Desenvolupa una consulta que retorni tota la informació relativa a tots els productes de la taula Products que tenen categoria = 1.
select * from northwind.products where products.CategoryID = 1;

-- Retorna el ProductID del producte que té “Filo Mix” per nom.
select products.ProductID from northwind.products where products.ProductName = "Filo Mix";

-- Mostra tota la info de tots els productes del SupplierID número 3. Usa la taula Products.
select * from northwind.products where products.SupplierID = 3; 

-- Retorna tots els productes de la categoria 2 que tenen un preu > 20.
select * from northwind.products where products.CategoryID = 2 and products.UnitPrice > 20;

-- Fes una query que retorni les dades de tots els clients alemanys.
select * from northwind.customers where customers.Country = "Germany";

-- Retorna el nom i la data de naixement de l’empleat Steven Buchanan usant la taula Employees.
select employees.FirstName, employees.LastName, employees.BirthDate from northwind.employees where employees.FirstName = "Steven" and employees.LastName = "Buchanan";

-- Volem un llistat dels noms de tots els proveïdors japonesos. Usa la taula Suppliers.
select suppliers.ContactName from northwind.suppliers where Country = "Japan";

-- Volem ara un llistat de les persones de contacte dels proveïdors britànics i el seu telèfon. Usa la taula Suppliers.
select suppliers.ContactName, suppliers.Phone from northwind.suppliers where Country = "UK";

-- Troba el nom de l’empresa d’enviaments que té el telèfon = (503) 555-3199. Usa la taula Shippers.
select shippers.CompanyName from northwind.shippers where Phone = "(503) 555-3199";

-- Mostra el preu i el pes del ProductID = 69
select products.UnitPrice from northwind.products where ProductID = 69;

-- Retorna un llistat de tota la informació de tots els clients ordenats pel país de procedència alfabèticament.
select * from northwind.customers group by customers.Country;

-- Fes el recompte de quants productes hi ha de la categoria 2 que tenen un preu > 20
select count(products.ProductID) from northwind.products where products.CategoryID = 2 and products.UnitPrice > 20;

--  Fes una query que retorni la xifra del producte més car de la taula Products.
select products.ProductID from northwind.products group by products.UnitPrice limit 1;

-- Retorna el preu mig de la taula Products
select avg(products.UnitPrice) from northwind.products;

-- Mostra la data de la primera l’ordre creada. Usa la taula Orders.
select min(orders.OrderDate) from northwind.orders;

-- Mostra el preu de la Order 10255 (Price x quantitat de tots els productes).
select sum(orderdetails.UnitPrice * orderdetails.Quantity) from northwind.orderdetails where orderdetails.OrderID = 10255;

-- Mostra el numero de productes de cada Order.
select sum(orderdetails.Quantity), orderdetails.OrderID from northwind.orderdetails group by OrderID;

-- Mostra el numero de productes de cada Order sempre que siguin mes de 3
select sum(orderdetails.Quantity), orderdetails.OrderID from northwind.orderdetails group by OrderID having sum(orderdetails.Quantity) > 3 ;

-- Mostra els suppliers de les Ciutats que comencen per B que tenen productes amb un preu major a 50.
select * from northwind.suppliers, northwind.products where suppliers.City like 'B%' and products.UnitPrice > 50 group by suppliers.SupplierID;

-- Mostra els clients d’un país amb més de 7 lletres.
select * from northwind.customers having length(Country) > 7;

-- Mostra les ordres d’avui.
select * from northwind.orders having OrderDate = current_date();

-- Mostra les ordres de febrer del 1997 del empleat 2
select * from northwind.orders where EmployeeID = 2 and month(OrderDate) = 2 and year(OrderDate) = 1997;

-- Mostra la mitja de ordres per any
select avg(TotalOrders) from (select count(OrderID) as TotalOrders from orders group by year(OrderDate)) as total;

-- Mostra el seu preu del producte més barat i el més car (2 Selects separats).
select max(UnitPrice), min(UnitPrice) from products;

-- Les ID’s de les Ordres de 4 productes diferents o més indicant també el nom del client.
select orders.OrderID, customers.ContactName from northwind.orders, northwind.customers limit 4;

-- Mostra l’ordre amb més quantitat de productes.
select orderdetails.OrderID, sum(Quantity) as suma from orderdetails group by orderdetails.OrderID order by suma DESC limit 1;

-- Mostra l’empleat més gran i el més petit (2 Selects separats)
select concat(employees.FirstName," ",employees.LastName)as mes_petit, max(employees.BirthDate), concat(employees.FirstName," ",employees.LastName) as mes_gran, min(employees.BirthDate) from northwind.employees;

-- Retorna l’adreça, ciutat, codi postal i país de tots els clients (tot junts amb un camp).
select concat(customers.Address," ", customers.City, " ", customers.ReportsTo, " ", customers.Country) from customers;