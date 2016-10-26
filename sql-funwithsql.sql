--Return all category names with their descriptions from the Categories table.
select all [CategoryName], [Description]
from [dbo].[Categories]

--Return the contact name, customer id, and company name of all Customers in London
select [ContactName], [CustomerID], [CompanyName]
from [dbo].[Customers]
where [city] IN ('London')

--Return all available columns in the Suppliers tables for the marketing managers and sales representatives that have a FAX number
select [Fax]
from [dbo].[Suppliers]
where [Fax] IS NOT NULL AND [ContactTitle] IN ('Marketing Manager', 'Sales Representative')

--Return a list of customer id's from the Orders table with required dates between Jan 1, 1997 and Jan 1, 1998 and with freight under 100 units.
select [CustomerID]
from [dbo].[Orders]
where [RequiredDate] BETWEEN '1997-01-01' AND '1998-01-01' AND [Freight] < 100

--Return a list of company names and contact names of all the Owners from the Customer table from Mexico, Sweden and Germany.
select [CompanyName], [ContactName] 
from [dbo].[Customers]
where [Country] IN ('Mexico', 'Sweden', 'Germany')

--Return a count of the number of discontinued products in the Products table.
select COUNT ([Discontinued])
from [dbo].[Products]

--Return a list of category names and descriptions of all categories beginning with 'Co' from the Categories table.
select [CategoryName], [Description]
from [dbo].[Categories]
where [CategoryName] LIKE 'Co%' OR [Description] LIKE 'Co%'

--Return all the company names, city, country and postal code from the Suppliers table with the word 'rue' in their address. The list should ordered alphabetically by company name.
select [CompanyName], [City], [Country], [PostalCode]
from [dbo].[Suppliers]
where [Address] LIKE '%rue%'
order by [CompanyName]

--Return the product id and the total quantities ordered for each product id in the Order Details table.
select [ProductID], [Quantity]
from [dbo].[Order Details]


--Return the customer name and customer address of all customers with orders that shipped using Speedy Express.
select [ContactName], [Address]
from [dbo].[Customers], [dbo].[Orders]
where [Orders].[ShipVia] = 1

--Return a list of Suppliers containing company name, contact name, contact title and region description.
select [CompanyName], [ContactName], [ContactTitle], [Region]
from [dbo].[Suppliers]

--Return all product names from the Products table that are condiments.
select [ProductName]
from [dbo].[Products]
where [CategoryID] = 2

--Return a list of customer names who have no orders in the Orders table.
select [ContactName]
from [dbo].[Customers]
where [Customers].[CustomerID] NOT IN (select CustomerID from Orders)

--Add a shipper named 'Amazon' to the Shippers table using SQL.
insert into [dbo].[Shippers] 
(CompanyName) values ('Amazon')

--Change the company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL.
update [dbo].[Shippers]
set [CompanyName] = 'Amazon Prime Shipping'
where [CompanyName] = ('Amazon')

--Return a complete list of company names from the Shippers table. Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders.
select [Shippers].[CompanyName], format(round(sum(Orders.Freight), 0), 'C') AS [FreightTotals] FROM [Orders]
LEFT JOIN [Shippers] 
on [Orders].[ShipVia] = [Shippers].[ShipperID]
group by [CompanyName];

--Return all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'. The combined format should be 'LastName, FirstName'.
select [LastName] +  ', ' + [FirstName] as 'DisplayName'
from [dbo].[Employees]

--Add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread'
insert into [Customers] (CustomerID, CompanyName, ContactName)
values ('JSFRI', 'FreshCo','Jesse')
insert into [Orders] (CustomerID, ShipName)
values ('JSFRI', 'Grandma''s Boysenberry Spread')

--Remove yourself and your order from the database.
delete from [Customers]
where [CustomerID] = 'JSFRI'
delete from [Orders]
where [CustomerID] = 'JSFRI'

--Return a list of products from the Products table along with the total units in stock for each product. Include only products with TotalUnits greater than 100.
select [ProductName], sum(UnitsInStock)
from [Products]
group by [ProductName]
having sum (UnitsInStock) > 100


--SQL Excersizes completed by Jesse Friedner














 


