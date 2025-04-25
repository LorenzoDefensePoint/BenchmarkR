# Utility functions for the r-sast-demo application

# Function to load data from a CSV file
load_data <- function(file_path) {
  data <- read.csv(file_path)
  return(data)
}

# Function to validate data
validate_data <- function(data) {
  if (is.data.frame(data) && nrow(data) > 0) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

# Function to summarize data
summarize_data <- function(data) {
  summary_stats <- summary(data)
  return(summary_stats)
}

# Function to process data (example: filter rows and select columns)
process_data <- function(data) {
  # Example processing: filter rows where value > 200 and select specific columns
  processed_data <- data %>%
    dplyr::filter(value > 200) %>%
    dplyr::select(id, name, value)
  return(processed_data)
}