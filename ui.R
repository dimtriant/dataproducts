library(shiny)

shinyUI(navbarPage("Menu",
  tabPanel("Application",
    pageWithSidebar(
    headerPanel("Average MPG for Cylinders"),
    sidebarPanel(
      sliderInput('cylinders', 'Select Number of Cylinders' , 6, min = 4, max = 8, step = 2)
    ),
    mainPanel(
      h3('Results'),
      h4('Cylinders you selected'),
      verbatimTextOutput("inputValue"),
      h4('Sample Size'),
      verbatimTextOutput("count"),
      h4('Average MPG'),
      verbatimTextOutput("average"),
      h4('Car with Max MPG for given Cylinders'),
      verbatimTextOutput("max"),
      
      plotOutput('Hist')
    )
  )
),
  tabPanel("Help",
      h3('Summary'),
      p('This application was created in order to facilitate the calculation of the average mpg for a given number of cylinders. The dataset used is the mtcars dataset, which needs to be loaded for the app to function. Use the command', 
      code("data(mtcars)"),
      'to load the dataset.'),
      h3('Input Selection'),
      p('When launched, the application will make calculations based on a value of 6 cylinders. To change the number of cylinders, use the slider provided at the left of the screen'),
      h3('Output Explanation'),
      p('The results tab on the right of the page displays the following 4 calculations:'),
      list(
        p(strong("1) Cylinders you selected:"), "This is a confiramtion of the output, so if you select 4 cylinders this box will display 4"),
        p(strong("2) Sample Size:"), "This is the count of the cars in the dataset with the selected number of cylinders"),
        p(strong("3) Average MPG:"), "This is the average of the MPG observed in the cars with the selected number of cylinders"),
        p(strong("4) Car with Max MPG for given Cylinders:"), "This is the car make and type that has the maximum MPG for a given number of cylinders")
      ),
      p('Additionally, a histogram is displayed that shows where the MPG of the Car with Max MPG falls within the population of MPGs contained in the mtcars dataset')
      
      )

)
)