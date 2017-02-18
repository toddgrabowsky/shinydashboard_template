# Sidebar with a slider input for number of bins
sidebarLayout(
  sidebarPanel(
    h3("Test App 2"),
    sliderInput("bins2",
                "Number of bins:",
                min = 1,
                max = 50,
                value = 30)
  ),
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("dPlot2")
  )
)

