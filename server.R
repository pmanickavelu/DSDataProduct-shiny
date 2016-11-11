
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({
    x    <- dget("shy_mat_data")
    rangeOD <- seq(input$rangeOD[1],input$rangeOD[2])
    rivers <- as.numeric(input$rivers)
    if(length(rivers)==0){
        rivers <- c(1,2,3,4)
    }
    colors <- c(c(input$james_col, input$oostanaula_col,input$delaware_col,input$wolf_col))

    matplot(x[rangeOD,rivers], col = colors[rivers], border = 'white',  type = "l" , ylab = "Water Flow", xlab = "From Jan 1916 to Dec 1960")
  })

})

