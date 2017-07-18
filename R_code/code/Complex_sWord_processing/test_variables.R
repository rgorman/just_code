#clear memory
rm(list = ls())


require(e1071)

require(gmodels)
require(klaR)
require(Matrix)

load(file = "matrix_100-token_chunks.R")

# read meta data from disk; 
chunk.ratios.m <- read.csv(file="metadata_100-token_chunks.csv", stringsAsFactors = FALSE, header = TRUE)

final.m <- Matrix(final.m, sparse = TRUE)
gc(reset = TRUE)
dim(final.m)


# read in author.v for list of levels
author.factor <- chunk.ratios.m[, 1]
unique(author.factor)


# make empty objects for results of classification tests
svm.results.l <- list()
svm.error.matrix.l <- list()
testing.classes.l <- list()
svm.model.l <- list()

time.l <- list() 

time.l <- proc.time() - time

time <- proc.time()

time.l

i <- 13
dim(final.m)


which(colnames(final.m) %in% holder.list[[13]])


i <- 1
  
  #create vector of random integers = 10% of obs in smaller.df
  testing.index.v <- sample (seq (1, nrow(final.m)), 572, prob = chunk.ratios.m[, 2])
  
for (i in 1:length(holder.list))  {
  
  
  # create column index for reduced avriable test
  col_index <- which(colnames(final.m) %in% holder.list[[i]])
  
  
  #create training and testing data matrices using testing.index.v and its inverse
  testing.data <- final.m[testing.index.v, col_index]
  training.data <- final.m[-testing.index.v, col_index]
  
  #create vectors of factors giving classes (here = authors) of each row in testing.data and training.data
  training.classes <- as.factor(author.factor[-testing.index.v])
  testing.classes <- as.factor(author.factor[testing.index.v])
  
  t1 <- proc.time()
  
  model.svm <- svm(training.data, training.classes, kernel = "linear", scale = FALSE, probability = TRUE)
  
  time.l[[i]] <- proc.time() - t1
  
  svm.model.l[[i]] <- model.svm
  gc(reset = TRUE)
  
}
  
  
######################################################  
  
test.data.l <- list()  
i <- 1
for (i in 1:10) {
  col_index <- which(colnames(final.m) %in% holder.list[[i]])
  test.data.l[[i]] <- final.m[testing.index.v, col_index]
  
}
  
  
save(svm.model.l, file = "svm_model_test_5-19-17.R") 
load(file = "svm_model_test_5-19-17.R")


save(time.l, file = "svm_test_times_5-19-17.R")

predictions.l <- list()
i <- 1
for (i in 1:length(svm.model.l)) {
  predictions.l[[i]] <- predict(svm.model.l[[i]], test.data.l[[i]])  
}

pred.m <- do.call(cbind, predictions.l)

row.names(pred.m) <-  row.names(final.m[testing.index.v,])

pred.m[which(pred.m[,1] == 1)] <- "Aeschylus"
pred.m[which(pred.m == i)] <- "Diodorus"
unique(author.factor)[3]

i <- 1
for (i in 1:length(unique(author.factor))) {
  pred.m[which(pred.m == i)] <- unique(author.factor)[i]
}


lengths(holder.list)
colnames(pred.m) <-  paste("no. of variables:", lengths(holder.list), sep = " ")

error.l <- list()
i <- 1
for (i in 1:length(predictions.l)) {
  error.l[[i]] <- errormatrix(testing.classes, predictions.l[[i]])
  
}

error.l

(572   - 48) / 572

write.csv(pred.m, file = "variables_test_5-20-17.csv")
  
  # create column index for reduced avriable test
  col_index <- which(colnames(final.m) %in% holder.list[[i]])
  
  
  #create training and testing data matrices using testing.index.v and its inverse
  testing.data <- final.m[testing.index.v, col_index]
  training.data <- final.m[-testing.index.v, col_index]
  
  #create vectors of factors giving classes (here = authors) of each row in testing.data and training.data
  training.classes <- as.factor(author.factor[-testing.index.v])
  testing.classes <- as.factor(author.factor[testing.index.v])
  
  t1 <- proc.time()
  
  model.svm <- svm(training.data, training.classes, kernel = "linear", scale = FALSE, probability = TRUE, cross = 10)
 
  time.l[[i]] <- proc.time() - t1
  
  
  
  
  
  
  
  
  
  
  svm.results.l[[i]] <- predict(model.svm, testing.data)
  svm.error.matrix.l[[i]] <- errormatrix(testing.classes, svm.results.l[[i]])
  
  t1 <- proc.time()
  svm.results.l[[i]] <- predict(model.svm, testing.data)
  proc.time() - t1
  
  svm.error.matrix.l[[4]]
  (572-23)/572
  (572-32)/572
  (572-39)/572
  (572-29)/572
  
  
  
  svm.output <- paste0("svm_model_", i, ".R")
  save(model.svm, file = svm.output)
  print(paste0("finished iteration ", i))
  timestamp()
  
 
  
  
Sys.time()

timestamp()

View(ordered.m[1:2, 1:200])

save(svm.model.l, file = "svm_model_list.R")

svm.error.matrix.l[[3]]
svm.results.l[[4]]



#combine all matrices contained in err.matr.l into one matrix for export to .csv file
a <- do.call(rbind, svm.error.matrix.l)


save(svm.error.matrix.l, file="Results_errorMatirx_svm_100-tokens_4-8-17.R")
save(svm.results.l, file="Results_predictions_svm_100-tokens_4-8-17.R")
save(model.svm, file = "Results_model_svm_100-tokens_4-8-17.R")
write.csv(a, file = "Results_Nov-2016/svmError_Spreadsheet_25tokens_Dec-27-2016.csv")


(11360 - 126) / 11360

(1136 - 123) / 1136
58*5
572-20
552/572
# make empty objects for results of classification tests
svm.results.l <- list()
svm.error.matrix.l <- list()
testing.classes.l <- list()
model.svm.l <- list()

i <- 1

timestamp()
for (i in 1:100) {
  
  
  
  #create vector of random integers = 10% of obs in smaller.df
  testing.index.v <- sample (seq (1, nrow(smaller.df2)), 1641, prob = chunk.ratios.m[, 2])
  
  
  #create training and testing data matrices using testing.index.v and its inverse
  testing.data <- smaller.df2[testing.index.v, ]
  training.data <- smaller.df2[-testing.index.v, ]
  
  #create vectors of factors giving classes (here = authors) of each row in testing.data and training.data
  training.classes <- as.factor(author.factor[-testing.index.v])
  testing.classes <- as.factor(author.factor[testing.index.v])
  
  
  model.svm <- svm(training.data, training.classes, kernel = "linear", scale = FALSE)
  
  svm.results.l[[i]] <- predict(model.svm, testing.data)
  svm.error.matrix.l[[i]] <- errormatrix(testing.classes, svm.results.l[[i]])
  model.svm.l[[i]] <- model.svm
  
  
}

timestamp()

svm.results.l[[1]]
svm.error.matrix.l[[1]]

#combine all matrices contained in err.matr.l into one matrix for export to .csv file
b <- do.call(rbind, svm.error.matrix.l)


save(svm.error.matrix.l, file="Results_Nov-2016/svmErrorMatrix_1000tokens_Dec-31-2016-C.R")
save(svm.results.l, file="Results_Nov-2016/svmResults_1000_Dec-31-2016-C.R")
write.csv(a, file = "Results_Nov-2016/svmError_Spreadsheet_1000tokens_moreVariables_Dec-31-2016-C.csv")

save(model.svm, file = "Results_Nov-2016/model_svm-Dec-31-C.R")


View(a)

sum(a[,3])
sum(b[,13])


sum(a[,13])/2
sum(b[,13])/2

1641*100


(12000-(sum(a[,3])/2))/12000
(164100-(sum(b[,13])/2))/164100

summary(model.svm)
model.svm$
dim(model.svm$decision.values)

dim(model.svm$SV)
View(model.svm$SV)

length(svm.error.matrix.l)
svm.error.matrix.l[[1]]
svm.results.l[[1]]
recheck <- svm(training.data, training.classes, kernel = "linear", scale = FALSE)




save(svm.error.matrix.l, file="Results_NOv-2016/svmErrorMatrix_40tokens_Dec-3-2016.R")
save(svm.results.l, file="Results_Nov-2016/svmResults_40tokens_Dec-3-2016.R")
write.csv(a, file = "Results_Nov-2016/svmError_Spreadsheet_40tokens_Dec-3-2016.csv")


save(svm.error.matrix.l, file="Results_Sept-2016/scaled-svmErrorMatrix_500tokens_Oct-1-2016.R")
save(svm.results.l, file="Results_Sept-2016/scaled-svmResults_500tokens_Oct-1-2016.R")
write.csv(a, file = "Results_Sept-2016/scaled-svmError_Spreadsheet_500tokens_Oct-1-2016.csv")


svm.results.l[[1]]

####### rename rows
new.names <- gsub("chunk", "bow", row.names(ordered.m))
new.names
row.names(ordered.m) <- new.names
View(ordered.m[1:10, 1:10])
