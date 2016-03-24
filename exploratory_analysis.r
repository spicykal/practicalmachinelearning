## assign the summary table of the training data set to the variable summ
summ <- summary(train)

## use the R2HTML package's "HTML" function to write the output to an html file
HTML(summ, file="summary.html")

## remove the column with the row number
train$X <- NULL

## remove the columns with 19,216 NA observations
train <- train[,colSums(is.na(train)) < 19216]
