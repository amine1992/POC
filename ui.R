# ui.R
############################## header #################################
header <-dashboardHeader(title = "My Dashboard")
############################## Slidebar ###############################
sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Widgets", icon = icon("th"), tabName = "widgets",
             badgeLabel = "new", badgeColor = "green")
  ), disable = TRUE
  
)
#############################   Body   ################################
body <- dashboardBody(
  # Setup for first item: dashboard
  tabItems(
    tabItem(tabName = "dashboard",
            fluidRow(
              box(
                title = "Frequent Items", width = 6, status = "primary",
                solidHeader = TRUE,plotOutput("freqItem")
              ),
              fluidRow(
              box(
                title = "Controls the support for the Frequent Items",solidHeader = TRUE,
                #sliderInput("slider", "Number of observations:", 1, 100, 50)
                sliderInput("support", "Support:", min=0.001, max=0.03, value=0.01)
              ),
              box(
                title = "Legends for Itemsets in Antecedent (LHS) in the graph below",solidHeader = TRUE, 
                "
 [1] {127565}        {99683}         {111978,128317} {111978}        {122683}       
 [6] {128222}        {100022}        {129190}        {122653}        {125412}       
[11] {120866}        {104880}        {104880,128317} {122943}        {127564}  "                  
        
              ),
              box(
                title = "Legends for for Itemsets in Consequent (RHS) in the graph below", solidHeader = TRUE,"
 [1] {127564} {104880} {122943} {120866} {128222} {129684} {122686} {118526} {125412}
[10] {122683} {99683}  {111978} {127565}"))
            ),
            fluidRow(
              box(
                title = "Matrix Rules", width = 6,solidHeader = TRUE
                ,status = "danger", color = "aqua",
                "n rules which contain “item in Y axis ” and up to 2 other items in the antecedent and
the consequent is “item in X axis”",background = "red",plotOutput("plotMatrix")
              ),
              box(
                title = "Matrix Rules", width = 6, status = "danger",
                "Matrix-based visualization of two measures with colored squares"
                , solidHeader = TRUE, background = "red", plotOutput("plot3")
              )
              
            ),
            fluidRow(
            
                     box(
                       title = "Graph", width = 6, solidHeader = TRUE, status = "warning",background= "yellow",
                       "Graph-based visualization with itemsets as vertices",plotOutput("plotGraph")
                     ),
                     box(
                       title = "Graph", width = 6, status = "warning",solidHeader = TRUE,background= "yellow",
                       "Graph-based visualization with items and rules as vertices",plotOutput("plot1")
                     )
                
            )
            
    ),
    # Setup for first item: widgets
    tabItem(tabName = "widgets",
            h2("Widgets tab content")
    )
  )
)
shinyUI<-dashboardPage(header, sidebar, body)