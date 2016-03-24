## download the data if it is not currently in the working directory
downLoad <- function(dir = "data", url, file) {
  ## check if the expected directory exists in the working directory.
  dir <- paste("./", dir, sep = "")
  if (!file.exists(dir)) {
  ## if not, check whether the expected file exists in the working 
  ## directory
  if (!file.exists(file)) {
  ## if not, try to download it
  download.file(url, file, mode="wb")
  }
  }
}

## download the training data and assign it to a dataframe called "train," converting
## blank observations to NA
downLoad(url = "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv")
train <- read.csv("data/pml-training.csv", na.strings=c("","NA"))

## download the testing data and assign it to a dataframe called "test"
downLoad(url = "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv")
test <- read.csv("data/pml-testing.csv")

## load relevant packages into the R environment, installing them if necessary
pkgInst <- function(x) {
    for (i in x) {
        ## "require" returns TRUE invisibly if it was able to load package
        if (!require(i, character.only = TRUE)) {
            ## if package was not able to be loaded, install it
            install.packages(i, dependencies = TRUE, 
                             repos="http://cran.r-project.org/")
            ## load package after installing
            require (i, character.only = TRUE)
        }
    }
}

## assign names of required packages to "pkgs"
pkgs <- c("R2HTML", "caret", "doParallel", "randomForest")

## load/install packages
pkgInst(pkgs)
