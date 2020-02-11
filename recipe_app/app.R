#Brian and Simona's Recipe Book
#Recipe App

#Getting started with shinydashboard: https://rstudio.github.io/shinydashboard/get_started.html

#Set options----
options(stringsAsFactors = FALSE)

#Load packages----
library(shiny)
library(shinydashboard)

#Load modules----

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
              fluidRow()
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

}

# Run the application 
shinyApp(ui = ui, server = server)

