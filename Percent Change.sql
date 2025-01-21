CREATE TABLE sales_data (
    year INT,
    quarter INT,
    month VARCHAR(20),
    item CHAR(1),
    sales INT,
    quantity INT,
    month_number INT
);

INSERT INTO sales_data (year, quarter, month, item, sales, quantity, month_number) VALUES
(2011, 1, 'January', 'a', 4250, 85000, 1),
(2011, 1, 'February', 'a', 4600, 92000, 2),
(2011, 1, 'March', 'a', 3700, 74000, 3),
(2011, 2, 'April', 'a', 4215, 84300, 4),
(2011, 2, 'May', 'a', 5120, 102400, 5),
(2011, 2, 'June', 'a', 5010, 100200, 6),
(2011, 3, 'July', 'a', 4690, 93800, 7),
(2011, 3, 'August', 'a', 4900, 98000, 8),
(2011, 3, 'September', 'a', 5400, 108000, 9),
(2011, 4, 'October', 'a', 5820, 116400, 10),
(2011, 4, 'November', 'a', 5900, 118000, 11),
(2011, 4, 'December', 'a', 5730, 114600, 12),
(2011, 1, 'January', 'b', 1417, 35417, 1),
(2011, 1, 'February', 'b', 1533, 38333, 2),
(2011, 1, 'March', 'b', 1233, 30833, 3),
(2011, 2, 'April', 'b', 1405, 35125, 4),
(2011, 2, 'May', 'b', 1707, 42667, 5),
(2011, 2, 'June', 'b', 1670, 41750, 6),
(2011, 3, 'July', 'b', 1563, 39083, 7),
(2011, 3, 'August', 'b', 1633, 40833, 8),
(2011, 3, 'September', 'b', 1800, 45000, 9),
(2011, 4, 'October', 'b', 1940, 48500, 10),
(2011, 4, 'November', 'b', 1967, 49167, 11),
(2011, 4, 'December', 'b', 1910, 47750, 12);

-- % Change

select *, ROUND((sales - lag(sales) over (PARTITION BY item))/(lag(sales) over (PARTITION BY item))*100,2) as "% Change"
from sales_data;