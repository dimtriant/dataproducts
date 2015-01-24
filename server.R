library(shiny)
data(mtcars)
library(ggplot2)

countMPG <- function(cylinders) length(mtcars[which(mtcars$cyl==cylinders),"mpg"])
aveMPG <- function(cylinders) mean(mtcars[which(mtcars$cyl==cylinders),"mpg"])
maxMPG <- function(cylinders) row.names(subset(mtcars, cyl==cylinders)[which.max(subset(mtcars, cyl==cylinders)$mpg),])
best <- function(cylinders) subset(mtcars, cyl==cylinders)[which.max(subset(mtcars, cyl==cylinders)$mpg),"mpg"]

shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({input$cylinders})
    output$count <- renderPrint({countMPG(input$cylinders)})
    output$average <- renderPrint({aveMPG(input$cylinders)})
    output$max <- renderPrint({maxMPG(input$cylinders)})
    output$Hist <- renderPlot({
      hist(mtcars$mpg, xlab='MPG', col='lightblue',main='MPG Histogram')
      lines(c(best(input$cylinders), best(input$cylinders)), c(0, 14),col="red",lwd=5)
    })
  }
)