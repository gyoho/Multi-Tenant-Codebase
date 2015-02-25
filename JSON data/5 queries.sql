

#1 A Query that uses a Where Clause with "AND" and "OR" operators.

select Orders.OrderID, Orders.OrderDate, Shippers.ShipperName
from Orders join Shippers
	on Orders.ShipperID = Shippers.ShipperID
where Orders.OrderDate = '1996-7-22 00:00:00'
	or Orders.OrderDate = '1996-7-25 00:00:00'
	and Shippers.ShipperName = "Federal Shipping"
	and Orders.OrderID between 10262 and 10267;



#2 A Query on Orders that Joins Orders, OrderDetails, Customers and Products

select Orders.OrderID, Customers.City, Products.Price, OrderDetails.Quantity
from Orders
	join Customers
		on Orders.CustomerID = Customers.CustomerID
	join OrderDetails
		on Orders.OrderID = OrderDetails.OrderID
	join Products
		on OrderDetails.ProductID = Products.ProductID
where Customers.City = "Graz" and Products.Price >= 20 and OrderDetails.Quantity > 50
	and Orders.OrderID between 10262 and 10267;



#3 A Query that uses the Order By Clause in Ascending Order.

select Employees.EmployeeID, Employees.LastName, Employees.FirstName
from Orders join Employees on Orders.EmployeeID = Employees.EmployeeID
where Orders.OrderID between 10262 and 10267
order by Employees.LastName, Employees.FirstName;


#4 A Query that uses an "Aggregate Function" with "Group By" Clause.

select Categories.Categoryname, count(*)
from Orders
	join OrderDetails
		on Orders.OrderID = OrderDetails.OrderID
	join Products
		on OrderDetails.ProductID = Products.ProductID
	join Categories
		on Products.CategoryID = Categories.CategoryID
where Orders.OrderID between 10262 and 10267
group by Categories.Categoryname;



#5 A Query that uses an "Aggregate Function"  with "Group By" and "Having" Clauses.

select Categories.Categoryname, count(*)
from Orders
	join OrderDetails
		on Orders.OrderID = OrderDetails.OrderID
	join Products
		on OrderDetails.ProductID = Products.ProductID
	join Categories
		on Products.CategoryID = Categories.CategoryID
where Orders.OrderID between 10262 and 10267
group by Categories.Categoryname
having count(Categories.Categoryname) > 2;
