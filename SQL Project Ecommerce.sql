


----Questions--------

--Q1 Find the Top 3 restaurants for each cuisine type based on the number of orders, without using TOP or LIMIT.

WITH cte AS
(
    SELECT
        Cuisine,
        Restaurant_id,
        COUNT(*) AS no_of_orders
    FROM orders
    GROUP BY Cuisine, Restaurant_id
)

SELECT *
FROM
(
    SELECT *,
           ROW_NUMBER() OVER
           (
               PARTITION BY Cuisine
               ORDER BY no_of_orders DESC
           ) AS rn
    FROM cte
) a
WHERE rn <= 3;


----Q2--Find the daily number of new customers acquired. A customer is considered new on the date they place their first order.

WITH cte AS
(
    SELECT
        Customer_code,
        CAST(MIN(placed_at) AS DATE) AS first_order_date
    FROM orders
    GROUP BY Customer_code
)

SELECT
    first_order_date,
    COUNT(*) AS no_of_new_customers
FROM cte
GROUP BY first_order_date
ORDER BY first_order_date;


---Q3--Find all customers who were acquired in January 2025, placed exactly one order in January 2025, and did not place any other orders .

SELECT
    Customer_code,
    COUNT(*) AS no_of_orders
FROM orders
WHERE MONTH(placed_at) = 1
  AND YEAR(placed_at) = 2025
  AND Customer_code NOT IN
(
    SELECT DISTINCT Customer_code
    FROM orders
    WHERE NOT (MONTH(placed_at) = 1
           AND YEAR(placed_at) = 2025)
)
GROUP BY Customer_code
HAVING COUNT(*) = 1;

---Q4--List all customers who have not placed any orders in the last 7 days but were acquired within the last month using a promotional code on their first order.

WITH cte AS
(
    SELECT
        Customer_code,
        MIN(placed_at) AS first_order_date,
        MAX(placed_at) AS latest_order_date
    FROM orders
    GROUP BY Customer_code
)

SELECT
    cte.*,
    orders.Promo_code_Name AS first_order_promo
FROM cte
INNER JOIN orders
    ON cte.Customer_code = orders.Customer_code
   AND cte.first_order_date = orders.Placed_at
WHERE latest_order_date < DATEADD(DAY, -7, GETDATE())
  AND first_order_date < DATEADD(MONTH, -1, GETDATE())
  AND orders.Promo_code_Name IS NOT NULL;

  ----Q5--The Growth team wants to send a personalized communication to customers after every third order. Write a query to identify customers who are placing their 3rd, 6th, 9th, etc., order today.

 WITH cte AS
(
    SELECT *,
           ROW_NUMBER() OVER
           (
               PARTITION BY customer_code
               ORDER BY placed_at
           ) AS order_number
    FROM orders
)
SELECT *
FROM cte
WHERE order_number % 3 = 0;

-----Q6---"Find customers who placed more than one order and all of their orders used a promo code."

SELECT Customer_code,
       COUNT(*) AS no_of_orders,
       COUNT(Promo_code_Name) AS promo_orders
FROM orders
GROUP BY Customer_code
HAVING COUNT(*) > 1
   AND COUNT(*) = COUNT(Promo_code_Name);

----Q7---What percent of customers were organically acquired in January 2025?

---Organic customer = A customer whose first order was placed without using a promo code.

WITH cte AS
(
    SELECT *,
           ROW_NUMBER() OVER
           (
               PARTITION BY customer_code
               ORDER BY placed_at
           ) AS rn
    FROM orders
    WHERE MONTH(placed_at) = 1
)

SELECT
    COUNT(
        CASE
            WHEN rn = 1
             AND promo_code_name IS NULL
            THEN customer_code
        END
    ) * 100.0
    / COUNT(DISTINCT customer_code) AS organic_percentage
FROM cte;
