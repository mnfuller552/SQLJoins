/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT P.Name as ProductName, C.Name as Category From products as P
INNER JOIN Categories AS C ON C.CategoryID = P.CategoryID
WHERE C.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
select p.name, p.Price, r.Rating from products as p
INNER JOIN reviews as r on r.ProductID = p.ProductID
Where r.Rating = 5;

 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, Sum(s.Quantity) AS Total from sales as s
INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
Group BY e.EmployeeID
Order BY Total DESC
LIMIT 2;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name as 'Department Name' , c.name as 'Category Name' FROM departments as d
Inner join categories as c on c.DepartmentID = d.DepartmentID
Where c.Name = 'Appliances' or c.Name = 'Games';


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
Select p.Name, Sum(s.Quantity) as 'Total Sold', Sum(s.Quantity * s.PricePerUnit) as 'Total Price'
From Products as p
Inner Join sales as s on s.ProductID = p.ProductID
WHERE p.ProductID= 97;

select * from sales where productID= 97;


/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT p.Name, r.Reviewer, r.Rating, r.Comment
From products as p
INNER JOIN reviews as r on r.ProductID = p.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) as TotalSold
FROM Sales as s
INNER JOIN employees as e on e.EmployeeID = s.EmployeeID
INNER JOIN products as p on p.ProductID = s.ProductID
Group By e.EmployeeID, p.ProductID
ORDER BY e.FirstName;
