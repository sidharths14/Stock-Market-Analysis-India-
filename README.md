# Stock Market Analytics

Analysis of 537 companies' stock market data to identify performance 
trends, volatility patterns, and volume changes over time.

## Dataset
- Companies: 537
- Period: September 2023 - August 2024
- Columns: Date, Open, High, Low, Close, Volume, Company
- Total Records: 84,030

## Project Structure
- `01_data_cleaning.py` — Data cleaning pipeline
- `02_stock_returns.sql` — Best performing stocks by return %
- `02_stock_volatility.sql` — Stock volatility ranking
- `03_volume_trends.sql` — Volume growth analysis

## Key Findings

### Top Performers
- **BITS LTD:** 2640% return (0.35 → 9.59) — penny stock, verify for splits
- **TIRTH PLASTIC LTD:** 648% return
- **ELECTROTHERM INDIA:** 631% return

### Highest Volatility
- **SCL930626PVT:** 21.25% avg daily swing
- **EARCLNIFTYJ8G602C170726P:** 17.75% avg daily swing
- **HDFC MUTUAL FUND:** 17.11% avg daily swing

### Volume Trends
- **TIRTH PLASTIC LTD:** 739% volume growth (first month → last month)
- **MIDWEST GOLD LTD:** 1666% volume growth
- **KFLZC22125NCD:** 9850% volume growth

## Data Caveats
- Penny stocks show extreme returns due to stock splits (not real growth)
- Some company names appear duplicated in dataset (data quality issue)
- Volume growth calculations based on first vs last month (not continuous trend)

## Tools & Technologies
- Python, Pandas (data cleaning)
- MySQL (analysis)
- SQL (queries with CTEs, window functions, joins)

## Status
✅ Complete — All analyses done, dashboards built, insights documented
