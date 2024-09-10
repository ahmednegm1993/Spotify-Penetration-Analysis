import pandas as pd
import datetime

df = pd.read_excel(r'E:\\Data_analysis_projects\\penetration_analysis\\dataset\\penetration_analysis.xlsx')

df['last_active_date'] = pd.to_datetime(df['last_active_date'])

today_date = pd.to_datetime('2024-09-11')

df['last_active_date_evaluation'] = (today_date - df['last_active_date']).dt.days

df['active_inactive'] = ((df['last_active_date_evaluation'] <= 30) & 
                         (df['sessions'] >= 5) & 
                         (df['listening_hours'] >= 10)).astype(int)

active_users_df = df[df['active_inactive'] == 1]
df_group  = df.groupby('country').agg(
    Active_Users=('active_inactive', 'sum'),
    Total_Users=('user_id', 'count')
).reset_index()

df_group['Active_User_Penetration_Rate'] = (df_group['Active_Users'] / df_group['Total_Users'] * 100).round(2)

print(df_group[['country', 'Active_User_Penetration_Rate']])
