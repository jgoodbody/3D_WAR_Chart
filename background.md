## Explaining Wins Above Replacement (WAR)

Baseball is a game filled with statistics. Batting average, home runs, runs batted in -- these are the stats that people have used to judge baseball players for over a hundred years. In recent years, there has been a "sabermetric revolution" that has occurred in the baseball world, one that was written about a decade ago in *Moneyball*, a book that even became a movie! The Boston Red Sox and Chicago Cubs have both succeeded in recent years using more analytical thinking when forming their rosters, combining that with large payrolls. The Oakland Athletics in *Moneyball* never had the benefit of the latter.

As a part of this movement, there has been an attempt to create an all-in-one stat to evaluate players' contributions to their team. "Wins Above Replacement" or "WAR" is a framework that has many implementations across different baseball sites. It combines a player's batting, fielding, and baserunning to determine how many wins said player added to his team over a theoretical minor leaguer called up from AAA (his **replacement**).

This interactive chart is an attempt to show these separate components of WAR in a 3-D space. The idea came about when I saw that `plotly` could create 3-D charts. I wanted to visualize how much better Mike Trout is than every other baseball player. The 3-D chart would show the space between him and the cloud of everyone else. 

The original idea of using 2012-2016 data expanded into this interactive Shiny application that allows the user to select the team(s), year, and minimum amount of plate appearances in a season for each player to appear in the chart.

A lengthy explanation of WAR can be found at [Fangraphs](http://www.fangraphs.com/library/misc/war/).

The statistics for this interactive chart were scraped from Fangraphs using [Bill Petti's baseballr package](http://billpetti.github.io/baseballr/).