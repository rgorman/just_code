library(shiny)
library(XML)
library(arcdiagram)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Visualize sentence planarity"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = "sentence",
                label = "Insert xml of single sentence dependency tree:"
      )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(h1("Crossed arcs indicate non planar nodes."),
              plotOutput(outputId = "arcs")
    )
    
    
    
  )
)

