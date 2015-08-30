### SHINY UI ###
library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Word Predictor: Version Dumbo (w. options)"),
  sidebarPanel(
    h3("Hello, I'm Dumbo"),
    p("Type in part of a sentence and I'll give you 3 suggestions for the next word"),
    textInput("x", "Feed me words:"),
    submitButton("Predict")
  ),
  mainPanel(
    h3("Here's my best guess, and the degree of precision"),
    
    tableOutput("tab")
  )
)
)