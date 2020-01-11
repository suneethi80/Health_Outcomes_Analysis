#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    #Application title
    fluidRow(column(10, offset = 4,titlePanel("Health Status in Counties"))),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("County",
                        choices= county,
                        label="County"
                        #"Number of bins:",
                        #min = 1,
                        #max = 50,
                        #value = 30)
        )),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
