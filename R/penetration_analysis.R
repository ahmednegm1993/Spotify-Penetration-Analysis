library(readxl)
library(dplyr)

# Load the dataset
df <- read_excel("E:\\Data_analysis_projects\\penetration_analysis\\dataset\\penetration_analysis.xlsx")

# Convert 'last_active_date' to Date
df$last_active_date <- as.Date(df$last_active_date)

# Define the specific date
today_date <- as.Date("2024-09-11")

# Calculate the difference in days
df <- df %>%
  mutate(last_active_date_evaluation = as.numeric(difftime(today_date, last_active_date, units = "days")))

# Define the criteria for active users
df <- df %>%
  mutate(active_inactive = ifelse(last_active_date_evaluation <= 30 & sessions >= 5 & listening_hours >= 10, "active", "inactive"))

# Calculate the active user penetration rate for each country
penetration_rate <- df %>%
  group_by(country) %>%
  summarise(active_user_penetration_rate = round(mean(active_inactive == "active") * 100, 2))

print(penetration_rate)
