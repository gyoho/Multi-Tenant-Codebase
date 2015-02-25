select orderID, customerID, count(*)
from orders
where orders.OrderID>=10248 and orders.OrderID<10268
Group BY customerID
Order by OrderID;



#4 A Query that uses an "Aggregate Function"  with "Group By" Clause.
select customerID, count(*)
from orders
where orders.OrderID>=10248 and orders.OrderID<10268
Group BY customerID
ORDER BY customerID;




SELECT Employees.EmployeeID, Employees.LastName
FROM Employees, Orders
Where Employees.EmployeeID=Orders.EmployeeID
		and Orders.OrderID>=10248
		and Orders.OrderID<=10250
ORDER BY LastName

