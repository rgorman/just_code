
rm(list = ls())


############ STEP 1 #######################################
# extract variables for each sample; samples are vectors of index references of a given length

load("indices_for_25-token_chunks.R") # if necessary, load list of vectors of index references
combo.combo.list <- list() # create empty list object to hold results

i <- 1 # set counter

timestamp()
for (i in 1:39) {
  input_file <- paste0("./R_input1/data.vector.list", i, ".R") # files contaiing lists of vectors of variable types for each text
  load(input_file)
  file.name <- paste0("data.vector.list", i)
  a <- get(file.name) # assign content of file.name to object with shorter name
  
  j <- 1 # set counter
  
  test.combo.l <- list() # create list object to hold results of loop
  
  for (j in 1:length(a)) { # iterate through data for each text
    test.l <- lapply(random.indices.l[[j]], unlist) # for each text, extract the sets of index references and convert to integer vectors.
    var_extract <- function(x) a[[j]][x] # a user defined function to extract data from object a for a given text [[j]] and index reference [x]
    test.var.l <- lapply(test.l, var_extract) # Applies function var_extract to each sample and text in test.l
    test.freq.l   <- lapply(test.var.l[1:(length(test.var.l)-1)], table) # create a contingency table for each sample 
    ##############################          except for the last in each text (which will usually be smaller than the selected sample size)
    test.combo.l[[j]] <- test.freq.l  # store results for each text as item in list
    
  }
  combo.combo.list[[i]] <- test.combo.l #store item for each data type and each text as nested lists
  save(combo.combo.list, file = "yet_another_all_data_25-token_chunks.R") # save results
  
}
timestamp()  


######################################### STEP 2 ##################################
# make a single extab from all tables in combo.combo.list


# To create names for texts, identify directory with the xml input files.
input.dir <- "./xml_input"


files.v <- dir(path=input.dir, pattern=".*xml") # A vector with each file name from input directory.

bookids.v <- gsub(".xml", "", files.v) # Remove the ".xml" from file names in file.v and store results as vector

combined.df <- data.frame() # create empty data frame to hold results of loop

j <- 1 # set counter for texts to be processed

for (j in 1:31) { # iterates through each text
  df.holder <- NULL # create object to store data
  i <- 1
  
  for (i in 1:length(combo.combo.list)) { # iterates through data types
    d <- combo.combo.list[[i]][j] # access nested lists of data types for each text
    freqs.l <- mapply(data.frame, ID=paste0(bookids.v[j], seq_along(d[[1]])) ,
                      d[[1]] , SIMPLIFY=FALSE, MoreArgs=list(stringsAsFactors=FALSE)) # converts each table in list d to a list of data frames.
                                                          # Data frame has 3 column: "ID", giving the file name and sample number.
                                                          # ID data is drawn from bookids.v and the seq_along() function (which
                                                          # provides the sample number); column "Var1", containing the name of the
                                                          # variables which occur in the sample.; column "Freq", containing the count
                                                          # of each variable for the sample.
    
    freqs.df <- do.call(rbind, freqs.l) # converts list of data frames to single data frame with data for all samples
                                        # of given variable in a given text
    df.holder <- rbind(df.holder, freqs.df) # adds data frames for each iteration through data types
    print(paste0("fiished_file_", i, "_", bookids.v[j] ))
    
  }
  
  
  combined.df <- rbind(combined.df, df.holder) # collects data for each iteration by text
  

  
  
}


save(combined.df, file = "25-token_dataframe_for_xtab.R")
####################################### STEP 3
 # reduce variables and make xtab of aggregated data


load("variable_names_one_percent.R") # load vector of variables to retain
keepers.v <- which(combined.df$Var1 %in% keepers.variable.names) # make vector of indices of locations in dataframe 
                                                          # containing variables to retain

combined.df <- combined.df[keepers.v, ] # eliminate the rows of combined.df whose indices are not in keepers.v
combined.df <- droplevels(combined.df) # eliminate factors which don't occur in reduced data frame (otherwise all original
                                       # variables will be considered in xtab functiona and memory will be insufficient.)


result <- xtabs(Freq ~ ID+Var1, data=combined.df) # generate xtab



final.m <- apply(result, 2, as.numeric) # convert to matrix for classification testing



row.names(final.m) <- row.names(result) # make human readable rownames 


save(final.m, file = "25-token_final_matrix.R")

write.csv(final.m[, 1], file = "metadata_25-token_samples.csv") # save file to provide factors and probabilities for classification

############################## STEP 4 
             # set probabilities for sample selection in test/training sets

x <- 1/12 # base variable for calculations: 1 / the number of authors in the data set

# divide x by the number of samples for each author

# 25 token samples produce the following numbers

x / 1818 # Aeschylus
x / 968 # Diodorus
x / 1246 # Herodotus
x / 724 # Hesiod
x / 4949 # Homer Iliad
x / 3929 # Homer Odyssey
x / 815 # Lysias
x / 824 # Plutarch
x / 3895 # Polybius
x / 1867 # Sophocles
x / 956 # Thucyides
x / 843 # Xenophon


######################################## STEP 5
#  Classification test

# save final.m and clear memory
save(final.m, file = "final_matrix_25-tokens_4-14-17.R")

rm(list = ls()) # clean memory

# load necessary packages

require(e1071)
require(gmodels)
require(klaR)

# load saved data
load("final_matrix_25-tokens_4-14-17.R")

# order matrix by sum of each column
ordered.m <- final.m[, order(colSums(final.m), decreasing=TRUE)]

#remove redundant matrix
rm(final.m)

# read meta data from disk; 
chunk.ratios.m <- read.csv(file="metadata_25-token_samples.csv", stringsAsFactors = FALSE, header = TRUE)




# read in author.v for list of levels
author.factor <- chunk.ratios.m[, 1]


# make empty objects for results of classification tests
svm.results.l <- list()
svm.error.matrix.l <- list()
testing.classes.l <- list()
svm.model.l <- list()


i <- 1


timestamp()
for (i in 1:5) {
  
  
  
  #create vector of random integers = 10% of obs in smaller.df
  testing.index.v <- sample (seq (1, nrow(x)), 2283, prob = chunk.ratios.m[, 2]) # number of samples should be set to 
                                                               # 10% of total
  
  
  #create training and testing data matrices using testing.index.v and its inverse
  testing.data <- as.big.matrix(x[testing.index.v, ])
  training.data <- as.big.matrix(x[-testing.index.v, ])  
  
  #create vectors of factors giving classes (here = authors) of each row in testing.data and training.data
  training.classes <- as.factor(author.factor[-testing.index.v])
  testing.classes <- as.factor(author.factor[testing.index.v])
  
  timestamp()
  model.svm <- svm(training.data, training.classes, kernel = "linear", scale = FALSE, probability = TRUE)
  
  
  timestamp()
  
  svm.results.l[[i]] <- predict(model.svm, testing.data)
  svm.error.matrix.l[[i]] <- errormatrix(testing.classes, svm.results.l[[i]])
  
  svm.output <- paste0("svm_model_", i, ".R")
  save(model.svm, file = svm.output)
  print(paste0("finished iteration ", i))
  timestamp()
  
  
  svm.error.matrix.l[[1]]
  
}

save(model.svm, file = "model.svm_4-14-14_A.R")
save(svm.results.l, file = "svm.results_4-14-17_A.R")
save(svm.error.matrix.l, file = "svm.error.matrix_4-14-17_A.R")

svm.error.matrix.l[[1]]

2283 - 449
1834 / 2283
