#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)

df=read.csv2("Statewise polling Datacsv.csv",header=TRUE,sep=",")
content<-paste(df[1]$State.UT,df[2]$Capital)
newframe<-data.frame(lat=as.numeric(levels(df$Lat))[df$Lat],lng=as.numeric(levels(df$Long))[df$Long])
chartframe<-data.frame(as.numeric(levels(df$Percentage.of.votes.polled.2009))[df$Percentage.of.votes.polled.2009],as.numeric(levels(df$Percentage.of.votes.polled.2014))[df$Percentage.of.votes.polled.2014])
colnames(chartframe)<-c("2009 Voting %","2014 Voting %")
shinyUI(fluidPage(
  titlePanel("2009/2014 India Lok Sabha Elections Voting % Comparison"),
  sidebarLayout(
    sidebarPanel(style="overflow-y:scroll;max-height:600px;position:relative;",radioButtons("capital","State/UT and Capital",c(content))),
    mainPanel(leafletOutput("Map1"))
)
)
)