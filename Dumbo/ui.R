### SHINY UI ###
library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Word Predictor: Version Dumbo (single prediction)"),
  sidebarPanel(
    h3("Hello, I'm Dumbo"),
    p("Type in part of a sentence and I'll give you a suggestion for the next word"),
    textInput("x", "Feed me words:"),
    submitButton("Predict")
  ),
  mainPanel(
    h3("Here's my best guess, and the degree of precision"),
    
    tableOutput("tab")
  )
)
)