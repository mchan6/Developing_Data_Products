shinyServer(function(input, output) {
  
  output$text1=renderText("You selected the values")
  #This is the reactive expression that produces a data frame from the responses
  sliderValues <- reactive({
    
    # Compose data frame
    data.frame(
      Name = c("Gender", 
               "Age",
               "Looks",
               "Personality",
               "Chemistry"),
      Value = as.character(c(input$Gender, 
                             input$Age,
                             input$Looks,
                             input$Personality,
                             input$Chemistry)), 
      stringsAsFactors=FALSE)
  }) 
  
  # Show the values using an HTML table
  output$values <- renderTable({
    sliderValues()
  })
  
  output$res <- renderText({
    pop = .5*19378102
    if(input$Gender == 'Male') {
      sub_pop <- pop * .6
    }
      else {
        sub_pop <- pop*.4
    }
    
    if(input$Age < 30) {
      sub_pop2 <- sub_pop*.4
    } else if (input$Age < 40) {
      sub_pop2 <- sub_pop*.3
    } else if (input$Age < 50) {
      sub_pop2 <- sub_pop *.2
    } else if (input$Age < 60) {
      sub_pop2 <- sub_pop *.15
    } else if (input$Age < 70) {
      sub_pop2 <- sub_pop *.1
    }
    else sub_pop2 <- sub_pop * .05
    
    prettyNum(round((sub_pop2*(1/(input$Looks*4))*(1/(input$Personality*4))*(1/(input$Chemistry*4))),digits=0),big.mark=",",scientific=FALSE)
    
  })
})