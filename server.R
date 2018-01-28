#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(leaflet.minicharts)
library(htmltools)

# Define server logic required to draw a map
shinyServer(function(input, output) {
  
  output$Map1 <- renderLeaflet({
    
    dist<- switch(input$capital,input$capital)
    
    
    df=read.csv2("Statewise polling Datacsv.csv",header=TRUE,sep=",")
    content<-paste(df[1]$State.UT,df[2]$Capital)
    
    
    newframe<-data.frame(lat=as.numeric(levels(df$Lat))[df$Lat],lng=as.numeric(levels(df$Long))[df$Long])
    
    chartframe<-data.frame(as.numeric(levels(df$Percentage.of.votes.polled.2009))[df$Percentage.of.votes.polled.2009],as.numeric(levels(df$Percentage.of.votes.polled.2014))[df$Percentage.of.votes.polled.2014])
    colnames(chartframe)<-c("2009 Voting %","2014 Voting %")
    combiframe<-data.frame(newframe,chartframe,content)
    for (i in 1:length(content))
    {
      if(content[i]==input$capital)
      {
        #print(i)
        break
      }
    }
    newframe%>%leaflet()%>%addTiles()%>%addCircles(~lng,~lat,popup=content[i],weight = 3, radius=40, 
                                                   color="red", stroke = TRUE, fillOpacity = 0.8) %>% 
      setView(lng=combiframe$lng[i],lat=combiframe$lat[i],zoom=7) %>%
      addCircleMarkers(combiframe$lng[i], combiframe$lat[i], label = ~htmlEscape(content[i]),labelOptions=labelOptions(textOnly=TRUE,direction="bottom")) %>% 
      addMinicharts(combiframe$lng[i],combiframe$lat[i], type="bar", chartdata = chartframe,showLabels=TRUE,legend=TRUE,width = 30, height = 40)
    
    })
  })