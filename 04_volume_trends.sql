-- Volume Growth Analysis
-- Compares trading volume from first month to last month
-- Positive % = increasing interest in stock

WITH first_month AS (
    SELECT company, SUM(volume) AS first_month_vol
    FROM stocks
    WHERE MONTH(date) = (SELECT MONTH(MIN(date)) FROM stocks)
    GROUP BY company
),
last_month AS (
    SELECT company, SUM(volume) AS last_month_vol
    FROM stocks
    WHERE MONTH(date) = (SELECT MONTH(MAX(date)) FROM stocks)
    GROUP BY company
)
SELECT 
    m.company,
    m.first_month_vol,
    l.last_month_vol,
    ROUND((l.last_month_vol - m.first_month_vol) / m.first_month_vol * 100, 2) AS volume_growth_pct
FROM first_month m
JOIN last_month l ON m.company = l.company
ORDER BY volume_growth_pct DESC
LIMIT 20;