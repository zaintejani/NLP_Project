# Natural Language Processing Project: Word Predictor app
Slides, code, and certain datasets for my NLP Word Predictor project. The two versions of this app, Dumbo and Dumbo3, provide 1 and 3 suggestions for the next word in an incomplete sentence, using an n-grams based backoff model with a maximum precision of 5-gram. The data used for n-gram creation was raw text mined from twitter feed, blog entries, and news articles, to provide an appropriate sample of the nature of modern language.

  **Dumbo and Dumbo3:** These folders contain the server.R, ui.R, and prediction scripts for each version of the app, along with the final data tables.

  **Data cleaning scripts:** This folder contains scripts used for cleaning and processing raw data into n-gram tables, as well as the raw training sample for the model and the final data tables.

  **Slides:** This folder contains a deck of 5 HTML5 slides to pitch the app and provide details, written using the Rpubs package in RStudio. These slides can be viewed by downloading the file, or alternatively by copying the source code and saving with an HTML extension.

  **Links** to each of the apps can be found below (Hosted on shinyapps.io)

  [Dumbo](http://zaintejani.shinyapps.io/Dumbo/)

  [Dumbo3](http://zaintejani.shinyapps.io/Dumbo3/)
