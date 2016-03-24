## assign the summary table of the training data set to the variable summ
summ <- summary(train)

## use the R2HTML package's "HTML" function to write the output to an html file
HTML(summ, file="summary.html")

## remove the column with the row number
train$X <- NULL

## remove the columns with 19,216 NA observations
train <- train[,colSums(is.na(train)) < 19216]

## create a variable to represent the x-axis as "classe" is a factor and
## histograms can only be drawn for numeric data
classnum <- as.numeric(train$classe)

## create the histogram and change its density to percentages
h <- hist(classnum)
h$density <- h$counts / sum(h$counts) * 100

## plot the histogram, leaving the x-axis blank
plot(h, freq = F, main = "Histogram of Classe for the Training Set", ylab = 
         "Percentage", xlab="Classe", xaxt="n", col="blue")

## add the axis
axis(1,at=1:5,labels = c("A","B","C","D","E"))
