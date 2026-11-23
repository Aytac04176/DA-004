--1.Bütün müştərilərin adını, ölkəsini və şəhərini gətir. 
select 
CompanyName,
Country,
City
from Customers;

--2.Yalnız Almaniyadakı müştəriləri gətir. 
select * from Customers
where Country="Germany";

--3.Məhsulları qiymətə görə azalan sıra ilə sırala — yalnız ad, qiymət, kateqoriya ID-si.
SELECT 
ProductName,
UnitPrice,
CategoryID
from Products
order by UnitPrice desc;

--4.Stoku 0-dan az olan məhsulları gətir — bunlar kritik stok vəziyyətindədir.
select * from Products
where UnitsInStock<0;

--5.Sifarişleri tarixə görə artan sıra ilə sırala — ən köhnə sifariş hansıdır?
select * from Orders
order by OrderDate ;

--6.Qiyməti $20-dan yuxarı olan məhsulları gətir.
select * from Products
where UnitPrice>20;

--7.Beverages kateqoriyasındakı məhsulların ortalama qiymətini hesabla. 
select 
avg(unitprice)
from products p
inner join Categories c
on p.CategoryID=c.CategoryID
where CategoryName='Beverages';

--8.1997-ci ildə verilmiş sifarişlərin sayını hesabla.
select 
count(OrderID)
from Orders
where OrderDate>='1997.01.01'
AND OrderDate<'1998.01.01';

--9. Fransa ya da İtaliyadan olan müştəriləri gətir.
select * from Customers
where Country='France' or Country='Italy';

--10.Hər ölkədəki müştəri sayını hesabla — ən çox müştərisi olan ölkə hansıdır? USA
select 
Country,
count(CustomerID) as customercount
from Customers 
group by Country
order by customercount desc;

--11.Hər kateqoriyada neçə məhsul var? 
select 
CategoryName,
count(p.ProductID)
from Categories c
 inner join Products p
 on c.CategoryID=p.CategoryID
group by CategoryName;

--12.Hər müştərinin neçə sifarişi var — azalan sıra ilə sırala.
select 
CompanyName,
count(OrderID) order_count
from customers c inner join Orders o
on c.CustomerID=o.CustomerID
group by CompanyName
order by order_count desc ;

--13.Ən çox sifariş verən ilk 5 müştəri kimdir?
SELECT
CompanyName,
count(OrderID) order_count
from Customers c inner join Orders o
on c.CustomerID=o.CustomerID
group by CompanyName
order by order_count DESC
LIMIT 5;

--14.Hər ölkənin ümumi sifariş sayı. 
select 
Country,
count(OrderID) order_count
from customers c inner join orders o
on c.CustomerID=o.CustomerID
group by Country;

--15.Ortalama sifariş dəyərindən yuxarı olan sifarişlər.
SELECT
OrderID,
sum(UnitPrice * Quantity * (1 - Discount)) as OrderValue
from [Order Details]
group by OrderID
Having sum(UnitPrice * Quantity * (1 - Discount))>
(
    select	AVG(TotalValue)
    FROM (
        SELECT
            SUM(UnitPrice * Quantity * (1 - Discount)) AS TotalValue
        FROM [Order Details]
        GROUP BY OrderID
    )
);







