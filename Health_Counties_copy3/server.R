shinyServer(
    function(input, output) {
        
        output$histogram <- renderPlot({
                hi<-tn_2019$`% LBW`
                hist(hi, breaks=input$bins, xlab= "Low Birth Weight (percent)", 
                     main= "Low Birth Weight in Tennessee")
        })
        
        
    })

