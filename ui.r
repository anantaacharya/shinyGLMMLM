library(shiny)
 
shinyUI(pageWithSidebar(
 
  headerPanel("GLM MLM p values"),
 
  sidebarPanel(
 
    selectInput("Trait", "Trait:",
                   list("ALL"="ALL",
                     "ATH"="ATH" ,
                     "ARD"="ARD" 
                      ), selected="ALL", multiple=TRUE)
 
      
    ,
 
    
    
      selectInput("GLMMLM", "GLMMLM:",
                   list("No Q"="No Q" ,
                     "K-TASSEL"="K-TASSEL" ,
                     "K-EMMA" ="K-EMMA",
                      "K-SSR"="K-SSR"), selected="K-EMMA", multiple=TRUE)
 
      
    ,
 
   
      selectInput("model", "model:",
                   list("No kinship" ="No kinship",
                     "PC" ="PC",
                     "Q3" ="Q3"), 
                     "Q2" ="Q2"),selected="Q", multiple=TRUE)
 
      
    ,

 
    selectInput("df", "data:",
                   list("10k20" ="10k20",
                     "10k50" ="10k50",
                     "UNEAK3" ="UNEAK3",
                      "UNEAK4"="UNEAK4",
                      "UNEAK8" ="UNEAK8",
                      "UNEAK9"="UNEAK9"),selected="10k20", multiple=TRUE)
 
     
    
 
    
 
    
  ),
 
  mainPanel(
   htmlOutput(outputId="textout"),
    plotOutput(outputId = "main_plot")
 
  
 
  )
))
