#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ISLR)
library(ggplot2)
# Define UI for the application
shinyUI(fluidPage(
    titlePanel("Age vrs Wage "),
    sidebarLayout(
        sidebarPanel(
            #defining Slider according laboring age
            sliderInput("sliderMPG", "What is the Age?", 18, 80, value = 20),
            #defining education levels
            selectInput("education", "Education:", 
                        c("1. < HS Grad" = "1. < HS Grad",
                          "2. HS Grad" = "2. HS Grad",
                          "3. Some College" ="3. Some College",
                          "4. College Grad" ="4. College Grad",
                          "5. Advanced Degree" ="5. Advanced Degree"))
        ),
        mainPanel(
            plotOutput("plot1"),
            h2("Predicted Wage"),
            textOutput("pred1")
        )
    )
))