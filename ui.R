#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(markdown)
library(plotly)
# Define UI for application that draws a 3-D plot
shinyUI(fluidPage(theme=shinytheme("flatly"),
        
        # Application title
        titlePanel("3-D Wins Above Replacement Chart"),
        
        # Sidebar with a dropdown input for the year, team, and min PA selection 
        sidebarLayout(
                sidebarPanel(width=3,
                             h5(tags$b("Choose team(s), year, and minimum number of plate appearances (PA)")),
                             checkboxInput("allteams","All Teams",TRUE),
                             h6("De-select checkbox to select individual teams"),
                             conditionalPanel(
                                     condition = "input.allteams == false",
                                     selectInput("team","Team",c("Angels","Astros","Athletics","Blue Jays","Braves","Brewers","Cardinals","Cubs","Diamondbacks","Dodgers","Giants","Indians","Mariners","Marlins","Mets","Nationals","Orioles","Padres","Phillies","Pirates","Rangers","Rays","Red Sox","Reds","Rockies","Royals","Tigers","Twins","White Sox","Yankees"),selected="Mets",multiple=FALSE,selectize=TRUE)
                             ),
                             selectInput("year","Year",2000:2016,selected=2016,multiple=FALSE,selectize=TRUE),
                             sliderInput("plateapp","PA",1,700,value=502,step=1, ticks=FALSE),
                             actionButton("submitButton","Submit")
                ),
                # Show a plot of the generated 3-D chart
                mainPanel(
                        tabsetPanel(type="tabs",
                                    tabPanel("Chart",plotlyOutput("warPlot",width="100%",height=700)),
                                    tabPanel("How to Use",includeMarkdown("howtouse.md")),
                                    tabPanel("Background",includeMarkdown("background.md"))
                        )
                        
                )
        )
)
)
