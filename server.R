# server.R
shinyServer <- function(input, output) {
  library(arules)
  library(arulesViz)
#load and prepare data 
  data <- read.csv2("dataset.csv") 
  splitData <- split(data$ElemID,data$TransID)
  TranData<-as(splitData,"transactions")
  rules<-apriori(TranData,parameter=list(supp=0.002,conf=0.5,target="rules",minlen=2))
  prules <- sort(rules, by="support")
  subrules <- head(sort(rules, by="lift"), 15)
 
  output$plotRulesScatter <- renderPlot({    
    plot(rules, measure=c("support", "lift"), shading="confidence", interactive=FALSE)
  })
  output$freqItem <- renderPlot({
    Support <- input$support
    itemFrequencyPlot(TranData, support = Support, cex.names=0.5) 
  })
  output$plot3 <- renderPlot({
    plot(subrules, method="matrix", measure=c("lift", "confidence"),control=list(reorder=TRUE))
  })
  output$plotGraph <- renderPlot({
    plot(subrules, method="graph", control=list(type="itemsets"))
  })
output$plotMatrix <- renderPlot({
  plot(subrules, method="grouped", control=list(k=20))
})
output$plot1 <- renderPlot({
  plot(subrules, method="graph")
})
}