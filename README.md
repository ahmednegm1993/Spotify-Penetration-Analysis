"# Spotify-Penetration-Analysis" 
Market penetration is an important metric for understanding Spotify's performance and growth potential in different regions.
You are part of the analytics team at Spotify and are tasked with calculating the active user penetration rate in specific countries.


For this task, 'active_users' are defined based on the  following criterias:


last_active_date: The user must have interacted with Spotify within the last 30 days.
•    sessions: The user must have engaged with Spotify for at least 5 sessions.
•    listening_hours: The user must have spent at least 10 hours listening on Spotify.


Based on the condition above, calculate the active 'user_penetration_rate' by using the following formula.


•    Active User Penetration Rate = (Number of Active Spotify Users in the Country / Total users in the Country)


Total Population of the country is based on both active and non-active users.
​
The output should contain 'country' and 'active_user_penetration_rate' rounded to 2 decimals.


Let's assume the current_day is 2024-01-31.

Table: penetration_analysis

user_id:
int
country:
varchar
last_active_date:
datetime
listening_hours:
int
sessions:
int

link='https://platform.stratascratch.com/coding/10369-spotify-penetration-analysis?code_type=3'

data analysis project by excel,python,sql,R,power_bi using dummy data
