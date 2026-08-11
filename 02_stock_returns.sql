-- Top Stocks by Returns
-- Compares closing price from first date to last date
-- Note: Penny stocks (0.35 → 9.59) may show extreme returns due to splits

WITH first_close AS (
    SELECT company, close AS first_close
    FROM stocks
    WHERE date = (SELECT MIN(date) FROM stocks)
),
last_close AS (
    SELECT company, close AS last_close
    FROM stocks
    WHERE date = (SELECT MAX(date) FROM stocks)
)
SELECT 
    f.company,
    ROUND(f.first_close, 2) AS first_close,
    ROUND(l.last_close, 2) AS last_close,
    ROUND(((l.last_close - f.first_close) / f.first_close * 100), 2) AS return_pct
FROM first_close f
JOIN last_close l ON f.company = l.company
ORDER BY return_pct DESC
LIMIT 20;