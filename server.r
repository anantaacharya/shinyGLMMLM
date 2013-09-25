library(shiny)
library(ggplot2)


masterglmmlm.test <- read.csv("masterglmmlm.q.csv")

 
shinyServer(function(input, output) {
 

 
  output$main_plot <- renderPlot(function(){
    #get subset of data based on selection
   gl1<-input$GLMMLM
   df1<-input$df
   model1<-input$model1
#gl1<-c("MLM","K-EMMA")
#df1<-c("10k20","UNEAK9")
#model1<-c("PC","Q")
 #plot.temp<-masterglmmlm.test
    plot.temp<-masterglmmlm.test[masterglmmlm.test$GLMMLM %in% gl1 & masterglmmlm.test$model %in% model1 & masterglmmlm.test$df %in% df1,,drop=FALSE]
    p<-ggplot(aes(pos, -log10(p), colour=interaction(GLMMLM, model)), data=plot.temp)+geom_point(aes(shape=df))+facet_wrap(~Locus)
   
    print(p)
  })
 
 
})
