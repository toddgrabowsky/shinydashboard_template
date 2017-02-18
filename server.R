library(shiny)
library(shinydashboard)
library(yaml)

# create vector of individual app folder names
apps <- list.dirs("apps", full.names=FALSE, recursive = FALSE)

shinyServer(function(input, output, session) { 
  
  # create sidebar menu
  output$sideMenu <- renderUI({
    items <- lapply(apps, function(app) {
      cfg <- yaml.load_file(file.path("apps", app, "config.yml"))
      menuItem(cfg$name, tabName=app, icon=icon(cfg$icon))
    })
    
    dash <- menuItem("Dashboard", tabName="dashboard", icon=icon("dashboard"))
    items <- c(list(dash), items)
    
    tagAppendChild(sidebarMenu(id="sidebartabs"), items)
  })

  # create tabItems for dashboard body
  output$sideTabs <- renderUI({
    # loop through apps folder and pull in ui.R code for each individual app
    tabs <- lapply(apps, function(app) {
      tabItem( tabName=app, source(file.path("apps", app, "ui.R"), local=TRUE, echo=FALSE)[1] )
    })
    
    # add the dashboard.R code as the first tabItem in tabItems
    dashTab <- tabItem( tabName = "dashboard", source("apps/dashboard.R", local=TRUE)[1] )
    tabs <- list(dashTab, tabs)
    
    tagAppendChild(tabItems(), tabs)
  })
  
  #########################
  # 
  # server code for dashboard.R
  # 
  #########################
  output$followers <- renderValueBox({
    invalidateLater(2500)
    valueBox("Followers", value=sample(50:1000, 1), icon=icon("users"), color="blue")
  })
  
  output$likes <- renderValueBox({
    invalidateLater(1000)
    valueBox("Likes", value=sample(500:1000, 1), icon=icon("thumbs-up"), color="green")
  })
  
  output$unique_visitors <- renderValueBox({
    invalidateLater(4000)
    valueBox("Unique Visitors", value=sample(10:500, 1), icon=icon("user-plus"), color="yellow")
  })
  

  # loop through apps folder and pull in server.R code for each individual app
  lapply(apps, function(app) {
    source(file.path("apps", app, "server.R"), local=TRUE)
  })
  
  isolate({updateTabItems(session, "sidebartabs", "dashboard")})
  
})