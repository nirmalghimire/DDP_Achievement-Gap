
library(shiny)

shinyUI(fluidPage(
    titlePanel("Predicting Number of Residents based on Key Variables"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderFreq", "What is the Frequency of the Residents?", 3, 86, value=30),
            checkboxInput("showModel1", "Show/Hide Level of Satisfaction", value = TRUE),
            checkboxInput("showModel2", "Show/Hide Perceived Degree of Influence", value = TRUE),
            checkboxInput("showModel3", "Show/Hide Type of Accommodation", value = TRUE),
            checkboxInput("showModel4", "Show/Hide Contact with Residents", value = TRUE),
            submitButton("Submit")
        ),
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted Frequency from Level of Satisfaction:"),
            textOutput("pred1"),
            h3("Predicted Frequency from Perceived Degree of Influence:"),
            textOutput("pred2"),
            h3("Predicted Frequency from Type of Accommodation:"),
            textOutput("pred3"),
            h3("Predicted Frequency from Contact with Other Residents:"),
            textOutput("pred4")
        )
    )
))
