library(shiny)
library(shinydashboard)

header <- dashboardHeader(title = "ShinyDashboard Template", titleWidth=sidebar_width)

sidebar <- dashboardSidebar(width=sidebar_width, 
  sidebarSearchForm(textId = "searchText", buttonId = "searchButton", label = "Search..."),
  sidebarMenu( uiOutput("sideMenu") )
)

body <- dashboardBody( 
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
  )
  ,uiOutput("sideTabs")
)

shinyUI(dashboardPage(header, sidebar, body, skin = "blue"))