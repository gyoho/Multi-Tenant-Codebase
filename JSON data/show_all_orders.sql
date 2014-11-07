
select Orders.OrderID, Orders.OrderDate, Customers.*, Employees.*, Shippers.*,
			OrderDetails.OrderDetailID, Products.ProductID, Products.ProductName, Suppliers.*, Categories.*, Products.Unit, Products.Price, OrderDetails.Quantity
from Orders
	join Customers
		on Orders.CustomerID = Customers.CustomerID
	join Employees
		on Orders.EmployeeID = Employees.EmployeeID
	join Shippers
		on Orders.ShipperID = Shippers.ShipperID
	join OrderDetails
		on Orders.OrderID = OrderDetails.OrderID
	join Products
		on OrderDetails.ProductID = Products.ProductID
	join Suppliers
		on Products.SupplierID = Suppliers.SupplierID
	join Categories
		on Products.CategoryID = Categories.CategoryID;