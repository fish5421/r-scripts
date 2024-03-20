# Load required libraries
library(dplyr)
library(ggplot2)

# Read the sales data from a CSV file
sales_data <- read.csv("sales_data.csv")

# Print the structure of the sales data
cat("Structure of the sales data:\n")
str(sales_data)

# Calculate total revenue by product category
cat("\nTotal revenue by product category:\n")
revenue_by_category <- sales_data %>%
  group_by(category) %>%
  summarize(total_revenue = sum(revenue))
print(revenue_by_category)

# Calculate the average unit price by product category
cat("\nAverage unit price by product category:\n")
avg_price_by_category <- sales_data %>%
  group_by(category) %>%
  summarize(avg_unit_price = mean(unit_price))
print(avg_price_by_category)

# Create a bar chart of total revenue by product category
cat("\nBar chart of total revenue by product category:\n")
ggplot(revenue_by_category, aes(x = category, y = total_revenue)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Total Revenue by Product Category",
       x = "Product Category",
       y = "Total Revenue") +
  theme_minimal()

# Create a scatter plot of unit price vs. quantity sold
cat("\nScatter plot of unit price vs. quantity sold:\n")
ggplot(sales_data, aes(x = unit_price, y = quantity)) +
  geom_point(color = "darkred") +
  labs(title = "Unit Price vs. Quantity Sold",
       x = "Unit Price",
       y = "Quantity Sold") +
  theme_minimal()
