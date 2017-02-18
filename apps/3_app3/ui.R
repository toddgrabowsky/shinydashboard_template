# Sidebar with a slider input for number of bins
fluidPage(
  fluidRow(
    box(title="Test App 3", solidHeader=TRUE, collapsible=TRUE, status="danger", width=NULL,
      sliderInput("bins3",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    )
  ),
  # Show a plot of the generated distribution
  fluidRow(
    box(title="Plot", solidHeader=TRUE, collapsible=TRUE, status="info",
      plotOutput("dPlot3")
    ),
    box(title="Data", solidHeader=TRUE, collapsible=TRUE, status="success",
      dataTableOutput("tbl2")    
    )
  )
)

