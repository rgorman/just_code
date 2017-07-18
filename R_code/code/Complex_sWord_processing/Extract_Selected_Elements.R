# This version of the script includes creation of a list of raw sWord counts.

# clean workspace
rm(list = ls())


i <- 1
k <- 5

############################

# C:\Users\rgorm\Documents\large_file_archive\xslt_output-3-12-17

# input.dir <- "C:/Users/rgorm/Documents/large_file_archive/xslt_output-3-12-17"

input.dir <- "./xml_test"
files.v <- dir(path=input.dir, pattern=".*xml")

data.names.v <- c("$`DD-rel-pos-sWord-1`$text", "DD-rel-pos-sWord-1", "DD-rel-pos-sWord-2", "DD-rel-pos-sWord-3",
                 "DD-rel-sWord-0", "DD-rel-sWord-1", "DD-rel-sWord-2", "DD-rel-sWord-3",
                 "DD-pos-sWord-0", "DD-pos-sWord-1", "DD-pos-sWord-2", "DD-pos-sWord-3",
                 "Neighborhood-rel-pos-sWord-0", "Neighborhood-rel-pos-sWord-1", "Neighborhood-rel-pos-sWord-2",
                 "Neighborhood-rel-sWord-0", "Neighborhood-rel-sWord-1", "Neighborhood-rel-sWord-2", "Neighborhood-rel-sWord-3",
                 "Neighborhood-pos-sWord-0", "Neighborhood-pos-sWord-1", "Neighborhood-pos-sWord-2", "Neighborhood-pos-sWord-3",
                 "project-rel-pos-sWord-0", "project-rel-pos-sWord-1", "project-rel-pos-sWord-2",
                 "rel-pos-sWord-0", "rel-pos-sWord-1", "rel-pos-sWord-2","rel-pos-sWord-3", "rel-pos-sWord-4",
                 "rel-sWord-0", "rel-sWord-1", "rel-sWord-2", "rel-sWord-3", "rel-sWord-4",
                 "pos-sWord-0", "pos-sWord-1", "pos-sWord-2", "pos-sWord-3", "pos-sWord-4")

data.type.collection.v <- c("append(data.holder.v, word.list[[k]]$`DD-rel-pos-sWord-0`$text)",
                            "append(data.holder.v, word.list[[k]]$`DD-rel-pos-sWord-1`$text)",
                            "append(data.holder.v, word.list[[k]]$`DD-rel-pos-sWord-2`$text)",
                            "append(data.holder.v, word.list[[k]]$`DD-rel-pos-sWord-3`$text)")

data.holder.v1 <- append(data.holder.v1, word.list[[k]]$`DD-rel-pos-sWord-1`$text )
data.holder.v2 <- append(data.holder.v2, word.list[[k]]$`DD-rel-pos-sWord-2`$text )
data.holder.v3 <- append(data.holder.v3, word.list[[k]]$`DD-rel-sWord-0`$text)
data.holder.v4 <- append(data.holder.v4, word.list[[k]]$`DD-rel-sWord-1`$text)
data.holder.v5 <- append(data.holder.v5, word.list[[k]]$`DD-rel-sWord-2`$text)
data.holder.v6 <- append(data.holder.v6, word.list[[k]]$`DD-pos-sWord-0`$text)
data.holder.v7 <- append(data.holder.v7, word.list[[k]]$`DD-pos-sWord-1`$text)
data.holder.v8 <- append(data.holder.v8, word.list[[k]]$`DD-pos-sWord-2`$text)
data.holder.v9 <- append(data.holder.v9, word.list[[k]]$`Neighborhood-rel-pos-sWord-0`$text)
data.holder.v10 <- append(data.holder.v10, word.list[[k]]$`Neighborhood-rel-pos-sWord-1`$text)


for (i in 1:length(files.v)) { # loop through each file in directory
  
  # read xml structure from file to .R object
  doc.object <- xmlTreeParse(file.path(input.dir, files.v[i]), useInternalNodes=TRUE)
  # extract all <word> elements and children into XmlNodeList object
  word.nodes <- getNodeSet(doc.object, "//word")
  # extract all <sWord> elements from word,nodes. The result is an XMLNodeList object.
  sWord.nodes <- sapply(word.nodes, xmlChildren)
  word.list <- xmlApply(word.nodes, xmlToList)
  
  for (j in 1:length(data.type.collection.v)) { # loop through each data type in data.type.collection.v
    
    data.holder.v <- NULL
    
    for (k in 1:length(word.list)) {
      
      data.holder.v <- eval(parse(text = data.type.collection.v[j])) 
      
      
    }
    
    
    
  } # end of loop j through data types 
  
  
} #end of loop i through files in directory


eval(parse(text = data.type.collection.v[j]))

data.type.collection.v[j]

j <- 1

word.list[[k]]data.names.v[1]

names(word.nodes[[1]])

data.table.list1 <- list()
data.table.list2 <- list()
data.table.list3 <- list()
data.table.list4 <- list()
data.table.list5 <- list()
data.table.list6 <- list()
data.table.list7 <- list()
data.table.list8 <- list()
data.table.list9 <- list()
data.table.list10 <- list()


for (i in 1:length(files.v)) {
  # read xml structure from file to .R object
  doc.object <- xmlTreeParse(file.path(input.dir, files.v[i]), useInternalNodes=TRUE)
  # extract all <word> elements and children into XmlNodeList object
  word.nodes <- getNodeSet(doc.object, "//word")
  # extract all <sWord> elements from word,nodes. The result is an XMLNodeList object.
  sWord.nodes <- sapply(word.nodes, xmlChildren)
  word.list <- xmlApply(word.nodes, xmlToList)
  
  data.holder.v1 <- NULL
  data.holder.v2 <- NULL
  data.holder.v3 <- NULL
  data.holder.v4 <- NULL
  data.holder.v5 <- NULL
  data.holder.v6 <- NULL
  data.holder.v7 <- NULL
  data.holder.v8 <- NULL
  data.holder.v9 <- NULL
  data.holder.v10 <- NULL
  
  for (k in 1:length(word.list)) {
    data.holder.v1 <- append(data.holder.v1, word.list[[k]]$`DD-rel-pos-sWord-1`$text )
    data.holder.v2 <- append(data.holder.v2, word.list[[k]]$`DD-rel-pos-sWord-2`$text )
    data.holder.v3 <- append(data.holder.v3, word.list[[k]]$`DD-rel-sWord-0`$text)
    data.holder.v4 <- append(data.holder.v4, word.list[[k]]$`DD-rel-sWord-1`$text)
    data.holder.v5 <- append(data.holder.v5, word.list[[k]]$`DD-rel-sWord-2`$text)
    data.holder.v6 <- append(data.holder.v6, word.list[[k]]$`DD-pos-sWord-0`$text)
    data.holder.v7 <- append(data.holder.v7, word.list[[k]]$`DD-pos-sWord-1`$text)
    data.holder.v8 <- append(data.holder.v8, word.list[[k]]$`DD-pos-sWord-2`$text)
    data.holder.v9 <- append(data.holder.v9, word.list[[k]]$`Neighborhood-rel-pos-sWord-0`$text)
    data.holder.v10 <- append(data.holder.v10, word.list[[k]]$`Neighborhood-rel-pos-sWord-1`$text)
    
    
    
  }
  
  
  data.table.list1[[files.v[i]]] <- table(data.holder.v1)
  data.table.list2[[files.v[i]]] <- table(data.holder.v2)
  data.table.list3[[files.v[i]]] <- table(data.holder.v3)
  data.table.list4[[files.v[i]]] <- table(data.holder.v4)
  data.table.list5[[files.v[i]]] <- table(data.holder.v5)
  data.table.list6[[files.v[i]]] <- table(data.holder.v6)
  data.table.list7[[files.v[i]]] <- table(data.holder.v7)
  data.table.list8[[files.v[i]]] <- table(data.holder.v8)
  data.table.list9[[files.v[i]]] <- table(data.holder.v9)
  data.table.list10[[files.v[i]]] <- table(data.holder.v10)
  
}

###########################

holder <- "append(data.holder.v1, word.list[[k]]$`DD-rel-pos-sWord-1`$text )"
append(data.holder.v1, word.list[[k]]$`DD-rel-pos-sWord-1`$text )


data.holder.v1 <-  eval(parse(text = holder)) 
data.holder.v1

word.list[[3]]$`Neighborhood-rel-pos-sWord-0`$text
data.table.list9[[1]]

word.list[[3]]




# First, create list object (freqs.l) containing data.frame object with columns containing ID number for source file
# variable name (i.e., the sWord), and relative frequency of sWord

freqs.l <- mapply(data.frame, ID=seq_along(data.table.list),
                  data.table.list, SIMPLIFY=FALSE, MoreArgs=list(stringsAsFactors=FALSE))



freqs.df <- do.call(rbind, freqs.l)

result <- xtabs(Freq ~ ID+data.holder.v, data=freqs.df)


final.m <- apply(result, 2, as.numeric)

# create list of names for rows
bookids.v <- gsub(".xml", "", files.v)

sorted.m <- final.m[, order(colSums(final.m), decreasing=TRUE) ]
dim(sorted.m)

row.names(sorted.m) <- bookids.v

write.csv(sorted.m, file = "./complex_sWord_data/DD-rel-pos-sWord-0.csv")














######################################

library(XML)

source("code/corpusFunctions.R")


# location of files: C:\Users\rgorm\Documents\syntacto_stylistics\R_files\working_input


input.dir <- "./xml_test"
files.v <- dir(path=input.dir, pattern=".*xml")



# The following loop extracts the sWords from each file in the given directory and inserts them as character vectors
# into the appropriate element in a list object.

# set incremental varaible to 1
i <- 1

# create list objects with no content. Vectors extracted from XML files will be stored here.
sWord.rawCount.list <- list()
sWord.freq.table.list <- list()
tokenTotal.list <- list()

for (i in 1:length(files.v))  {
  
  # read xml structure from file to .R object
  doc.object <- xmlTreeParse(file.path(input.dir, files.v[i]), useInternalNodes=TRUE)
  # extract all <word> elements and children into XmlNodeList object
  word.nodes <- getNodeSet(doc.object, "//word")
  # extract all <sWord> elements from word,nodes. The result is an XMLNodeList object.
  sWord.nodes <- sapply(word.nodes, xmlChildren)
  
  
  # The following loop extracts contents of all <sWord> elements, i.e., extracts the sWords themselve srom the XML.
  
  # set incremetal variable for loop
  j <- 1
  
  # create vector object sWord,contents with no content.
  sWord.contents <- NULL
  
  for (j in 1:length(sWord.nodes)) {
    
    
    # extract contents of all <sWord> elements. Result is a charcter vector object.
    sWord.contents <- append(sWord.contents, paste(xmlValue(sWord.nodes[[j]][[2]]), collapse = NULL))
    
    
  }
  
  # change sWord.contents vector to lower case
  sWord.contents <- tolower(sWord.contents)
  
  # create a contingency table of sWord.contents. The table lists nuber of occurences for all sWords.
  sWord.table <- table(sWord.contents)
  
  # normalize sWord.table by number of tokens (not number of sWords).
  sWord.freq.table <- sWord.table/length(sWord.nodes)
  
  # insert sWord.freq.table into list
  sWord.freq.table.list[[i]] <- sWord.freq.table
  # insert raw frequencies into list
  sWord.rawCount.list[[i]] <- sWord.table
  #insert token totals for each file in list
  tokenTotal.list[[i]] <- length(sWord.nodes)
  
}

# End of Loop!!!


# save sWord.freq.table.list to disk
save(sWord.freq.table.list, file = "freq_table_lists/list_10-24-16_0930PM.R")

# Convert sWord.freq.table.list into a data matrix. This allows for further analysis and manipulation.


# First, create list object (freqs.l) containing data.frame object with columns containing ID number for source file
# variable name (i.e., the sWord), and relative frequency of sWord

freqs.l <- mapply(data.frame, ID=seq_along(sWord.freq.table.list),
                  sWord.freq.table.list, SIMPLIFY=FALSE, MoreArgs=list(stringsAsFactors=FALSE))


rawFreqs.l <- mapply(data.frame, ID=seq_along(sWord.freq.table.list),
                     sWord.rawCount.list, SIMPLIFY=FALSE, MoreArgs=list(stringsAsFactors=FALSE))

# Next, combine this list of data.frame objects into a single large data.frame object.

freqs.df <- do.call(rbind, freqs.l)

rawFreqs.df <- do.call(rbind, rawFreqs.l)

# check names of data frame to provide parameters for conversion to wide format table
names(freqs.df)
names(rawFreqs.df)

#convert from long form table to wide format (i.e., the files will be represented by rows, the sWords by columns)
result <- xtabs(Freq ~ ID+sWord.contents, data=freqs.df)
countResult <- xtabs(Freq ~ ID+sWord.contents, data=rawFreqs.df)


#convert wide format table to matrix object
final.m <- apply(result, 2, as.numeric)

rawFinal.m <- apply(countResult, 2, as.numeric)

# make names for rows
names_for_files.v <- gsub (".xml", "", files.v)


# substitute files names for row numbers
rownames(rawFinal.m) <-names_for_files.v

dim(final.m)



# order columns by column mean, largest to smallest and create object with results
ordered.df <- final.m[, order(colMeans(final.m), decreasing=TRUE)]

# reduce data matrix to features with largest means (most common features)
smaller.m <- ordered.df[,1:1500]


# create vector of integers from 1 to the number of columns in smaller.m. This will serve as index for rawFinal.m and
# will allow it to be ordered just as final.m.


index.v <- 1:ncol(final.m)

# change order of content of index.v from largest to smallest column mean in smaller
index.v <-  index.v[order(colMeans(final.m), decreasing=TRUE)]

# resize index.v to match smaller.m
index.v <- index.v[1:ncol(smaller.m)]

# multiply matrix by 100 to get ratio of sWordLevel per 100 tokens (these numbers are easier to read than
# small decimal fractions)

smaller.m <- 100 * smaller.m

# reorder rawFinal.m to match smaller.m
rawFinal.m <- rawFinal.m[, index.v]


#save matrix to disk
write.csv(smaller.m, file = "working_output1/rel_pos_Levels_Oct-23-2016_1251PM.csv")

# Make empty vector to contain the number of total tokens in each file.
tokenTotal.v <- NULL

# Fill that vectort object with contents of tokenTotal.list
tokenTotal.v <- append(tokenTotal.v, sapply(tokenTotal.list, paste, collapse = NULL))

# add two NA elements at beginning of vector to correspond to rows added to matrix
tokenTotal.v <- c(NA, NA, tokenTotal.v)

# Change tokenTotal to integer vector.
tokenTotal.v  <-  as.integer(tokenTotal.v)

# Change tokenTotal.v to matric so it can be combined with the other matrices.
tokenTotal.m <- matrix(tokenTotal.v, ncol = 1)

# Make matrix of z-scores from smaller.m
zscores.m <- scale(smaller.m)

# combine matrices of frequencies
m <- cbind(rawFinal.m, smaller.m, zscores.m)
View(m)

# Reorder the columns to interleave them
# the concatinate function -- c() -- appatently conjoins rows 1, 2, and 3 of each column
 

m <- m[, c(matrix(1:ncol(m), nrow = 3, byrow = T))] 

# make matrix of labels for columns
label.b <- matrix(rep("Rel. Freq. per 100 tokens", ncol(smaller.m)), ncol = ncol(smaller.m))
label.c <- matrix(rep("Z-Score", ncol(smaller.m)), ncol = ncol(smaller.m))
label.a <- matrix(rep("Raw Count", ncol(smaller.m)), ncol = ncol(smaller.m))

# Combinne labels
labels.abc <- cbind(label.a, label.b, label.c)


# reorder columns to interleave. First make index of integers separated by number of columns in labels.abc divided
# by 3 (i.e, 1, 1501, 3001, 2, 1502, 3002 ...)
index.abc <- c(matrix(1:ncol(labels.abc), nrow = 3, byrow = TRUE))

# use index to reorder labels victor
labels.abc <- labels.abc[index.abc]

# change labels vector to matrix object
labels.m <- matrix(labels.abc, ncol = ncol(m))


# loop to make rank labels
i <- 1
rank <- NULL
for (i in 1:ncol(smaller.m))  {
  rank <- append(rank, rep(i, 3))
  
  
}

# convert "rank" to matrix
rank.m <- matrix(rank, ncol = length(rank))



#combine the label matrices by row
combined.m <- rbind(rank.m, labels.abc, m)

# add total token amounts as first column in matrix
combined.m <- cbind(tokenTotal.m, combined.m)
dim (tokenTotal.m)
dim (combined.m)

# save as csv file
write.csv(combined.m, file = "working_output1/rel-pos_Output_10-25-2016_1057PM.csv")





