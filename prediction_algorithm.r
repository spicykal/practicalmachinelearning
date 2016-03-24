## use two cores
registerDoParallel(cores=2)

## set trainControl parameters
ctrl <- trainControl(method = "cv", repeats = 10)

## fit the model
modelFit <- train(classe ~ ., data = train, method = "rf", trControl = ctrl, 
  preProcess = "pca")
  
modelFit

## then predict the training set
predTrain <- predict(modelFit, train)

## then display the accuracy of the model
table(predTrain,train$classe)

## predict the testing set and store the results in a character vector
predTest <- as.character(predict(modelFit, test))

## display the predictions
predTest

## create a directory called "test_output," suppressing warnings if the 
## directory already exists
dir.create(file.path("test_output"), showWarnings = FALSE)

## create a function to write the files to be submitted
pml_write_files = function(x){
  n = length(x)
  for(i in 1:n){
  filename = paste0("test_output/problem_id_", i, ".txt")
  write.table(x[i], file = filename, quote = FALSE, row.names = FALSE, 
  col.names=FALSE)
  }
}

## then create the files, one for each prediction
pml_write_files(predTest)
