### SHINY SERVER ###

library(shiny);library(stylo);library(SnowballC)

load('data/session.RData', envir = .GlobalEnv)

source("./Dumbo.R")

shinyServer(
  function(input, output){
    
    a<-reactive({as.character(input$x)})
    
    output$tab<-renderTable({
      PredictMe(a())
    })
    
  }
  
)