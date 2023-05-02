library(shiny)

ui <- fluidPage(
  
  numericInput(inputId= 'high', label='Add your high in Meter', value = 0),
  numericInput(inputId='wieght', label='Add your weight in KG', value = 0),
  
  
  textOutput('result')
)

server <- function(input, output, session) {
  
  output$result <-renderText({
    paste0('Your BMI is: ', (input$wieght/(input$high*input$high))
  )})
  
}

shinyApp(ui, server)