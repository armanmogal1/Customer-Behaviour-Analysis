--Q.1) What is the average purchase amount by gender and subscription status?
SELECT 
    gender,
    subscription_status,
    ROUND(AVG(purchase_amount), 2) AS avg_purchase_amount,
    COUNT(*) AS total_purchases
FROM customer
GROUP BY gender, subscription_status
ORDER BY avg_purchase_amount DESC;

--Q.2) Find customers who made purchases above the average purchase amount in their category?
WITH customer_total AS (
    SELECT 
        customer_id,
        location,
        SUM(purchase_amount) AS total_spent,
        COUNT(*) AS order_count
    FROM customer
    GROUP BY customer_id, location
),
overall_avg AS (
    SELECT AVG(total_spent) AS avg_spending
    FROM customer_total
)
SELECT 
    ct.customer_id,
    ct.location,
    ROUND(ct.total_spent, 2) AS total_spent,
    ct.order_count,
    ROUND(oa.avg_spending, 2) AS average_spending
FROM customer_total ct
CROSS JOIN overall_avg oa
WHERE ct.total_spent > oa.avg_spending
ORDER BY ct.total_spent DESC;

--Q.3) Calculate the total revenue by location and identify top 5 locations?
SELECT 
    location,
    COUNT(DISTINCT customer_id) AS unique_customers,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS avg_order_value
FROM customer
GROUP BY location
ORDER BY total_revenue DESC
LIMIT 5;

--Q.4) Find the most popular item in each category by purchase frequency?
SELECT 
    category,
    item_purchased,
    purchase_count
FROM (
    SELECT 
        category,
        item_purchased,
        COUNT(*) AS purchase_count,
        ROW_NUMBER() OVER (PARTITION BY category ORDER BY COUNT(*) DESC) AS rank_num
    FROM customer
    GROUP BY category, item_purchased
) ranked
WHERE rank_num = 1;

--Q.5) Calculate customer lifetime value by grouping previous purchases?
SELECT 
    CASE 
        WHEN previous_purchases = 0 THEN 'New Customer'
        WHEN previous_purchases BETWEEN 1 AND 5 THEN 'Regular Customer'
        WHEN previous_purchases BETWEEN 6 AND 15 THEN 'Loyal Customer'
        ELSE 'VIP Customer'
    END AS customer_segment,
    COUNT(DISTINCT customer_id) AS customer_count,
    ROUND(AVG(purchase_amount), 2) AS avg_purchase,
    ROUND(AVG(previous_purchases), 1) AS avg_previous_purchases
FROM customer
GROUP BY customer_segment
ORDER BY avg_previous_purchases;

--Q.6)Identify seasonal trends in purchase amounts and preferences?
SELECT 
    season,
    category,
    COUNT(*) AS total_purchases,
    ROUND(AVG(purchase_amount), 2) AS avg_amount,
    ROUND(SUM(purchase_amount), 2) AS total_revenue
FROM customer
GROUP BY season, category
ORDER BY season, total_revenue DESC;

--Q.7) Compare subscription vs non-subscription customers behavior?
SELECT 
    subscription_status,
    ROUND(CAST(AVG(purchase_amount) AS DECIMAL(10,2)), 2) AS avg_purchase,
    ROUND(CAST(AVG(previous_purchases) AS DECIMAL(10,2)), 1) AS avg_previous_purchases,
    ROUND(CAST(AVG(review_rating) AS DECIMAL(10,2)), 2) AS avg_rating,
    COUNT(DISTINCT payment_method) AS payment_methods_used,
    ROUND(CAST(AVG(purchase_frequency_days) AS DECIMAL(10,2)), 1) AS avg_days_between_purchases
FROM customer
GROUP BY subscription_status;

--Q.8) Analyze shipping type preferences and their impact on ratings?
SELECT 
    shipping_type,
    COUNT(*) AS order_count,
    ROUND(CAST(AVG(review_rating) AS DECIMAL(10,2)), 2) AS avg_rating,
    ROUND(CAST(AVG(purchase_amount) AS DECIMAL(10,2)), 2) AS avg_order_value,
    ROUND(CAST(COUNT(*) AS DECIMAL(10,2)) * 100.0 / CAST(SUM(COUNT(*)) OVER() AS DECIMAL(10,2)), 2) AS percentage_of_orders
FROM customer
GROUP BY shipping_type
ORDER BY order_count DESC;

--Q.9) Calculate revenue contribution by payment method?
SELECT 
    payment_method,
    COUNT(*) AS transaction_count,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS avg_transaction,
    ROUND(SUM(purchase_amount) * 100.0 / (SELECT SUM(purchase_amount) FROM customer), 2) AS revenue_percentage
FROM customer
GROUP BY payment_method
ORDER BY total_revenue DESC;

--Q.10) Find size preferences across different categories?
SELECT 
    category,
    size,
    COUNT(*) AS purchase_count,
    ROUND(AVG(purchase_amount), 2) AS avg_price,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY category), 2) AS percentage_in_category
FROM customer
GROUP BY category, size
ORDER BY category, purchase_count DESC;


