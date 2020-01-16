shinyServer(
    function(input, output) {
        
        output$plot1 <- renderPlotly({
            
            #Render a plot
            states <- map_data("state")
            tn<-subset(states, region %in% c("tennessee"))
            tn_df<-subset(states, region=="tennessee")
            counties<-map_data("county")
            tn_county<-subset(counties, region=="tennessee")
            tn_base <- ggplot(data = tn_df, mapping = aes(x = long, y = lat, group = group)) + 
                coord_fixed(1.3) + 
                geom_polygon(color = "black", fill = "gray")
            tn_base +  
                geom_polygon(data = tn_county, fill = NA, color = "white") +
                geom_polygon(color = "black", fill = NA)
            ditch_the_axes <- theme(
                axis.text = element_blank(),
                axis.line = element_blank(),
                axis.ticks = element_blank(),
                panel.border = element_blank(),
                panel.grid = element_blank(),
                axis.title = element_blank())
            elb<-tn_base + 
                geom_polygon(data = tncopa, aes(fill = Population), color = "white") +
                geom_polygon(color = "black", fill = NA) +
                theme_bw() + ditch_the_axes
            elb<-elb + 
                scale_fill_gradientn(colours = rev(rainbow(7)),
                                     breaks = c(10000, 30000, 100000, 300000, 700000),
                                     trans = "log10")
            ggplotly(elb) %>% 
                layout(lonaxis=list(range=c(-90.1, -82.1)), 
                                   lataxis=list(range=c(35.14, 36.6)))
            
                # hi<-tn_2019$`% LBW`
                # hist(hi, breaks=input$bins, xlab= "Low Birth Weight (percent)", 
                #      main= "Low Birth Weight in Tennessee")
        })
        
        
        
        #Render a barplot
        output$plot2 <- renderPlotly({
            
            c<- tn_2019_hfactors %>% 
                filter(County==input$County) %>% 
                ggplot(aes(x=outcome, y=value)) + 
                geom_bar(position="dodge", stat="identity") +
                ylab("Percentage") +
                xlab("Health Status") +
                ggtitle(input$County)
            ggplotly(c)
            
        })
        
        #Render a barplot
        output$plot3 <- renderPlotly({
            
            M<- mortality %>% 
                filter(County==input$County) %>% 
                ggplot(aes(x=Deaths, y=value)) + 
                geom_bar(position="dodge", stat="identity") +
                coord_flip() +
                ylab("Mortality Rate") +
                xlab("Deaths") +
                ggtitle(input$County)
            ggplotly(M)
            
        })
            
            #Render a barplot
        # output$plot2 <- renderPlot({
        #     hi<-tn_2019$`% LBW`
        #     hist(hi, breaks=input$bins, xlab= "Low Birth Weight (percent)", 
        #          main= "Low Birth Weight in Tennessee")
            # barplot(tn_2019_health[,input$]*1000, 
            #         main=input$region,
            #         ylab="Number of Telephones",
            #         xlab="Year")
        # }) 
        
        
    })

