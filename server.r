library(shiny)
library(ggplot2)


masterglmmlm.test <- read.csv("masterglmmlm.q.csv", header=T, stringsAsFactors=FALSE)
#make everythong character
masterglmmlm.test[,1]<-as.character(masterglmmlm.test[,1])
masterglmmlm.test[,2]<-as.character(masterglmmlm.test[,2])
masterglmmlm.test[,12]<-as.character(masterglmmlm.test[,12])
masterglmmlm.test[,13]<-as.character(masterglmmlm.test[,13])
masterglmmlm.test[,14]<-as.character(masterglmmlm.test[,14])
masterglmmlm.test[,15]<-as.character(masterglmmlm.test[,15])

shinyServer(function(input, output) {
 
 
   
 
  output$main_plot <- renderPlot({
    #get subset of data based on selection
    plot.temp <- reactive({
    
    tr1=vector(mode="character")
    if (input$ALL) {
      tr1<-c(tr1,"yBLUP")
    }
     if (input$ATH) {
      tr1<-c(tr1,"yBLUPATH")
    }
     if (input$ARD) {
      tr1<-c(tr1,"yBLUP.ARD")
    }
    
    #if else for kinships
    gl1=vector(mode="character")
    if (input$GLM) {
      gl1<-c(gl1,"GLM")
    }
    if (input$MLM) {
      gl1<-c(gl1,"MLM")
    }
    if (input$K-SSR) {
      gl1<-c(gl1,"K-SSR")
    }
    if (input$K-EMMA) {
      gl1<-c(gl1,"K-EMMA")
    }
   model1<-vector(mode="character")
   if (input$NAIVE) {
      model1<-c(model1,"NAIVE")
    }
    if (input$PC) {
      model1<-c(model1,"PC")
    }
    if (input$Q) {
      model1<-c(model1,"Q")
    }
   
   
   df1<-vector(mode="character")
   if (input$s10k20) {
      df1<-c(df1,"10k20")
    }
    if (input$s10k50) {
      df1<-c(df1,"10k50")
    }
    if (input$UNEAK3) {
      df1<-c(df1,"UNEAK3")
    }
    if (input$UNEAK4) {
      df1<-c(df1,"UNEAK4")
    }
    if (input$UNEAK8) {
      df1<-c(df1,"UNEAK8")
    }
    if (input$UNEAK9) {
      df1<-c(df1,"UNEAK9")
    }
   
  
   gl1<-c("MLM","K-EMMA")
df1<-c("10k20","UNEAK9")
model1<-c("PC","Q")
 tr1<-c("yBLUP")
   masterglmmlm.test[masterglmmlm.test$Trait %in% tr1 & masterglmmlm.test$GLMMLM %in% gl1 & masterglmmlm.test$model %in% model1 & masterglmmlm.test$df %in% df1,,drop=FALSE]
    
  })
   
    p<-ggplot(aes(pos, -log10(p), colour=interaction(GLMMLM, model)), data=plot.temp())+geom_point(aes(shape=df))+facet_wrap(~Locus)
   
    print(p)
  })

})
