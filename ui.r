library(shiny)
 
shinyUI(pageWithSidebar(
 
  headerPanel("GLM MLM p values"),
 
  sidebarPanel(
 
   wellPanel(
    
    checkboxInput("ALL",    label = "ALL",  TRUE),
    checkboxInput("ARD",    label = "ARD"),
    checkboxInput("ATH",    label = "ATH"),
    
      
 
      
    ),
 
 
    wellPanel(
    
    checkboxInput("GLM",    label = "GLM"),
    checkboxInput("MLM",    label = "MLM"),
    checkboxInput("K-EMMA",    label = "K-EMMA", TRUE),
    checkboxInput("K-SSR",    label = "K-SSR")
      
 
      
    ),
 
   wellPanel(
   
   checkboxInput("NAIVE",    label = "NAIVE"),
    checkboxInput("PC",    label = "PC"),
    checkboxInput("Q",    label = "Q", TRUE)
    
      
    ),

 wellPanel(
 
 
 checkboxInput("s10k20",    label = "s10k20", TRUE),
    checkboxInput("s10k50",    label = "s10k50"),
    checkboxInput("UNEAK3",    label = "UNEAK3"),
    checkboxInput("UNEAK4",    label = "UNEAK4"),
    checkboxInput("UNEAK8",    label = "UNEAK8"),
    checkboxInput("UNEAK9",    label = "UNEAK9")
    

 
   ) 
  ),
 
  mainPanel(
   htmlOutput(outputId="textout"),
    plotOutput(outputId = "main_plot")
 
  
 
  )
))
