## use two cores
registerDoParallel(cores=2)

## set trainControl parameters
ctrl <- trainControl(method = "cv", repeats = 10)

## fit the model
modelFit <- train(classe ~ ., data = train, method = "rf", trControl = ctrl, 
  preProcess = "pca")
