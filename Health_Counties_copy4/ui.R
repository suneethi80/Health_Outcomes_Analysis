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
        dashboardHeader(title = 'Health Status in Tennessee Counties', titleWidth = 400),
        dashboardSidebar(
             sidebarMenu( 
            menuItem("Healthcare", tabName = "Healthcare", icon= icon("h-square")),
                menuItem("Health Factors", tabName = "healthfactors"),
                menuItem("Mortality", tabName= "mortality"),
                menuItem("Socio-economic Factors", tabName="Socio-economicfactors"),
            selectInput("County", 
                        label = "County", 
                        choices = County,
                        selected = 'Davidson')
                )),
            
        dashboardBody(
            tabItems(
                tabItem(tabName= "Healthcare",
                        fluidRow(
                            box(title="Population in Tennessee in 2019", width=12, status = "primary", 
                                solidHeader = T, background = "aqua", plotlyOutput("plot1", height=250))),
                            
                            # box(title = "Controls for Healthcare", status= "warning", 
                            #     solidHeader= T, 
                                #sliderInput("bins", "Number of Breaks", 1, 50, 25)),
                            
                          fluidRow(
                            box(title="Health Status in Tennessee in 2019", status = "primary",
                                solidHeader = T, background = "aqua", plotlyOutput("plot2", height=250)),
                            
                            
                              box(title="Mortality in Tennessee in 2019", width = 4, status = "primary", 
                                  solidHeader = T, background = "aqua", plotlyOutput("plot3", height=250)) 
                            
                  
                ))
                ),
                
                
            tabItem(tabName = "healthfactors",
                    h1("Health Factors")
                    ),
            tabItem(tabName= "mortality",
                    h2("Mortality")
                    ),
            tabItem(tabName="Socio-economicfactors",
                    h3("Socio-economic Factors include")
                    )
            ))
            )
            # tabItem(tabName= "Health Factors",
            #         h1("Mortality in Tenneseee"),
                    # fluidRow(
                    #   box(title="Population in Tennessee in 2019", status = "primary", 
                    #       solidHeader = T, background = "aqua", plotlyOutput("plot1", height=250))
                    # )
                    
            
            







