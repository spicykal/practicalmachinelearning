## assign the summary table of the training data set to the variable summ
summ <- summary(train)

## use the R2HTML package's "HTML" function to write the output to an html file
HTML(summ, file="summary.html")
