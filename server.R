library(datasets)
library(shiny)

# Define server logic for slider 
shinyServer(function(input, output) {
    
    # Reactive expression to compose a data frame containing all of
    # the values
    sliderValues <- reactive({
        # Perform linear regression on the input data
        
        fit <- lm(log(Volume) ~ log(Girth) + log(Height), data = trees)
        volume <- round(exp(predict(fit, data.frame(Girth=input$girth, Height=input$height))), digits=2)
        
        # Compose data frame
        data.frame(
            Name = c("Girth in inches (Input)", 
                     "Height in feet (Input)",
                     "Volume in cubic ft (Predicted)"),
            Value = as.character(c(input$girth, 
                                   input$height,
                                   volume)), 
            stringsAsFactors=FALSE)
    }) 
    
    # Show the values using an HTML table
    output$values <- renderTable({
        sliderValues()
    })
})