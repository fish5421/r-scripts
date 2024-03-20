# Load required libraries
library(dplyr)
library(readr)
library(tidyr)

# Read the raw data from a CSV file
raw_data <- read_csv("raw_data.csv")

# Print the structure of the raw data
cat("Structure of the raw data:\n")
str(raw_data)

# Remove rows with missing values
cat("\nRemoving rows with missing values...\n")
cleaned_data <- raw_data %>%
  drop_na()

# Convert date column to the appropriate format
cat("Converting date column to the appropriate format...\n")
cleaned_data$date <- as.Date(cleaned_data$date, format = "%Y-%m-%d")

# Separate the full name column into first name and last name
cat("Separating the full name column into first name and last name...\n")
cleaned_data <- cleaned_data %>%
  separate(full_name, into = c("first_name", "last_name"), sep = " ")

# Aggregate the data by date and calculate the total amount
cat("Aggregating the data by date and calculating the total amount...\n")
aggregated_data <- cleaned_data %>%
  group_by(date) %>%
  summarize(total_amount = sum(amount))

# Save the cleaned and aggregated data to a new CSV file
cat("Saving the cleaned and aggregated data to a new CSV file...\n")
write_csv(aggregated_data, "cleaned_data.csv")

cat("ETL process completed successfully!")
