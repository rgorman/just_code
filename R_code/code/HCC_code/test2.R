


require(e1071)
require(klaR)

# load saved data
load("20-token_final_matrix.R")


# read meta data from disk; 
chunk.ratios.m <- read.csv(file="metadata_20-token_samples.csv", stringsAsFactors = FALSE, header = TRUE)




# read in author.v for list of levels
author.factor <- chunk.ratios.m[, 1]


# make empty objects for results of classification tests
svm.results.l <- list()
svm.error.matrix.l <- list()
svm.model.l <- list()

i <- 1





  #create vector of random integers = 10% of obs in smaller.df
  testing.index.v <- sample (seq (1, nrow(ordered.m)), 2857, prob = chunk.ratios.m[, 2])
  
  
  #create training and testing data matrices using testing.index.v and its inverse
  testing.data <- ordered.m[testing.index.v, ]
  training.data <- ordered.m[-testing.index.v, ]
  
  #create vectors of factors giving classes (here = authors) of each row in testing.data and training.data
  training.classes <- as.factor(author.factor[-testing.index.v])
  testing.classes <- as.factor(author.factor[testing.index.v])
  
  
  model.svm <- svm(training.data, training.classes, kernel = "linear", scale = FALSE, probability = TRUE)
  timestamp()
  svm.results.l[[i]] <- predict(model.svm, testing.data)
  svm.error.matrix.l[[i]] <- errormatrix(testing.classes, svm.results.l[[i]])
  svm.model.l[[i]] <- model.svm

  save(svm.results.l, file = "results_list.R")
  
  
 
  