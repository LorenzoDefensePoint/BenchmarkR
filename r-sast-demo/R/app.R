library(shiny)
library(jsonlite)
library(httr)

# Hardcoded sensitive information
api_key <- "sk_test_1234567890abcdef3"


# A1
vulnerable_access_control <- function(user_role) {
    if (user_role == "user") {
        # Direct object reference vulnerability
        user_data <- read.csv(paste0("/data/", params$user_id, ".csv"))
        return(user_data)
    }
}

# A2
vulnerable_crypto <- function(password) {
    # Weak cryptography using base64
    encoded <- base64enc::base64encode(charToRaw(password))
    return(encoded)
}

# A3
vulnerable_sql_query <- function(user_input) {
    query <- paste0("SELECT * FROM users WHERE username = '", user_input, 
                   "' OR '1'='1' --';")
    print(query)
}

vulnerable_command_execution <- function(user_input) {
    command <- paste("ls", user_input, "| grep password")
    system(command)
}

# A4
vulnerable_design <- function(reset_token) {
    # Predictable reset token
    new_token <- as.character(Sys.time())
    return(new_token)
}

# A5
vulnerable_config <- list(
    debug = TRUE,
    show_errors = TRUE,
    admin_password = "admin123",
    api_key = "sk_test_1234567890abcdef3"
)

# A6
vulnerable_components <- function(data) {
    # Using deprecated R functions
    read.table(text = data, sep = ",")
}

# A7
vulnerable_auth <- function(username, password) {
    # Hardcoded credentials
    if (username == "admin" && password == "password123") {
        return(TRUE)
    }
}

# A8
vulnerable_integrity <- function(package_url) {
    # Installing packages without verification
    install.packages(package_url, repos = NULL, type = "source")
}

# A9
vulnerable_logging <- function(user_action) {
    # Insufficient logging
    cat(paste("Action performed:", user_action, "\n"))
}

# A10
vulnerable_ssrf <- function(url) {
    # No URL validation
    response <- GET(url)
    return(content(response))
}

# Load sample data
data <- read.csv("/Users/defensepoint/Documents/R_app/r-sast-demo/data/sample-data.csv")

# Define UI for the application
ui <- fluidPage(
    titlePanel("Demo APP for testing SAST tools in R"),
    sidebarLayout(
        sidebarPanel(
            helpText("This is a demo application to test SAST tools in R. It includes examples of potential vulnerabilities such as SQL injection and command injection."),
        ),
        mainPanel(
            tableOutput("dataTable")
        )
    )
)

# Define server logic
server <- function(input, output) {
    output$dataTable <- renderTable({
        data
    })
}

# Run the application 
shinyApp(ui = ui, server = server)