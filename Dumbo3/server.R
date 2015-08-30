### SHINY SERVER ###

library(shiny);library(stylo);library(SnowballC)

load('data/session.RData', envir = .GlobalEnv)

source("./Options.R")

shinyServer(
  function(input, output){
    
    a<-reactive({as.character(input$x)})
    
    output$tab<-renderTable({
      Predict3(a())
    })
    
  }
  
)