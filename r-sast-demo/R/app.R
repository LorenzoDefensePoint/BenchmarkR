library(shiny)

# Simulate sensitive information (unused variables)
api_key <- "sk_test_1234567890abcdef"
db_user <- "admin"
db_pass <- "password12345"


# Example of SQL Injection Vulnerability (unused function)
vulnerable_sql_query <- function(user_input) {
    query <- paste0("SELECT * FROM users WHERE username = '", user_input, "';")
    print(query) 
}

# Example of Command Injection Vulnerability (unused function)
vulnerable_command_execution <- function(user_input) {
    command <- paste("ls", user_input)
    system(command)  
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