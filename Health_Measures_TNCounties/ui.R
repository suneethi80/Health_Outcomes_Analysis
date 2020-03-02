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
library(maps)

# Define UI for application that draws a histogram
shinyUI(
    dashboardPage(
        dashboardHeader(title = 'Health Status in Tennessee Counties', titleWidth = 400),
        dashboardSidebar(
             sidebarMenu( 
               menuItem("Introduction", tabName="Introduction"),
            menuItem("Health", tabName = "Health", icon= icon("h-square")),
                # menuItem("Health Factors", tabName = "healthfactors"),
                # menuItem("Mortality", tabName= "mortality"),
                # menuItem("Socio-economic Factors", tabName="Socio-economicfactors"),
            selectInput("County", 
                        label = "County", 
                        choices = County,
                        selected = 'Davidson')
                )),
            
        dashboardBody(
            tabItems(
              tabItem(tabName="Introduction",
                   h1("Analysis of Health Factors in Tennessee in 2019", align='center'),
              br(),
                    h2("Data Source: https://www.countyhealthrankings.org/explore-health-rankings/rankings-data-documentation"),
              br(),
              h3("County Health Rankings is a collaboration between the University of Wisconsin Population
                Health Institute and the Robert Wood Johnson Foundation."),
              br(),
              h4("A lot of factors contribute towards our well being. Some of these
                factors are directly related to human body. For example, food, exercise and
                 sleep helps to maintain physical and mental health. However, there are 
                 external or environmental factors that contribute indirectly to these factors.
                 These include education, employment, housing, safety that indirectly affects
                 our mental or physical health."),
              br(),
                 h5("The goal of this application is to provide snapshot of health status in different counties
                 in Tennessee."),
              br(),
              div(a(img(src="intropic.jpg", width=800, style="display:block;margin-left: auto; margin-right: auto;"), target="blank")),
              ),
              
                tabItem(tabName= "Health",
                        #fluidRow(
                            # box(title="Rural Population Percentage in Tennessee in 2019", width=12, status = "primary", 
                            #     solidHeader = T, background = "aqua", plotlyOutput("plot1", height=300))
                            #),
                            
                            # box(title = "Controls for Healthcare", status= "warning", 
                            #     solidHeader= T, 
                                #sliderInput("bins", "Number of Breaks", 1, 50, 25)),
                            
                          fluidRow(
                            box(title="Health Status in Tennessee in 2019", width = 12, status = "primary",
                                solidHeader = T, background = "aqua", plotlyOutput("plot2", height=350))
                            ),
                            
                            fluidRow(
                                box(title="Mortality in Tennessee in 2019", width = 12, status = "primary", 
                                         solidHeader = T, background = "aqua", plotlyOutput("plot3", height=350)) 
                                ),
                                  ),
                
                tabItem(tabName = "healthfactors",
                        h3("Health Factors")
                ),
                tabItem(tabName= "mortality",
                        h4("Mortality")
                ),
                tabItem(tabName="Socio-economicfactors",
                        h5("Socio-economic Factors include"),
                        # fluidRow(box(width=12, status = "primary", 
                        #              'Click on column name to sort.',
                        #              dataTableOutput("table")))
                )
                
                )
                
                
            
                )
        
        )
            )
            # tabItem(tabName= "Health Factors",
            #         h1("Mortality in Tenneseee"),
                    # fluidRow(
                    #   box(title="Population in Tennessee in 2019", status = "primary", 
                    #       solidHeader = T, background = "aqua", plotlyOutput("plot1", height=250))
                    # )
                    
            
            







