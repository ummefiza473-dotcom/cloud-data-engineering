-- ============================================================
--  RETAILMART — SQL CAPSTONE PROJECT
--  Industry : Retail (3-store chain)
--  Duration : 3 Hours
--  Covers   : DDL, DML, SELECT, JOINs, GROUP BY, ROLLUP, CUBE,
--             GROUPING SETS, Subqueries, EXISTS/ANY/ALL,
--             UNION/INTERSECT/EXCEPT, CTEs, Recursive CTEs,
--             Window Functions, PIVOT, Views, Indexes,
--             Stored Procedures, Error Handling, Transactions
-- ============================================================
--  STORY:
--  You are a data analyst at RetailMart — a retail chain with
--  3 stores across Pakistan. Your job is to build their
--  database from scratch and answer key business questions.
-- ============================================================


-- ============================================================
--  HOUR 1 — BUILD & LOAD
-- ============================================================

-- ============================================================
--  TASK 1: DDL — Create the schema
-- ============================================================

-- ============================================================
--  RETAILMART — CREATE TABLES PRACTICE
--  Task: Fill in the blanks to complete each CREATE TABLE.
--  Table names, column names, and hints are given.
--  You must choose the correct data type and constraints.
-- ============================================================
--  DATA TYPES TO CHOOSE FROM:
--    INT, VARCHAR(n), CHAR(n), DECIMAL(10,2), DATE
--
--  CONSTRAINTS TO CHOOSE FROM:
--    PRIMARY KEY, IDENTITY(1,1), NOT NULL, UNIQUE,
--    DEFAULT, CHECK, REFERENCES
-- ============================================================


-- ============================================================
--  TABLE 1: categories
--  Stores product categories like Electronics, Clothing, etc.
-- ============================================================

CREATE TABLE retailmart.categories (

    category_id     ___________  ___________  ___________,
    --              data type    primary key  auto-increment

    category_name   ___________  ___________
    --              data type    cannot be empty
);


-- ============================================================
--  TABLE 2: products
--  Stores all products sold at RetailMart.
-- ============================================================

CREATE TABLE retailmart.products (

    product_id      ___________  ___________  ___________,
    --              data type    primary key  auto-increment

    product_name    ___________  ___________,
    --              data type    cannot be empty

    category_id     ___________  ___________  _________________________,
    --              data type    cannot be    links to categories table
    --                           empty

    price           ___________  ___________  ___________,
    --              decimal type cannot be    must be greater than 0
    --                           empty

    stock_qty       ___________  ___________  ___________
    --              data type    cannot be    default value = 0
    --                           empty
);


-- ============================================================
--  TABLE 3: stores
--  The 3 RetailMart store locations.
-- ============================================================

CREATE TABLE retailmart.stores (

    store_id        ___________  ___________  ___________,
    --              data type    primary key  auto-increment

    store_name      ___________  ___________,
    --              data type    cannot be empty

    city            ___________  ___________
    --              data type    cannot be empty
);


-- ============================================================
--  TABLE 4: customers
--  Registered customers of RetailMart.
-- ============================================================

CREATE TABLE retailmart.customers (

    customer_id     ___________  ___________  ___________,
    --              data type    primary key  auto-increment

    full_name       ___________  ___________,
    --              data type    cannot be empty

    email           ___________  ___________  ___________,
    --              data type    cannot be    no two customers
    --                           empty        can share email

    city            ___________,
    --              data type (nullable - customer may not provide city)

    gender          ___________  ___________
    --              single char  only 'M' or 'F' allowed
);


-- ============================================================
--  TABLE 5: orders
--  Each row = one order placed by a customer at a store.
-- ============================================================

CREATE TABLE retailmart.orders (

    order_id        ___________  ___________  ___________,
    --              data type    primary key  auto-increment

    store_id        ___________  ___________  _________________________,
    --              data type    cannot be    links to stores table
    --                           empty

    customer_id     ___________  ___________  _________________________,
    --              data type    cannot be    links to customers table
    --                           empty

    order_date      ___________  ___________  ___________,
    --              date type    cannot be    default = today's date
    --                           empty        (hint: use GETDATE())

    status          ___________  ___________  ___________  ___________
    --              data type    cannot be    default =    only allow:
    --                           empty        'Pending'    'Pending'
    --                                                     'Shipped'
    --                                                     'Delivered'
    --                                                     'Cancelled'
);


-- ============================================================
--  TABLE 6: order_items
--  Each row = one product line inside an order.
--  One order can have multiple items.
-- ============================================================

CREATE TABLE retailmart.order_items (

    item_id         ___________  ___________  ___________,
    --              data type    primary key  auto-increment

    order_id        ___________  ___________  _________________________,
    --              data type    cannot be    links to orders table
    --                           empty

    product_id      ___________  ___________  _________________________,
    --              data type    cannot be    links to products table
    --                           empty

    quantity        ___________  ___________  ___________,
    --              data type    cannot be    must be greater than 0
    --                           empty

    unit_price      ___________  ___________
    --              decimal type cannot be empty
);


--  END OF EXERCISE
-- ============================================================

-- ============================================================
--  TASK 2: DML — INSERT, UPDATE, DELETE, MERGE
-- ============================================================

-- INSERT categories
INSERT INTO retailmart.categories (category_name) VALUES
('Electronics'), ('Clothing'), ('Groceries'), ('Accessories'), ('Home Appliances');

-- INSERT products
INSERT INTO retailmart.products (product_name, category_id, price, stock_qty) VALUES
('Samsung 4K TV',        1,  85000, 15),
('iPhone 15',            1, 295000, 10),
('Wireless Earbuds',     4,   4500, 80),
('Leather Jacket',       2,   8500, 40),
('Linen Shirt',          2,   2200, 60),
('Rice 5kg',             3,    950, 200),
('Cooking Oil 3L',       3,    750, 150),
('Sunglasses',           4,   1800, 55),
('Microwave Oven',       5,  18000, 20),
('Electric Kettle',      5,   3200, 35);

-- INSERT stores
INSERT INTO retailmart.stores (store_name, city) VALUES
('RetailMart Karachi',   'Karachi'),
('RetailMart Lahore',    'Lahore'),
('RetailMart Islamabad', 'Islamabad');

-- INSERT customers
INSERT INTO retailmart.customers (full_name, email, city, gender) VALUES
('Ahmed Khan',      'ahmed@gmail.com',   'Karachi',   'M'),
('Sara Malik',      'sara@gmail.com',    'Lahore',    'F'),
('Bilal Hussain',   'bilal@gmail.com',   'Islamabad', 'M'),
('Fatima Nawaz',    'fatima@gmail.com',  'Karachi',   'F'),
('Omar Sheikh',     'omar@gmail.com',    'Lahore',    'M'),
('Nadia Ali',       'nadia@gmail.com',   'Islamabad', 'F'),
('Hamza Raza',      'hamza@gmail.com',   'Karachi',   'M'),
('Zara Qureshi',    'zara@gmail.com',    'Lahore',    'F');

-- INSERT orders
INSERT INTO retailmart.orders (store_id, customer_id, order_date, status) VALUES
(1, 1, '2024-01-10', 'Delivered'),
(1, 4, '2024-01-15', 'Delivered'),
(2, 2, '2024-02-03', 'Delivered'),
(2, 5, '2024-02-20', 'Shipped'),
(3, 3, '2024-03-05', 'Delivered'),
(3, 6, '2024-03-18', 'Pending'),
(1, 7, '2024-04-01', 'Delivered'),
(2, 8, '2024-04-22', 'Cancelled'),
(1, 1, '2024-05-10', 'Delivered'),
(3, 3, '2024-06-01', 'Shipped');

-- INSERT order items
INSERT INTO retailmart.order_items (order_id, product_id, quantity, unit_price) VALUES
(1,  2,  1, 295000),
(1,  3,  2,   4500),
(2,  4,  1,   8500),
(3,  5,  3,   2200),
(3,  8,  1,   1800),
(4,  1,  1,  85000),
(5,  9,  1,  18000),
(5, 10,  2,   3200),
(6,  6,  4,    950),
(7,  3,  1,   4500),
(8,  2,  1, 295000),
(9,  4,  2,   8500),
(10, 9,  1,  18000);

-- UPDATE: Reduce price of Electric Kettle by 10%
UPDATE retailmart.products
SET price = price * 0.90
WHERE product_id = 10;

-- DELETE: Remove the cancelled order's items and the order itself
DELETE FROM retailmart.order_items WHERE order_id = 8;
DELETE FROM retailmart.orders       WHERE order_id = 8;


-- ============================================================
--  HOUR 2 — QUERY & ANALYZE
-- ============================================================

-- ============================================================
--  TASK 3: SELECT, filtering, sorting
-- ============================================================

-- All products under Rs. 5,000
SELECT product_name, price
FROM retailmart.products
WHERE price < 5000
ORDER BY price ASC;

-- Customers from Karachi
SELECT full_name, email, city
FROM retailmart.customers
WHERE city = 'Karachi'
ORDER BY full_name;

-- Orders placed in 2024 sorted by date descending
SELECT o.order_id, c.full_name, o.order_date, o.status
FROM retailmart.orders o
JOIN retailmart.customers c ON o.customer_id = c.customer_id
WHERE YEAR(o.order_date) = 2024
ORDER BY o.order_date DESC;


-- ============================================================
--  TASK 4: JOINs — INNER, LEFT, RIGHT
-- ============================================================

-- INNER JOIN: Orders with customer name and product details
SELECT
    o.order_id,
    c.full_name       AS customer_name,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    oi.quantity * oi.unit_price AS line_total
FROM retailmart.orders      o
INNER JOIN retailmart.customers   c  ON o.customer_id  = c.customer_id
INNER JOIN retailmart.order_items oi ON o.order_id     = oi.order_id
INNER JOIN retailmart.products    p  ON oi.product_id  = p.product_id;

-- LEFT JOIN: All customers including those with no orders
SELECT
    c.full_name,
    c.city,
    COUNT(o.order_id) AS total_orders
FROM retailmart.customers c
LEFT JOIN retailmart.orders o ON c.customer_id = o.customer_id
GROUP BY c.full_name, c.city
ORDER BY total_orders DESC;

-- RIGHT JOIN: All products including those never ordered
SELECT
    p.product_name,
    p.price,
    SUM(oi.quantity) AS total_sold
FROM retailmart.order_items oi
RIGHT JOIN retailmart.products p ON oi.product_id = p.product_id
GROUP BY p.product_name, p.price
ORDER BY total_sold DESC;


-- ============================================================
--  TASK 5: GROUP BY + CASE
-- ============================================================

-- Total revenue by store and category with ROLLUP subtotals
SELECT
    ISNULL(s.store_name,  'ALL STORES')    AS store,
    ISNULL(cat.category_name, 'ALL CATEGORIES') AS category,
    SUM(oi.quantity * oi.unit_price)        AS revenue
FROM retailmart.orders      o
JOIN retailmart.stores      s   ON o.store_id   = s.store_id
JOIN retailmart.order_items oi  ON o.order_id   = oi.order_id
JOIN retailmart.products    p   ON oi.product_id = p.product_id
JOIN retailmart.categories  cat ON p.category_id = cat.category_id
GROUP BY s.store_name, cat.category_name
ORDER BY store, category;

-- Label each product as Budget / Mid-range / Premium using CASE
SELECT
    product_name,
    price,
    CASE
        WHEN price < 3000   THEN 'Budget'
        WHEN price < 20000  THEN 'Mid-range'
        ELSE                     'Premium'
    END AS price_tier
FROM retailmart.products
ORDER BY price;



-- ============================================================
--  TASK 7: Subqueries 
-- ============================================================

-- Customers who have placed at least one order (EXISTS)
SELECT full_name, email, city
FROM retailmart.customers c
WHERE EXISTS (
    SELECT 1 FROM retailmart.orders o
    WHERE o.customer_id = c.customer_id
);


-- Orders where the total exceeds the average order value (subquery in WHERE)
SELECT order_id, total
FROM (
    SELECT order_id, SUM(quantity * unit_price) AS total
    FROM retailmart.order_items
    GROUP BY order_id
) AS order_totals
WHERE total > (
    SELECT AVG(order_total)
    FROM (
        SELECT order_id, SUM(quantity * unit_price) AS order_total
        FROM retailmart.order_items
        GROUP BY order_id
    ) AS avg_base
);


-- ============================================================
--  TASK 8: Set operators — UNION, INTERSECT, EXCEPT
-- ============================================================

-- UNION: All unique cities where we have customers OR stores
SELECT city AS location, 'Customer city' AS source
FROM retailmart.customers
UNION
SELECT city, 'Store city'
FROM retailmart.stores
ORDER BY location;

-- INTERSECT: Customers who ordered from BOTH store 1 AND store 2
SELECT customer_id FROM retailmart.orders WHERE store_id = 1
INTERSECT
SELECT customer_id FROM retailmart.orders WHERE store_id = 2;

-- EXCEPT: Customers who have NEVER placed an order
SELECT customer_id FROM retailmart.customers
EXCEPT
SELECT DISTINCT customer_id FROM retailmart.orders;


-- ============================================================
--  HOUR 3 — ADVANCED & AUTOMATE
-- ============================================================

-- ============================================================
--  TASK 9: CTEs + Recursive CTE
-- ============================================================

-- Regular CTE: Top 5 customers by total spend
WITH customer_spend AS (
    SELECT
        c.customer_id,
        c.full_name,
        SUM(oi.quantity * oi.unit_price) AS total_spend
    FROM retailmart.customers c
    JOIN retailmart.orders      o  ON c.customer_id  = o.customer_id
    JOIN retailmart.order_items oi ON o.order_id     = oi.order_id
    GROUP BY c.customer_id, c.full_name
)
SELECT TOP 5
    full_name,
    total_spend,
    RANK() OVER (ORDER BY total_spend DESC) AS spend_rank
FROM customer_spend
ORDER BY total_spend DESC;

-- Recursive CTE: Generate months from Jan 2024 to Dec 2024
WITH months AS (
    SELECT CAST('2024-01-01' AS DATE) AS month_start
    UNION ALL
    SELECT DATEADD(MONTH, 1, month_start)
    FROM months
    WHERE month_start < '2024-12-01'
)
SELECT
    month_start,
    FORMAT(month_start, 'MMMM yyyy') AS month_name
FROM months;


-- ============================================================
--  TASK 10: Window functions
-- ============================================================

-- ROW_NUMBER and RANK: Products ranked by revenue
SELECT
    p.product_name,
    SUM(oi.quantity * oi.unit_price)                            AS revenue,
    ROW_NUMBER() OVER (ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS row_num,
    RANK()       OVER (ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS revenue_rank
FROM retailmart.order_items oi
JOIN retailmart.products    p ON oi.product_id = p.product_id
GROUP BY p.product_name;


-- Running total of revenue by store
SELECT
    s.store_name,
    FORMAT(o.order_date, 'yyyy-MM')         AS month,
    SUM(oi.quantity * oi.unit_price)         AS monthly_revenue,
    SUM(SUM(oi.quantity * oi.unit_price))
        OVER (PARTITION BY s.store_name
              ORDER BY FORMAT(o.order_date,'yyyy-MM')
            )      AS running_total
FROM retailmart.orders      o
JOIN retailmart.stores      s  ON o.store_id    = s.store_id
JOIN retailmart.order_items oi ON o.order_id    = oi.order_id
GROUP BY s.store_name, FORMAT(o.order_date, 'yyyy-MM')
ORDER BY s.store_name, month;



-- ============================================================
--  TASK 12: Views
-- ============================================================

-- Standard view: Order summary
CREATE VIEW retailmart.vw_OrderSummary AS
SELECT
    o.order_id,
    o.order_date,
    o.status,
    s.store_name,
    c.full_name        AS customer_name,
    c.city             AS customer_city,
    p.product_name,
    cat.category_name,
    oi.quantity,
    oi.unit_price,
    oi.quantity * oi.unit_price AS line_total
FROM retailmart.orders      o
JOIN retailmart.stores      s   ON o.store_id    = s.store_id
JOIN retailmart.customers   c   ON o.customer_id = c.customer_id
JOIN retailmart.order_items oi  ON o.order_id    = oi.order_id
JOIN retailmart.products    p   ON oi.product_id = p.product_id
JOIN retailmart.categories  cat ON p.category_id = cat.category_id;

-- Use the view
SELECT store_name, SUM(line_total) AS total_revenue
FROM retailmart.vw_OrderSummary
GROUP BY store_name
ORDER BY total_revenue DESC;

-- Indexed (materialized) view: Store revenue totals
-- Note: Requires SCHEMABINDING + unique clustered index
CREATE VIEW retailmart.vw_StoreRevenue
SELECT
    o.store_id,
    COUNT(*)                             AS order_count,
    SUM(oi.quantity * oi.unit_price)         AS total_revenue
FROM retailmart.orders      o
JOIN retailmart.order_items oi ON o.order_id = oi.order_id
GROUP BY o.store_id;

CREATE UNIQUE CLUSTERED INDEX idx_vw_StoreRevenue
ON retailmart.vw_StoreRevenue(store_id);


-- ============================================================
--  TASK 13: Indexes
-- ============================================================

-- Composite index: Speed up queries filtering by customer + date
CREATE INDEX idx_orders_customer_date
ON retailmart.orders(customer_id, order_date);

-- Filtered index: Only index Pending orders (partial index)
CREATE INDEX idx_orders_pending
ON retailmart.orders(order_date, store_id)
WHERE status = 'Pending';

-- Non-clustered index on customer email for fast lookups
CREATE INDEX idx_customers_email
ON retailmart.customers(email);

-- Verify indexes
EXEC sp_helpindex 'retailmart.orders';
EXEC sp_helpindex 'retailmart.customers';


-- ============================================================
--  TASK 14: Stored Procedures + Error Handling
-- ============================================================

-- Procedure 1: Place an order with stock check + TRY/CATCH + TRANSACTION
CREATE PROCEDURE retailmart.sp_PlaceOrder
    @CustomerID INT,
    @StoreID    INT,
    @ProductID  INT,
    @Quantity   INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CurrentStock INT;
    DECLARE @Price        DECIMAL(10,2);
    DECLARE @NewOrderID   INT;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Get current stock and price
        SELECT @CurrentStock = stock_qty, @Price = price
        FROM retailmart.products
        WHERE product_id = @ProductID;

        -- Check if product exists
        IF @CurrentStock IS NULL
        BEGIN
            RAISERROR('Product not found.', 16, 1);
            RETURN;
        END

        -- Check if enough stock is available
        IF @CurrentStock < @Quantity
        BEGIN
            RAISERROR('Not enough stock. Available: %d, Requested: %d', 16, 1,
                      @CurrentStock, @Quantity);
            RETURN;
        END

        -- Insert the order
        INSERT INTO retailmart.orders (store_id, customer_id, order_date, status)
        VALUES (@StoreID, @CustomerID, GETDATE(), 'Pending');

        SET @NewOrderID = SCOPE_IDENTITY();

        -- Insert order item
        INSERT INTO retailmart.order_items (order_id, product_id, quantity, unit_price)
        VALUES (@NewOrderID, @ProductID, @Quantity, @Price);

        -- Deduct stock
        UPDATE retailmart.products
        SET stock_qty = stock_qty - @Quantity
        WHERE product_id = @ProductID;

        COMMIT TRANSACTION;

        SELECT 'Order placed successfully' AS Message,
               @NewOrderID                AS NewOrderID;

    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SELECT
            ERROR_NUMBER()  AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

-- Test: Valid order
EXEC retailmart.sp_PlaceOrder
    @CustomerID = 1,
    @StoreID    = 1,
    @ProductID  = 6,
    @Quantity   = 5;

-- Test: Should fail — not enough stock
EXEC retailmart.sp_PlaceOrder
    @CustomerID = 1,
    @StoreID    = 1,
    @ProductID  = 2,
    @Quantity   = 999;


-- Procedure 2: Monthly sales report for a store
CREATE PROCEDURE retailmart.sp_MonthlySalesReport
    @StoreID INT,
    @Year    INT = 2024
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM retailmart.stores WHERE store_id = @StoreID)
    BEGIN
        SELECT 'Store not found' AS Message;
        RETURN;
    END

    SELECT
        FORMAT(o.order_date, 'yyyy-MM')         AS month,
        COUNT(DISTINCT o.order_id)               AS total_orders,
        SUM(oi.quantity)                         AS units_sold,
        SUM(oi.quantity * oi.unit_price)         AS revenue,
        SUM(SUM(oi.quantity * oi.unit_price))
            OVER (ORDER BY FORMAT(o.order_date,'yyyy-MM')
                  ROWS UNBOUNDED PRECEDING)      AS running_total
    FROM retailmart.orders      o
    JOIN retailmart.order_items oi ON o.order_id = oi.order_id
    WHERE o.store_id = @StoreID
      AND YEAR(o.order_date) = @Year
    GROUP BY FORMAT(o.order_date, 'yyyy-MM')
    ORDER BY month;
END;

-- Test the report for Store 1 (Karachi)
EXEC retailmart.sp_MonthlySalesReport @StoreID = 1, @Year = 2024;

-- Test with default year
EXEC retailmart.sp_MonthlySalesReport @StoreID = 2;


-- ============================================================
--  END OF CAPSTONE PROJECT
-- ============================================================
-- Congratulations! You have covered:
--  DDL         CREATE TABLE, constraints, data types
--  DML         INSERT, UPDATE, DELETE, MERGE
--  Querying    SELECT, WHERE, ORDER BY
--  Joins       INNER, LEFT, RIGHT
--  Aggregation GROUP BY, ROLLUP, CUBE, GROUPING SETS
--  CASE        Price tier labelling
--  Subqueries  Inline, EXISTS, ALL
--  Set ops     UNION, INTERSECT, EXCEPT
--  CTEs        Regular + Recursive
--  Windows     ROW_NUMBER, RANK, LAG, LEAD, FIRST_VALUE, SUM OVER
--  PIVOT       Monthly revenue matrix
--  Views       Standard + Indexed
--  Indexes     Composite, Filtered, Non-clustered
--  Procedures  Parameters, defaults, TRY/CATCH, TRANSACTION
-- ============================================================