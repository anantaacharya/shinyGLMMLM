library(shiny)
 
shinyUI(pageWithSidebar(
 
  headerPanel("GLM MLM p values"),
 
  sidebarPanel(
 
    wellPanel(
      selectInput("GLMMLM", "GLMMLM:",
                   c("GLM" = "GLM",
                     "MLM" = "MLM",
                     "K-EMMA" = "K-EMMA",
                      "K-SSR"="K-SSR"), selected="K-EMMA", multiple=TRUE)
 
      
    ),
 
   wellPanel(
      selectInput("model", "model:",
                   c("NAIVE" = "NAIVE",
                     "PC" = "PC",
                     "Q" = "Q"), selected="Q", multiple=TRUE)
 
      
    ),

  wellPanel(
    selectInput("df", "data:",
                   c("10k20" = "10k20",
                     "10k50" = "10k50",
                     "UNEAK3" = "UNEAK3",
                      "UNEAK4"="UNEAK4",
                      "UNEAK8" = "UNEAK8",
                      "UNEAK9"="UNEAK9"),selected="10k20", multiple=TRUE)
 
     
    )
 
    
 
    
  ),
 
  mainPanel(
    plotOutput(outputId = "main_plot")
 
  
 
  )
))
