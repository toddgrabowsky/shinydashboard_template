# Sidebar with a slider input for number of bins
fluidPage(
  fluidRow(
    column(6, 
      box(status="primary", title="Test App 1", width=NULL,
        sliderInput("bins1",
                    "Number of bins:",
                    min = 1,
                    max = 50,
                    value = 30)
      ),
    
      # Show a plot of the generated distribution
      box(status="warning", title="Histogram 1", width=NULL,
        plotOutput("dPlot")
      )
    ),
    column(6, 
      box(collapsible=T, width=NULL,
         dataTableOutput("tbl")
      )
    )
  )
  
)

