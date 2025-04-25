library(shiny)
api_key <- "sk_test_1234567890abcdef"
db_user <- "admin"
db_pass <- "password123"
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