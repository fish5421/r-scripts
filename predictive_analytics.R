# Load required libraries
library(caret)
library(randomForest)

# Read the dataset from a CSV file
data <- read.csv("dataset.csv")

# Print the structure of the dataset
cat("Structure of the dataset:\n")
str(data)

# Split the data into training and testing sets
set.seed(123)
train_index <- createDataPartition(data$target, p = 0.7, list = FALSE)
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# Train a random forest model
cat("Training a random forest model...\n")
model <- train(target ~ ., data = train_data, method = "rf")

# Print the model summary
cat("Model summary:\n")
print(model)

# Make predictions on the test data
cat("Making predictions on the test data...\n")
predictions <- predict(model, newdata = test_data)

# Evaluate the model performance
cat("Evaluating the model performance...\n")
confusionMatrix(predictions, test_data$target)

# Save the trained model to a file
cat("Saving the trained model to a file...\n")
saveRDS(model, "random_forest_model.rds")

cat("Predictive analytics script completed successfully!")
