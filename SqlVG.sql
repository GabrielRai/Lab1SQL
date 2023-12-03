SELECT 
Shop.store_name as [StoreName],
Employees.first_name + ' ' + Employees.last_name AS [Manager],
	COUNT(CustomerOrder.order_id) AS [TotalOrders],
	SUM(Book.book_price) AS [TotalSales_$],
	AVG(Book.book_price) AS [AVGSumPerOrder]
FROM Shop

JOIN Employees ON Employees.emp_id = Shop.store_id

JOIN CustomerOrder ON CustomerOrder.emp_id = Employees.emp_id

JOIN Book ON Book.isbn = CustomerOrder.isbn


	GROUP BY 
    Shop.store_name, Shop.store_town, Employees.first_name, Employees.last_name;

	