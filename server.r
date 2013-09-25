library(shiny)
library(ggplot2)


masterglmmlm.test <- read.csv("masterglmmlm.q.csv", stringsAsFactors=F)

 
shinyServer(function(input, output) {
 output$textout<-renderText({input$GLMMLM})

 
  output$main_plot <- renderPlot({
    #get subset of data based on selection
    plot.temp <- reactive({
    tr1<-input$Trait
    gl1<-input$GLMMLM
   df1<-input$df
   model1<-input$model1
   #tr1<-c("ALL")
   #gl1<-c("MLM","K-EMMA")
#df1<-c("10k20","UNEAK9")
#model1<-c("PC","Q")
 
    subset(masterglmmlm.test,Trait %in% tr1 & GLMMLM %in% gl1 & model %in% model1 & df %in% df1,drop=FALSE)
    
  })
   tr1<-c("ALL")
   gl1<-c("MLM","K-EMMA")
df1<-c("10k20","UNEAK9")
model1<-c("PC","Q")
 
    m2<-subset(masterglmmlm.test,Trait %in% tr1 & GLMMLM %in% gl1 & model %in% model1 & df %in% df1,drop=FALSE)
    

    
    p<-ggplot(aes(pos, -log10(p), colour=interaction(GLMMLM, model)), data=m2)+geom_point(aes(shape=df))+facet_wrap(~Locus)
   
    print(p)
    
     q<-ggplot(aes(pos, -log10(p), colour=interaction(GLMMLM, model)), data=plot.temp())+geom_point(aes(shape=df))+facet_wrap(~Locus)
   
    print(q)
    
  })
  
  
 
 
})
