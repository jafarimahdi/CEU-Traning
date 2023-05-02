library(shiny)

ui <- fluidPage(
  # Copy the line below to make a number input box into the UI.
  numericInput(inputId = "num1", label = h3("Numeric input"), value = 1),
  numericInput(inputId = "num2", label = h3("Numeric input"), value = 1),
   
 textOutput('value1' ),
 textOutput('value2'),
 h1(textOutput('someOfValue')) # show the the some of the output from server side 
)

server <- function(input, output, session) {
  
  output$value1 <- renderPrint({ input$num1 })
  output$value2 <- renderPrint({ input$num2 })
  
  # sum of the two input form server side in line 15 and 16 
  output$someOfValue <- renderText({input$num2 + input$num1})
}

shinyApp(ui, server)