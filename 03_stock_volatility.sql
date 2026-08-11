-- Stock Volatility Analysis
-- Calculates average daily price swing (High - Low) as % of Close
-- Higher volatility = more risky stock

SELECT 
    company,
    ROUND(AVG((high - low) / close * 100), 2) AS avg_daily_volatility_pct,
    COUNT(*) AS trading_days
FROM stocks
GROUP BY company
ORDER BY avg_daily_volatility_pct DESC
LIMIT 20;