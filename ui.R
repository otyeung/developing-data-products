library(shiny)

# Define UI for application
shinyUI(fluidPage(
    
    #  Application title
    titlePanel("Predicting Volume of Black Cherry Trees"),
    
    # Sidebar with sliders that demonstrate various available
    # options
    sidebarLayout(
        sidebarPanel(
            sliderInput("girth", "Girth:", 
                        min = 5, max = 25, value = 13.0, step= 0.1),
            
            # Simple integer interval
            sliderInput("height", "Height:", 
                        min = 56, max = 100, value = 76, step= 0.1)
            
        ),
        
        # Show a table summarizing the values entered
        mainPanel(
            tableOutput("values"),
            h3("Documentation"),
            p("In this simple application, the 'trees' dataset from 'datasets' package is used."),
            p("This data set provides measurements of the girth, height and volume of timber in 31 felled black cherry trees. Note that girth is the diameter of the tree (in inches) measured at 4 ft 6 in above the ground."),
            p("This dataset includes 31 observations on 3 variables."),
            h6("[,1]    Girth	numeric	Tree diameter in inches"),
            h6("[,2]    Height	numeric	Height in ft"),
            h6("[,3]    Volume	numeric	Volume of timber in cubic ft"),
            p("We are fitting a linear model using Girth and Height as predictors and Volume as response, based on the following formula :"),
            code("lm(log(Volume) ~ log(Girth) + log(Height))"),
            br(""),
            p("You may adjust the sliders to see new predicted Volume based on the above model.")
        )
    )
))