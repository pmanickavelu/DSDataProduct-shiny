
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

    # Application title
    titlePanel("River Flow Data"),

    # Sidebar with a slider input for number of bins
    verticalLayout(
        mainPanel(
            helpText("The app repersents data of flow of reiver from 1916 to 1960 the data points were collected on monthly basis."),
            helpText("The Month and Date range slider help you select the period for which you want to view the data."),
            helpText("The List Of rivers check boxes helps you select the reviers of which you want to view the data of"),
            helpText("And The reiver col select boxes or dropdowns help you specify a color for them"),
            width = 12
        ),
        mainPanel(
            sidebarPanel(
                sliderInput(
                    "rangeOD",
                    "Month and Date range:",
                   min = 1,
                   max = 540,
                   value = c(1,50),
                   dragRange = F
                   ), 
                width=6
                ),
            sidebarPanel(
                checkboxGroupInput(
                    "rivers", 
                    "List Of rivers", 
                    c("James" = 1,"Wolf"=4,"Oostanaula"=2,"West Branch Delaware"=3), 
                    selected = c(1,2,3,4)
                    ), 
                width = 2
                ),
            sidebarPanel(
                selectInput("james_col", "James River Col", colors(), selected = "tomato"),
                selectInput("wolf_col", "Wolf River Col", colors(), selected = "violetred"),
                width = 2
                ),
            sidebarPanel(
                selectInput("oostanaula_col", "Oost River Col", colors(),selected = "yellowgreen"),
                selectInput("delaware_col", "Delawa River Col", colors(),selected = "royalblue"), 
                width = 2
                ), 
            width = 12
            ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"), width = 12
        )
    )
))
