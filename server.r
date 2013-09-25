library(shiny)
library(ggplot2)


masterglmmlm.test <- read.csv("masterglmmlm.q.csv", stringsAsFactors=FALSE)

 
shinyServer(function(input, output) {
 
 output$textout<-renderText({
 gl1=vector()
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
   model1<-vector()
   if (input$NAIVE) {
      model1<-c(model1,"NAIVE")
    }
    if (input$PC) {
      model1<-c(model1,"PC")
    }
    if (input$Q) {
      model1<-c(model1,"Q")
    }
   
   
   df1<-vector()
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
   
   print(paste(df1, model1, gl1))
 })
 
   
 
  output$main_plot <- renderPlot({
    #get subset of data based on selection
    plot.temp <- reactive({
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
   
  
   #gl1<-c("MLM","K-EMMA")
#df1<-c("10k20","UNEAK9")
#model1<-c("PC","Q")
 
    masterglmmlm.test[masterglmmlm.test$GLMMLM %in% gl1 & masterglmmlm.test$model %in% model1 & masterglmmlm.test$df %in% df1,,drop=FALSE]
    
  })
   

    
    p<-ggplot(aes(pos, -log10(p), colour=interaction(GLMMLM, model)), data=plot.temp())+geom_point(aes(shape=df))+facet_wrap(~Locus)
   
    print(p)
  })
  
  
 
 
})
