
library(shiny)
library(XML)
library(arcdiagram)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  
  output$arcs <- renderPlot({
    
    req(input$sentence)
    
    a <- append('<?xml version="1.0" encoding="UTF-8"?>', input$sentence)
    doc <- xmlTreeParse(a)
    top <- xmlRoot(doc)
    b <- xmlSApply(top, function(x) xmlGetAttr(x, "id"))
    c <- xmlSApply(top, function(x) xmlGetAttr(x, "head"))
    
    b <- as.numeric(b)
    c <- as.numeric(c)
    
    edge.matrix <- matrix(b, ncol=1)
    edge.matrix <- cbind(edge.matrix, c)
    
    index <- which(edge.matrix[, 2] > 0)
    # Use "index" to create new matrix.
    short.edge.matrix <- edge.matrix[index, ]
    
    # Call "archplot()" to create diagram to visualize edge crossing in sentences.
    arcplot(short.edge.matrix, las = 1, sorted = TRUE, lwd.arcs = 7 )
    
    
  })
  
  
  
}
