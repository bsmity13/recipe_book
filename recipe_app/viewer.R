#######################################X
#----Brian and Simona's Recipe Book----X
#-----------Shiny Recipe App-----------X
#--------------Viewer Tab--------------X
#######################################X

#This script creates the content for the 'viewer' tab.

#v_chooser box----
v_chooser <- box(selectInput("v_chooser", label = "Recipe:", choices = rec_nm),
                 title = "Choose Recipe", status = "warning", solidHeader = TRUE)

#v_ingred box----
v_ingred <- box(tableOutput("v_ingred"), 
                title = "Ingredients", status = "primary", solidHeader = TRUE)
v_steps <- box(tableOutput("v_steps"),
               title = "Steps", status = "primary", solidHeader = TRUE)
v_img <- box(imageOutput("v_img", width = 300, height = 200), 
             title = "Image", status = "primary", solidHeader = TRUE)

