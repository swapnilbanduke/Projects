SELECT * FROM SALES;

-- FEATURE ENGINEERING

SELECT TIME,
CASE
WHEN TIME BETWEEN '00:00:00' AND '12:00:00' THEN 'MORNING' 
WHEN TIME BETWEEN '12:00:01' AND '17:00:00' THEN 'AFTERNOON'
ELSE 'EVENING'
END AS TIME_OF_DATE

FROM SALES;

ALTER TABLE SALES ADD COLUMN TIME_OF_DAY VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;

UPDATE sales
SET TIME_OF_DAY=(
CASE
WHEN TIME BETWEEN '00:00:00' AND '12:00:00' THEN 'MORNING' 
WHEN TIME BETWEEN '12:00:01' AND '17:00:00' THEN 'AFTERNOON'
ELSE 'EVENING'
END
);


-- ----DAY NAME

SELECT DATE,
DAYNAME(DATE) AS DAY
 FROM SALES;
 
 ALTER TABLE SALES ADD COLUMN DAY_NAME VARCHAR(10);
 
 UPDATE sales
 SET DAY_NAME=DAYNAME(DATE);
 
 -- MONTH NAME
 
 SELECT DATE, MONTHNAME(DATE) FROM SALES;
ALTER TABLE SALES ADD COLUMN MONTH_NAME VARCHAR(10);
UPDATE SALES 
SET MONTH_NAME=MONTHNAME(DATE);


-- GENERIC QUESTIONS

-- How many unique cities does the data have?
SELECT COUNT(DISTINCT CITY) FROM SALES;

-- In which city is each branch?
SELECT DISTINCT BRANCH, CITY FROM SALES;


-- --------------------------------------------------------------------
-- ---------------------------- Product -------------------------------
-- --------------------------------------------------------------------

-- How many unique product lines does the data have?
SELECT COUNT(DISTINCT PRODUCT_LINE) FROM SALES;

-- What is the most selling product line?
-- 971	Electronic accessories
SELECT SUM(QUANTITY) AS QTY, PRODUCT_LINE FROM SALES
GROUP BY PRODUCT_LINE
ORDER BY QTY DESC;

-- What is the total revenue by month?
-- 109455.5070	March
-- 116291.8680	January
-- 97219.3740	February
SELECT SUM(TOTAL), MONTH_NAME FROM sales
GROUP BY MONTH_NAME;

-- What month had the largest COGS?

SELECT SUM(COGS) AS SUM,MONTH_NAME FROM sales
GROUP BY MONTH_NAME
ORDER BY SUM DESC;

-- What product line had the largest revenue?
SELECT SUM(TOTAL) AS TOTAL, PRODUCT_LINE FROM sales
GROUP BY PRODUCT_LINE
ORDER BY TOTAL DESC;

-- What is the city with the largest revenue?

SELECT SUM(TOTAL) AS TOTAL, CITY FROM sales
GROUP BY CITY
ORDER BY TOTAL;

-- What product line had the largest VAT?
-- Health and beauty
SELECT SUM(Tax_PCT) AS SUM, PRODUCT_LINE FROM SALES
GROUP BY PRODUCT_LINE
ORDER BY SUM;

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales

SELECT 
	AVG(quantity) AS avg_qnty
FROM sales;

SELECT
	product_line,
	CASE
		WHEN AVG(quantity) > 6 THEN "Good"
        ELSE "Bad"
    END AS remark
FROM sales
GROUP BY product_line;

-- Which branch sold more products than average product sold?

SELECT * FROM SALES;
SELECT BRANCH, SUM(QUANTITY) FROM sales
GROUP BY BRANCH
HAVING SUM(QUANTITY)> (SELECT AVG(QUANTITY) FROM SALES);

-- What is the most common product line by gender?

SELECT PRODUCT_LINE, GENDER, COUNT(GENDER) AS COUNT FROM sales
GROUP BY PRODUCT_LINE, GENDER
ORDER BY COUNT DESC;

-- What is the average rating of each product line?

SELECT PRODUCT_LINE, ROUND(AVG(RATING),2) AS AVEG FROM sales
GROUP BY PRODUCT_LINE
ORDER BY AVEG DESC;

-- --------------------------------------------------------------------
-- --------------------------------------------------------------------

-- --------------------------------------------------------------------
-- -------------------------- Customers -------------------------------
-- --------------------------------------------------------------------

-- How many unique customer types does the data have?

SELECT DISTINCT CUSTOMER_TYPE FROM SALES;

-- How many unique payment methods does the data have?

SELECT DISTINCT PAYMENT FROM SALES;

-- What is the most common customer type?

SELECT CUSTOMER_TYPE, COUNT(CUSTOMER_TYPE) AS CUST_COUNT FROM sales
GROUP BY CUSTOMER_TYPE;

-- What is the gender distribution per branch?

SELECT BRANCH, COUNT(GENDER) AS COUNT FROM sales
GROUP BY BRANCH
ORDER BY COUNT;

-- Which time of the day do customers give most ratings?

SELECT * FROM SALES;

SELECT TIME_OF_DAY, AVG(RATING) AS AVG FROM SALES
GROUP BY TIME_OF_DAY
ORDER BY AVG DESC;

-- Which time of the day do customers give most ratings per branch?

SELECT BRANCH,TIME_OF_DAY, AVG(RATING) AS AVG FROM sales
GROUP BY 1,2
ORDER BY 3 DESC ;    

-- Which day OF the week has the best avg ratings?

SELECT * FROM SALES;

SELECT DAY_NAME, AVG(RATING) FROM sales
GROUP BY 1
ORDER BY 2 DESC;

-- --------------------------------------------------------------------
-- --------------------------------------------------------------------

-- --------------------------------------------------------------------
-- ---------------------------- Sales ---------------------------------
-- --------------------------------------------------------------------

-- Number of sales made in each time of the day per weekday 

SELECT TIME_OF_DAY, SUM(TOTAL) FROM sales
GROUP BY 1
ORDER BY 2;

-- Which of the customer types brings the most revenue?

SELECT CUSTOMER_TYPE, SUM(TOTAL) FROM sales
GROUP BY 1
ORDER BY 2 DESC;

-- Which city has the largest tax/VAT percent?
SELECT CITY, AVG(tax_pct) FROM sales
GROUP BY 1
ORDER BY 2 DESC;

-- Which customer type pays the most in VAT?

SELECT CUSTOMER_TYPE, AVG(tax_pct) FROM sales
GROUP BY 1
ORDER BY 2 DESC;












