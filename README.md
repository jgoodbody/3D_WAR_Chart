# 3-D "Wins Above Replacement" (WAR) Chart

This is a repository for a Shiny web application featuring an interactive chart of the baseball statistic WAR. It can be found here: <https://jgoodbody.shinyapps.io/3dwar/>. It is an attempt to show the three main components (batting, fielding, baserunning) of position player WAR in a 3-D space. The idea came about when I saw that the R package [Plotly](https://plot.ly/r/) could create 3-D charts. I wanted to visualize how much better Mike Trout is than every other baseball player. The 3-D chart would show the space between him and the cloud of everyone else.

The original idea of using 2012-2016 data expanded into this interactive Shiny application that allows the user to select the team(s), year, and minimum amount of plate appearances in a season for each player to appear in the chart.

A lengthy explanation of WAR can be found at [Fangraphs](http://www.fangraphs.com/library/misc/war/).

The statistics for this interactive chart were scraped from Fangraphs using [Bill Petti's baseballr package](http://billpetti.github.io/baseballr/).