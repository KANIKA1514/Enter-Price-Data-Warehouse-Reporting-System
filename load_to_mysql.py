import pandas as pd
from sqlalchemy import create_engine

# Read CSV
df = pd.read_csv(
    r"C:\Users\kanik\OneDrive\Desktop\Enterprise_Data_Warehouse_Project\Dataset\SampleSuperstore.csv",encoding='latin1'
)

# Rename columns
df.columns = [
    'Row_ID','Order_ID','Order_Date','Ship_Date','Ship_Mode',
    'Customer_ID','Customer_Name','Segment','Country','City',
    'State','Postal_Code','Region','Product_ID','Category',
    'Sub_Category','Product_Name','Sales','Quantity',
    'Discount','Profit'
]

# Convert dates
df['Order_Date'] = pd.to_datetime(df['Order_Date'])
df['Ship_Date'] = pd.to_datetime(df['Ship_Date'])

# MySQL connection
engine = create_engine(
    "mysql+pymysql://root:root@localhost/DataWarehouse"
)

# Load data
df.to_sql(
    'Fact_Sales',
    con=engine,
    if_exists='append',
    index=False
)

print("Data Loaded Successfully!")
