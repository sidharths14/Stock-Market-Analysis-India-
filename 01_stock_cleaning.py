import pandas as pd

# ── Load Data ──────────────────────────────────────────────────────

df = pd.read_csv('/content/drive/MyDrive/stock.csv')

# ── Initial Data ───────────────────────────────────────────────────

# Dataset contains:
# Company, Date, Open, High, Low, Close, Volume, Turnover

# ── Remove Missing / Invalid Trading Data ──────────────────────────

# Volume = 0 means there was no actual trading activity
df = df[df['Volume'] > 0]

# Remove rows where Close price is zero
df = df[df['Close'] > 0]

# ── Fix Date Data Type ─────────────────────────────────────────────

df['Date'] = pd.to_datetime(df['Date'])

# Remove timezone information
df['Date'] = df['Date'].dt.tz_localize(None)


# ── Remove Duplicate Records ───────────────────────────────────────

# A company should have only one record per trading date
df = df.drop_duplicates(subset=['Company', 'Date'])

# ── Validate OHLC Data ─────────────────────────────────────────────

# High must be greater than or equal to Low
# Close must fall between Low and High

df = df[
    (df['High'] >= df['Low']) &
    (df['Close'].between(df['Low'], df['High']))
]

# ── Verify Clean Data ──────────────────────────────────────────────

print("Shape:", df.shape)
print("Unique companies:", df['Company'].nunique())
print("Earliest date:", df['Date'].min())
print("Latest date:", df['Date'].max())
print("Missing values:")
print(df.isna().sum())
print("Duplicate Company-Date records:",
      df.duplicated(subset=['Company', 'Date']).sum())

# ── Save Clean Data ────────────────────────────────────────────────

df.to_csv('/content/drive/MyDrive/stock_data_cleaned.csv', index=False)

print("Saved: stock_data_cleaned.csv")