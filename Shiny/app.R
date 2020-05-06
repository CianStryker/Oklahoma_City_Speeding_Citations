#Shiny is kinda complicated, but step one is still just to load in packages

library(shinythemes)
library(shiny)
library(sf)
library(ggspatial)
library(png)
library(shinyanimate)
library(gifski)
library(transformr)
library(readr)
library(gganimate)
library(fs)
library(tidyverse)


# Define UI for application 
ui <- fluidPage(theme = shinytheme("superhero"),
                
                
                #Navbar page is the setup that makes the most sense to me. 
                
                navbarPage(
                    
                    #Gotta have a title
                    title = "Speeding Citations in Oklahoma City",
                        
                    #Make the first panel that just says "About" and then I do some formatting with the margins before I write in 
                      #the info I needed.
                    
                    tabPanel(
                        
                        title = "Project", 
                        
                        fluidRow(
                            
                            column(width = 4),
                            
                            column(width = 4,
                                   
                                   tags$h1("Map"), 
                                   
                                   tags$br(),
                                   
                                   plotOutput(outputId = "map3"), 
                                   
                                   tags$br(),
                                   
                            ),
                                   
                            column(width = 4)
                            
                            ),
                        
                        fluidRow(
                                   
                            column(width = 4),
                            
                            column(width = 4,
                                   
                                   tags$br(),
                                   tags$br(),
                                   tags$br(),
                                   
                                   tags$h1("Data"), 
                                   
                                   tags$p("The data for this map is from the Stanford Open Policing Project. The map itself shows every citation given to Oklahoma Drivers by police divisions of Santa Fe and Springlake. The only citations included were 'high-speed' violations or any citations for speeding above 15 mph between 2011 and 2016. "), 
                                   
                                   tags$h1("About me"), 
                                   
                                   tags$p("My name is Cian Stryker and I am a Havard Graduate student studying Russian, Eastern European, and Central Asian studies. More importantly, I am a student in the GOV 1005 (Data) course and publishing this map is a requirement of my course. ") 
                            ),
                            
                            column(width = 4)
                                   

                            ),
                            
                        )
                        
                    )
                    
                    #Second panel where my graph actually is. Then I just put a plotoutput command to bring it in from the server

                    
                
                
)

# Define server logic 
server <- function(input, output) {

  
  #So this was kinda tricky because my map is animated. But essentially the key here is to save it as a gif file and use renderImage to grab thhe gif I made. 
  #The other key is to save the contents as a list before it all works together. 

    output$map3 <- renderImage({
      filename <- normalizePath(file.path(".", paste("map.gif")))
      
      list(src = filename)
    },deleteFile = FALSE
    )
    
    
   
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
