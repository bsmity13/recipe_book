#######################################X
#----Brian and Simona's Recipe Book----X
#------------R Markdown PDF------------X
#-------------Recipe Prep--------------X
#######################################X

#Load packages
library(dplyr)
library(stringr)
library(knitr)
library(kableExtra)

#Set options
options(stringsAsFactors=F)

#Get recipe names (folder names)
recs <- list.dirs("recipes", recursive = FALSE, full.names = FALSE)

#Read in ingredients
ingred <- list()

for(i in 1:length(recs)){
  path <- file.path("recipes", recs[i])
  ingred.file <- grep("ingred", dir(path), value=T)
  ingred[[i]] <- read.csv(file.path(path, ingred.file)) %>%
    mutate(ingredient = str_to_title(ingredient))
  names(ingred[[i]]) <- str_to_title(names(ingred[[i]]))
}

#Read in steps
steps <- list()
for(i in 1:length(recs)){
  path <- file.path("recipes", recs[i])
  ingred.file <- grep("steps", dir(path), value=T)
  steps[[i]] <- read.csv(file.path(path, ingred.file))
}

#Create steps string
step.str <- list()

for (i in 1:length(steps)){
  out <- character()
  for (j in 1:nrow(steps[[i]])){
    step <- steps[[i]][j,]
    text <- paste0(
      step$step,
      ifelse(is.na(step$substep), "", step$substep),
      ". ",
      step$text,
      "\n  \n  "
    )
    out <- paste0(out, text)
    #Replace "degrees" with "°"
    out <- gsub("degrees", "\u00B0", out)
    Encoding(out) <- "UTF-8"
    #Insert tilde in jalapeno
    out <- gsub("jalapeno", "jalape\u00F1o", out)
  }
  step.str[[i]] <- out
}

#Read image paths
img <- list()
for(i in 1:length(recs)){
  path <- file.path("recipes", recs[i])
  img[[i]] <- file.path(path, grep("jpg", dir(path), value=T))
}


#Read nice name
nice <- list()
for(i in 1:length(recs)){
  path <- file.path("recipes", recs[i], "nice.txt")
  nice[[i]] <- read.csv(path, header = F)$V1[1]
}

