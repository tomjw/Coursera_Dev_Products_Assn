library(shiny)
library(ggplot2)

## load data
## data from  Tully R. B. et al., 2013, AJ, 146, 86

galaxy <- read.csv('galaxy.csv', sep = '|')

#  generate and plot 
shinyServer(function(input, output) {
        #  plot data using sample size determined by slide, default value 100
        output$galaxyPlot <- renderPlot({
                galaxy2 <<- galaxy[sample(1:nrow(galaxy), input$obs),]
                hubble <<- lm( GV ~ Dist-1, galaxy2)
                ggplot(galaxy2, aes(Dist, GV)) + geom_point(shape = 1, cex = 0.3, 
                        color = 'blue', alpha = 0.5) + 
                        geom_abline(intercept = 0, slope = hubble$coefficients[[1]]) +
                        scale_x_continuous(limits = c(0, 500)) +
                       scale_y_continuous(limits = c(-0, 30000))+
                        theme_bw() + ylab('Recession Velocity (km/s)') +
                        xlab('Distance (Megparsecs(Mpc))')
         })

        ## print the value of the regression coefficient,  which equates to Hubble constant
        output$summary <- reactive({
                a <- input$obs
                paste('Hubble Constant is ',  round(hubble$coefficients[[1]],2), '(km/s)/Mpc') 
       
        })    
  }
)