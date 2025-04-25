# R SAST Demo Application

## Overview
This project is a demonstration of a Static Application Security Testing (SAST) tool using R. It includes a simple application that processes data and exposes functions for testing security vulnerabilities.

## Project Structure
```
r-sast-demo
├── R
│   ├── app.R          # Main application script
│   └── utils.R        # Utility functions
├── data
│   └── sample-data.csv # Sample dataset for testing
├── tests
│   └── test-app.R     # Test cases for the application
├── DESCRIPTION         # Package metadata
├── NAMESPACE           # Exported functions and objects
└── README.md           # Project documentation
```

## Installation
To install the necessary packages, run the following command in your R console:

```R
install.packages(c("dplyr", "ggplot2"))
```

## Running the Application
To run the application, open the `app.R` file and execute the script in your R environment. Ensure that the `sample-data.csv` file is located in the `data` directory.

## Testing
To run the tests, execute the `test-app.R` file located in the `tests` directory. This will validate the functionality of the application and check for any potential vulnerabilities.

## Purpose
The purpose of this project is to provide a simple framework for testing SAST tools in R applications. It serves as a starting point for developers to understand how to integrate security testing into their R projects.