#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(RSQLite)
library(plotly)

db <- dbConnect(RSQLite::SQLite(),"fgleaders.sqlite")

# Define server logic required to draw the 3-D plot
shinyServer(function(input, output) {
        
        output$warPlot <- renderPlotly({
                input$submitButton
                # generate yearly stats based on input$year and input$team from ui.R
                fgyear <- isolate(dbGetQuery(db,'SELECT * FROM fg2000s WHERE "Season" = :x AND "PA" >= :y',
                                             params = list(x = input$year, y = input$plateapp)))
                isolate(if(input$allteams==FALSE){
                        fgyear <- fgyear[which(fgyear$Team==input$team),]})
                
                charttitle <- isolate(paste(input$year," ",if(input$allteams==FALSE){input$team} else{"All Teams"},sep=""))
                # get specific required stats for chart and give names
                WAR_stats <- data.frame(fgyear$Bat,fgyear$BsR,fgyear$Def,fgyear$Name,fgyear$WAR)
                names(WAR_stats) <- c("Batting","Baserunning","Fielding","Name","WAR")
                
                # plot the stats
                plot_ly(data=WAR_stats, x=~Batting,y=~Baserunning,z=~Fielding,
                        mode="markers",color=~WAR,text=~Name,hoverinfo="text",
                        marker=list(colorbar=list(title="Total WAR")))  %>% 
                        layout(margin=list(t=75),title = charttitle, titlefont = list(size=24),
                               scene=list(aspectmode="data",camera=list(eye=list(x=1,y=-2.5,z=0.5))))
                
        })
        
})
