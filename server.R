#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ISLR)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    data(Wage)
    
#  Creating the output based on the plot
    output$plot1 <- renderPlot({
        #  First define the variables        
        subWage <- subset(Wage,education==input$education)
        model1 <- lm(wage ~ age, data = subWage)
        #  plotting data
        qq <- qplot(age,wage,colour = education,data = subWage)
        qq <- qq + geom_smooth (method= 'lm',formula= y~x)
        plot(qq)
            })
    
    
    
    
    model1pred <- reactive({
        #  First define the variables
        subWage <- subset(Wage,education==input$education)
        model1 <- lm(wage ~ age, data = subWage)
        # predicting Wage
        mpgInput <- input$sliderMPG
        predict(model1, newdata = data.frame(age = mpgInput))
    })
   
    

    output$pred1 <- renderText({
        model1pred()
    })
   
})