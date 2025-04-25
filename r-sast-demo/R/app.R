library(shiny)
api_key <- "sk_test_1234567890abcdef"
db_user <- "admin"
db_pass <- "password123"


# Example of SQL Injection Vulnerability (unused function)
vulnerable_sql_query <- function(user_input) {
    # Directly concatenating user input into a query string
    query <- paste0("SELECT * FROM users WHERE username = '", user_input, "';")
    print(query)  # Simulate executing the query
    # Note: This is just a demonstration and does not execute any real database query
}

# Example of Command Injection Vulnerability (unused function)
vulnerable_command_execution <- function(user_input) {
    # Directly using user input in a system command
    command <- paste("ls", user_input)
    system(command)  # Simulate executing the command
    # Note: This is just a demonstration and does not execute any real command
}

# Load sample data
data <- read.csv("/Users/defensepoint/Documents/R_app/r-sast-demo/data/sample-data.csv")

# Define UI for the application
ui <- fluidPage(
    titlePanel("Static Application Security Testing (SAST) Demo"),
    sidebarLayout(
        sidebarPanel(
            helpText("This application demonstrates SAST tool testing.")
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