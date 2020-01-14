#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

# Define UI for application that draws a histogram
shinyUI(
    dashboardPage(
        dashboardHeader(title = 'Health Status in Counties', titleWidth = 300),
        dashboardSidebar(
             sidebarMenu( 
            menuItem("Healthcare", tabName = "Healthcare", icon= icon("h-square")),
                menuItem("Health Factors", tabName = "healthfactors"),
                menuItem("Mortality", tabName= "mortality"),
                menuItem("Socio-economic Factors", tabName="Socio-economicfactors"),
            sliderInput("bins", "Number of Breaks", 1, 50, 25)
                )),
            
        dashboardBody(
            tabItems(
                tabItem(tabName= "Healthcare",
                        fluidRow(
                            box(plotOutput("histogram"))    
                )),
            tabItem(tabName = "healthfactors",
                    h1("Health Factors")
                    ),
            tabItem(tabName= "mortality",
                    h2("Mortality")
                    ),
            tabItem(tabName="Socio-economicfactors",
                    h3("Socio-economic Factors include")
                    )
            )
            ))
)


