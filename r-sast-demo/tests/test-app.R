# Load necessary libraries
library(testthat)
library(dplyr)

# Source the main application script
source("/Users/defensepoint/Documents/R_app/r-sast-demo/R/app.R")
source("/Users/defensepoint/Documents/R_app/r-sast-demo/R/utils.R")

# Test cases for the application
test_that("Data loading works correctly", {
  data <- load_data("/Users/defensepoint/Documents/R_app/r-sast-demo/data/sample-data.csv")
  expect_true(nrow(data) > 0)
})

test_that("Data processing returns expected results", {
  data <- load_data("/Users/defensepoint/Documents/R_app/r-sast-demo/data/sample-data.csv")
  processed_data <- process_data(data)
  expect_equal(ncol(processed_data), 3) # id, name, value
  expect_true(all(processed_data$value > 200)) # Ensure all values > 200
})

test_that("Utility function for validation works", {
  data <- load_data("/Users/defensepoint/Documents/R_app/r-sast-demo/data/sample-data.csv")
  result <- validate_data(data)
  expect_true(result)
})