import pandas as pd

df = pd.read_csv(
r"C:\Users\kanik\OneDrive\Desktop\Enterprise_Data_Warehouse_Project\Dataset\SampleSuperstore.csv",
encoding='latin1'
)

print("Original Shape:")
print(df.shape)

df.drop_duplicates(inplace=True)

print("After Removing Duplicates:")
print(df.shape)

print("\nMissing Values:")
print(df.isnull().sum())
