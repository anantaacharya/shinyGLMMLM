library(shiny)
 
shinyUI(pageWithSidebar(
 
  headerPanel("GLM MLM p values"),
 
  sidebarPanel(
 
    
      selectInput("GLMMLM", "GLMMLM:",
                   c("GLM" ,
                     "MLM" ,
                     "K-EMMA" ,
                      "K-SSR"), selected="K-EMMA", multiple=TRUE)
 
      
    ,
 
   
      selectInput("model", "model:",
                   c("NAIVE" ,
                     "PC" ,
                     "Q" ), selected="Q", multiple=TRUE)
 
      
    ,

 
    selectInput("df", "data:",
                   c("10k20" ,
                     "10k50" ,
                     "UNEAK3" ,
                      "UNEAK4",
                      "UNEAK8" ,
                      "UNEAK9"),selected="10k20", multiple=TRUE)
 
     
    
 
    
 
    
  ),
 
  mainPanel(
    plotOutput(outputId = "main_plot")
 
  
 
  )
))
