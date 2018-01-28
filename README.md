# DataproductsWeek4Assignment

## Indian 2009 2014 Elections Voting % Shiny Project

- The project represents 2009 2014 Lok Sabha election 
- Data for State wise election poll % is got from www.data.gov.in
- Data for Lat Long of the Indian state capitals are got from www.mapmyindia.com
- The data is represented in a shiny application and interactive India map


## How the shiny app is built

- There is a sidebarlayout with a sidebarpanel and mainpanel
- The sidebarpanel has a list of Indian/State Union Territory Capitals as Radiobuttons
- The data for the radio button for the State/UT & capitals are loaded from the downloaded csv file
- On selection of the particular State UT in the radio button the appropriate state/UT voting % is populated as a comparitive histogram against the lat/long location of the State/UT in the Indian Map

## How the application works

- click on the slidebar panel with title panel 2009 2014 Lok Sabha Elections Voting % Comparison
- Click on the radio button you want to see the relative comparison of the voting % of the state/UT
- The shiny application is interspersed with a leaflet map and the mainpanel is shown as a leaflet map
- Once the particular radio button is selected the shiny server throws up the comparitive histogram in the Indian map against the State/UT capital(triangulated by lat/long) as a leaflet minichart
- setView is used to give the focus on the particular State/UT capital and show the comparitive histogram in 2 different colors
- URL to the application: https://rajajayaram.shinyapps.io/DPWeek4Assignment/

