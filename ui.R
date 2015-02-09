library(shiny)

## Cosmicflows-2 catalog

# Define UI  application that plots random distributions 
shinyUI(pageWithSidebar(
        
        # Application title
        headerPanel("Determine Hubble constant from Galaxy Data"),
        
        
        
        # Sidebar with a slider input for number of observations
        sidebarPanel(
                sliderInput("obs", 
                            "Number of Galaxies:", 
                            min = 10,
                            max = length(galaxy$GV), 
                            value = 100,
                            step = 10)
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
                
                        p('This application uses the distance and recession velocity for 8315 galaxies, compiled by Tulley et al. (2013). 
                          The independently determined distances and recession velocities are plotted and a regression line determined for
                          the resulting relationship.  The slope of the line gives the value of the Hubble Constant.'),
                        p('The Hubble Constant is a measure of the expansion rate of the universe, the value of which helps determine the overall geometry of the 
                          universe and its eventual fate.'),
                        p('Changing the slider value determines how many galaxies are plotted and the Hubble Constant is determined using the sample.
                          The complete dataset is re-sampled for each selection.  Refreshing the page also re-samples the dataset, using 100 of the
                        galaxies.'),
                        p('Reference:'), em( 'Tully R. B. et al., 2013, AJ, 146, 86'),
                
                plotOutput("galaxyPlot"),
                verbatimTextOutput("summary")
        ) 
        
))
