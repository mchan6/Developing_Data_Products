shinyUI(fluidPage(
  titlePanel(h1("Soulmate Calculator")),
  
  sidebarLayout(
    sidebarPanel(h4("Preferences and Background"),
                 selectInput('Gender', 'Choose Sex', c('Male', 'Female')),
                 sliderInput("Age", label = h5("How Old are You?"),min = 0, max = 120, value = 30),
                 helpText("Select Age"),
                 sliderInput("Looks", label = h5("How Important are Looks?"),min = 1, max = 5, value = 3),
                 helpText("1: Not Important; 5: Very Important"),
                 sliderInput("Personality", label = h5("How Important is Personality?"),min = 1, max = 5, value = 3),
                 helpText("1: Not Important; 5: Very Important"),
                 sliderInput("Chemistry", label = h5("How Important is Chemistry?"),min = 1, max = 5, value = 3),
                 helpText("1: Not Important; 5: Very Important")),
    
    mainPanel(
      img(src = "Soulmate.jpg", height = 150, width = 300),
      h4("Data Sources Documentation"),
      h5("This application calculates the number of potential soulmates in NYC, based on some basic preferences that you choose."),
      wellPanel(
        helpText( a("Census Data for NYC",href="http://quickfacts.census.gov/qfd/states/36/3651000.html")
        )
      ),
    
      textOutput("text1"),
      tableOutput("values"),
      uiOutput('ex1'),
      h3("Your Potential Soulmates"),
      textOutput("res"),
      br(),
      br(),
      br()
      )
  )))