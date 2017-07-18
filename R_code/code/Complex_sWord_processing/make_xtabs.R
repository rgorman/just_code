# Script to generate frequency table for each list of tree data

# clean workspace
rm(list = ls())


data.names.v <- c("DD-rel-pos-sWord-0", "DD-rel-pos-sWord-1", "DD-rel-pos-sWord-2", "DD-rel-pos-sWord-3",
                  "DD-rel-sWord-0", "DD-rel-sWord-1", "DD-rel-sWord-2", "DD-rel-sWord-3",
                  "DD-pos-sWord-0", "DD-pos-sWord-1", "DD-pos-sWord-2", "DD-pos-sWord-3",
                  "Neighborhood-rel-pos-sWord-0", "Neighborhood-rel-pos-sWord-1", "Neighborhood-rel-pos-sWord-2",
                  "Neighborhood-rel-sWord-0", "Neighborhood-rel-sWord-1", "Neighborhood-rel-sWord-2", 
                  "Neighborhood-pos-sWord-0", "Neighborhood-pos-sWord-1", "Neighborhood-pos-sWord-2", 
                  "project-rel-pos-sWord-0", "project-rel-pos-sWord-1", "project-rel-pos-sWord-2",
                  "rel-pos-sWord-0", "rel-pos-sWord-1", "rel-pos-sWord-2","rel-pos-sWord-3", "rel-pos-sWord-4",
                  "rel-sWord-0", "rel-sWord-1", "rel-sWord-2", "rel-sWord-3", "rel-sWord-4",
                  "pos-sWord-0", "pos-sWord-1", "pos-sWord-2", "pos-sWord-3", "pos-sWord-4")

column.sums.l <- list()

# C:/Users/rgorm/Documents/SyntaxMetrics/R_files/R_input1

input.dir1 <- "./R_input1"

input.dir <-  "C:/Users/rgorm/Documents/SyntaxMetrics/R_files/R_input1"
files.v <- dir(path=input.dir)
load(file.path(input.dir, files.v[i]))

i <- 2
matrix.list <- list()

for (i in 1:39) {
  
  load(file.path(input.dir, files.v[i]), verbose = TRUE)
  
   
  y <- get(files.v[i])
   holder.list <- list()
  holder.list <- lapply(y, table)
  
  
  
  
  
  freqs.l <- mapply(data.frame, ID=seq_along(holder.list),
                    holder.list, SIMPLIFY=FALSE, MoreArgs=list(stringsAsFactors=FALSE))
  
  
  freqs.df <- do.call(rbind, freqs.l)
  
  
  result <- xtabs(Freq ~ ID+Var1, data=freqs.df)
  
  #convert wide format table to matrix object
  final.m <- apply(result, 2, as.numeric)
  
  rownames(final.m) <- names(y)
  
  ordered.m <- final.m[, order(colSums(final.m), decreasing=TRUE)]
  dim(ordered.m)
  
  column.sums.l[[i]] <- colSums(ordered.m)
  
  matrix.list[[i]] <- ordered.m
  
  
  ##############################################
  
  # quantile(colSums(final.m), probs = seq(0, 1, 0.1))
  
  
  
  
  
  # rownames(final.m) <- names(y)
  
  # names(y)
  
  # order columns by column mean, largest to smallest and create object with results
  # ordered.m <- final.m[, order(colSums(final.m), decreasing=TRUE)]
  
  # column.sums.l[[i]] <- colSums(ordered.m)
  
  
  # output_file <- paste0("./complex_sWord_data/table_for_", data.names.v[i], ".csv" )
  
  # save(ordered.m, file = output_file)
 #  write.csv(ordered.m, file = output_file)
  
}
###########################

matrix.list[[1]]
save(matrix.list, file = "matrix.list.R")

############################################

i <- 1
for (i in 1:39) {
  output.file <- paste0("./complex_sWord_data/table_for_", data.names.v[i], ".csv")
  zzz <- matrix.list[[i]]
  write.csv(zzz, file = output.file)
}

output.file <- paste0("./complex_sWord_data/table_for_", data.names.v[i], ".csv")
zzz <- matrix.list[[i]]
save(zzz, file = output.file)




# create object containing data types more frequent than 90% of all variables

# column.sums.l was created by the code above. It holds 39 lists of the sums of each column of variables in each file
z <- column.sums.l # rename file for easier code

# create function to provide custom quantiles of z
find_deciles <- function(x) {
  quantile(x, probs = seq(0, 1, 0.1))
  
}

# apply function to each list in z
deciles <- lapply(z, find_deciles)

# convert list of quantile tables to single long form matrix with all data catagories
deciles <- do.call(rbind, deciles)

# rename rows in deciles object according to data types.
rownames(deciles) <- data.names.v

# save deciles for modification in Excel
write.csv(deciles, file = "complex_sWord_deciles_3-27-17.csv")

# read CSV file back into deciles object for use in script.
deciles <- read.csv(file = "complex_sWord_deciles_3-24-17.csv", header = TRUE)


# Create keeper.v vector containing column of deciles matrix containing the values represening the desired %.
# For example, the column containing the 90%; any columns with sums less than this number are among the 90% least frequent
# varaibles for a given data type.
keepers.v <- deciles[,12]






# create short.index.l, a list object in which each list stores the index references for variables in the top
# 10% by number of occurences.

short.index.l <- list()

save(short.index.l, file = "short_index.R")

i <- 1 # reset counter

for (i in 1:39)  { # a loop to populate short.index.l with the most frequent 10%.
  short.index.l[[i]] <-  which(column.sums.l[[i]] >= keepers.v[i])  # the values in keeper.v are used to restrict elements of list.
  
}


short.matrix.list <- list()

i <-1

for (i in 1:39) {
  short.matrix.list[[i]] <- matrix.list[[i]][, short.index.l[[i]]]
  
  
}

sum(lengths(short.index.l))
lengths(matrix.list)
lengths(short.matrix.list)


names.of.variables.v <- NULL

i <- 1
timestamp()

for (i in 1:39) {
  short.m <- short.matrix.list[[i]]
  #write.csv(short.m, file =paste0("./complex_sWord_data/short_table_for_", data.names.v[i], ".csv") )
  names.of.variables.v <- append(names.of.variables.v, colnames(short.m))
  
}
timestamp()

save(names.of.variables.v, file = "names_of_variable_top_10_percent.R")

xxx <- read.csv(file = paste0(input.dir1, "/table_for_", data.names.v[i], ".csv"),nrows=1, head=FALSE)


colnames(short.m)

################################
working.m <- read.csv(file = paste0(input.dir1, "/table_for_", data.names.v[i], ".csv"))
short.m <- working.m[, short.index.l[[i]]]
write.csv(short.m, file =paste0("./complex_sWord_data/short_table_for_", data.names.v[i], ".csv") )



paste0("./complex_sWord_data/short_table_for_", data.names.v[i], ".csv")


##############################

zzz <- short.index.l
names(zzz) <- data.names.v

which(column.sums.l[[i]] >= keepers.v[i])  
length(which(column.sums.l[[i]] >= keepers.v[i]))
keepers.v[i]


sum(lengths(short.index.l))

short.index.l[[i]] <-  which(column.sums.l[[i]] >= keepers.v[i])


deciles[i]

sum(column.sums.l[[2]])



length(column.sums.l[[1]])

z <- column.sums.l

lapply(z, length)

find_deciles <- function(x) {
  quantile(x, probs = seq(0, 1, 0.1))
  
}


deciles <- lapply(z, find_deciles)

quantile()


deciles <- do.call(rbind, deciles)
rownames(deciles) <- data.names.v

write.csv(deciles, file = "complex_sWord_deciles_3-24-17.csv")
deciles <- read.csv(file = "complex_sWord_deciles_3-26-17.csv", header = TRUE)
dim(deciles)
deciles[,12]


colSums(ordered.m)

data.holder.v1 <- data.holder.v1


lapply(z, length)

