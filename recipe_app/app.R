#######################################X
#----Brian and Simona's Recipe Book----X
#-----------Shiny Recipe App-----------X
#--------------Main app.R--------------X
#######################################X

#Getting started with shinydashboard: https://rstudio.github.io/shinydashboard/get_started.html

#Set options----
options(stringsAsFactors = FALSE)

#Load packages----
library(shiny)
library(shinydashboard)

#Load modules----
source("init.R")
source("viewer.R")
# source("editor.R")
# source("creator.R")

#Define UI----
ui <- dashboardPage(
  #... Dashboard header----
  dashboardHeader(title = "Recipe Book App"),
  #... Dashboard sidebar----
  dashboardSidebar(
    sidebarMenu(
      menuItem("View Recipes", tabName = "viewer", icon = icon("eye")),
      menuItem("Edit Recipes", tabName = "editor", icon = icon("edit")),
      menuItem("New Recipe", tabName = "creator", icon = icon("utensils")),
      menuItem("Github Repo", icon = icon("file-code-o"), 
               href = "https://github.com/bsmity13/recipe_book/")
    )
  ),
  #... Dashboard body----
  dashboardBody(
    tabItems(
      #... ... Viewer content----
      tabItem(tabName = "viewer",
              fluidRow(v_chooser),
              fluidRow(v_ingred, v_img),
              fluidRow(v_steps)
              ),
      #... ... Editor content----
      tabItem(tabName = "editor",
              fluidRow()
      ),
      #... ... Creator content----
      tabItem(tabName = "creator",
              fluidRow()
      )
    )
  )
)

#Define server logic----
server <- function(input, output) {
  #As a check:
  print(rcps)
  
  #Viewer outputs----
  output$v_ingred <- renderTable(rec_list[[input$v_chooser]]$ingred)
  output$v_steps <- renderTable(rec_list[[input$v_chooser]]$steps)
  output$v_img <- renderImage(list(src = rec_list[[input$v_chooser]]$img), deleteFile = FALSE)
  
}

# Run the application 
shinyApp(ui = ui, server = server)

