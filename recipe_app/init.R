#######################################X
#----Brian and Simona's Recipe Book----X
#-----------Shiny Recipe App-----------X
#------Initial Prep for Shiny App------X
#######################################X

#This script checks and loads the existing recipes for
  #inclusion in the Shiny app.

#Each recipe is stored in its own directory:
recs <- list.dirs("../recipes", recursive = FALSE)

#Each directory contains two CSVs and possibly an image
  #*_ingred.csv is the list of ingredients
  #*_steps.csv is the list of instructions
  #*.jpg is the image to accompany the dish (optional)

#Grab recipe name
rec_nm <- stringr::word(recs, 3, sep = "/")

#For each recipe, read the contents of the directory to a list
rec_list <- list()

for (i in 1:length(recs)){
  #Initialize list
  rec_list[[i]] <- list()
  #Read ingredients
  ingred <- file.path(recs[i], paste0(rec_nm[i], "_ingred.csv"))
  rec_list[[i]]$ingred <- read.csv(ingred)
  #Read steps
  steps <- file.path(recs[i], paste0(rec_nm[i], "_steps.csv"))
  rec_list[[i]]$steps <- read.csv(steps)
  #Store image path
  img <- file.path(recs[i], paste0(rec_nm[i], ".jpg"))
  if (file.exists(img)){
    rec_list[[i]]$img <- img
  } else {
    rec_list[[i]]$img <- NA
  }
}

#Name rec_list
names(rec_list) <- rec_nm
