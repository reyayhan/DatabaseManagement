--1. Display the name and city of customers 
--who live in any city that makes 
--the most different kinds of products. 
--(There are two cities that make the most different products. Return the name and city of customers from either one of those.) 

	SELECT name, city
	  FROM customers
	  WHERE city in (SELECT city
                           FROM products
                       GROUP BY city
                       ORDER BY COUNT(products.city) DESC LIMIT 1);

--2. Display the names of products whose priceUSD is strictly below the average priceUSD, 
--in reverse-alphabetical order. 

	SELECT name, products.priceUSD
	  FROM products
	 WHERE products.priceUSD < (SELECT AVG(products.priceUSD)
                                     FROM products) ORDER BY name DESC;

--3. Display the customer name, pid ordered, 
--and the total for all orders, sorted by total from low to high.

	SELECT customers.name, orders.pid, orders.totalUSD
	  FROM orders INNER JOIN customers
            ON orders.cid = customers.cid ORDER BY orders.totalUSD ASC;

 
--4. Display all customer names (in alphabetical order) and their total ordered, 
--and nothing more. Use coalesce to avoid showing NULLs. 

	SELECT customers.name, COALESCE(SUM(orders.qty), 0) AS "total ordered"
	  FROM orders RIGHT OUTER JOIN customers
            ON orders.cid = customers.cid GROUP BY customers.name
      ORDER BY name ASC;


--5. Display the names of all customers who bought products from agents based in New York along with 
--the names of the products they ordered, and the names of the agents who sold it to them. 

	SELECT customers.name, products.name, agents.name
	  FROM orders INNER JOIN customers
	    ON orders.cid = customers.cid INNER JOIN products
	    ON orders.pid = products.pid INNER JOIN agents
	    ON orders.aid = agents.aid
	 WHERE agents.city = 'New York';

--6. Write a query to check the accuracy of the dollars column in the Orders table. 
--This means calculating Orders.totalUSD from data in other tables and comparing those values to the values in Orders.totalUSD. 
--Display all rows in Orders where Orders.totalUSD is incorrect, if any. 

	SELECT ((orders.qty * products.priceUSD) * (1 - (customers.discount / 100))) AS "dollar check", orders.totalUSD
	  FROM orders, customers, products
         WHERE orders.cid = customers.cid 
		AND orders.pid = products.pid 
		AND ((orders.qty * products.priceUSD) * (1 - (customers.discount / 100))) != orders.totalUSD;


-- 7. What’s the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN? Give example queries in SQL to demonstrate. 
--(Feel free to use the CAP database to make your points here.)

	SELECT customers.city, orders.aid
	  FROM orders LEFT OUTER JOIN customers
	    ON orders.cid = customers.cid;


	SELECT customers.city, orders.aid
          FROM orders RIGHT OUTER JOIN customers
            ON orders.cid = customers.cid;

/*
	The difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN is that whichever item is chosen to be selected first represents 
	the right column of the outer join function while the second item (and items following the second item) represents the left-hand 
	columns. For a left outer join in the particular example above, all the aid (agent ids) values are listed but not all the cities 
	of the customers although we are asking for those cities as well in the select portion of the query. This is because the left column 
	is used as the reference in a left outer join while the right column is meant to provide corresponding data in relation to the cities
	of the customers. In a right outer join, however, this concept now applies to the right column where the cities of the customers are 
	used as a reference while the corresponding aid values are included. Because there is a city that a customer is from but an agents is
	not from, there becomes a NULL value that is shown as a blank entry in the table. NULL values exists in both left and right outer joins
	but is dependent on the data and what values are able to correspond to other values in a table.
*/
