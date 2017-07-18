
load("C:/Users/rgorm/Documents/large_file_archive/transfer/matrix_list2.R")


input.dir <- "C:/Users/rgorm/Documents/large_file_archive/data_R_lists_3-27-17"

 i <- 39

file_name <- paste0(input.dir, "/data.vector.list", i, ".R")

var_names.m <- read.csv(file = "C:/Users/rgorm/Documents/SyntaxMetrics/R_files/file_concordance.csv", header = TRUE,
                        stringsAsFactors = FALSE)

var.names.v <-   var_names.m[,4]

file_order <- var_names.m[,3]

which(names(matrix.list) == file_order[4])
keeper.v <- NULL

for (i in 1:length(file_order)) {
   keeper.v <-  append(keeper.v, which(names(matrix.list) == file_order[i]))
}

ordered.matrix.list <- list()

i <- 1

for (i in 1:length(keeper.v)) {
  ordered.matrix.list[[i]] <- matrix.list[[keeper.v[i]]]
  
}

names(ordered.matrix.list) <- var.names.v[keeper.v]

save(ordered.matrix.list, file = "ordered_matrix_list_5-17-17.R")
load("ordered_matrix_list_5-17-17.R")


names(ordered.matrix.list)

var.names.v[keeper.v]

length(unique(keeper.v))

names(matrix.list) <- var_names.m[,4]
names(matrix.list)

save(matrix.list, file = "named_matrix_list_5-17-17_R")

load(file_name)
rm(data.vector.list38)


z <- matrix.list[[i]]
vlist <- get(paste0("data.vector.list", i))
vlist[[1]][1:10]
colnames(z[,1:10])

colnames(matrix.list[[2]][, 1:10])

rm(data.vector.list5)

lengths(matrix.list)
matrix.list[[1]][1]
matrix.list[[2]]
names(matrix.list)

y <- sapply(matrix.list, ncol)
sum(y) 

x <- lapply(ordered.matrix.list, colSums)

x[[1]]
dim(z)

dim(matrix.list[[1]])
which(x[[5]]>= 1661)


# create function to provide custom quantiles of z
find_deciles <- function(x) {
  quantile(x, probs = seq(0.99525, 0.9975, 0.00025))
}

# apply function to each list in z
deciles <- lapply(x, find_deciles)

# convert list of quantile tables to single long form matrix with all data catagories
deciles <- do.call(rbind, deciles)

# rename rows in deciles object according to data types.
rownames(deciles) <- names(ordered.matrix.list)

dim(deciles)

holder.list <- list()
n <- 1

for (n in 1:ncol(deciles)) {
  holder <- NULL
  i <- 1
  for (i in 1: nrow(deciles)) {
    holder <- append(holder, which(colSums(ordered.matrix.list[[i]]) >= deciles[i, n]))
  }
  holder.list[[n]] <- names(holder)
}

holder.list[[1]][1]

holder <- NULL
i <- 1
for (i in 1: nrow(deciles)) {
  holder <- append(holder, which(colSums(ordered.matrix.list[[i]]) >= deciles[i, n]))
}

names(holder[1:5])


keeper.vars <- names(holder) # store variable names in vector
save(keeper.vars, file = "keeper_variables_995.R")

ncol(final.m[, which(colnames(final.m) %in% keeper.vars)])

dim(final.m)



which(colSums(ordered.matrix.list[[i]]) >= deciles[i, 1995])

which(ordered.matrix.list[[i]] >= 7219)

write.csv(deciles, file = "mils_5-17-17.csv")
  
  ncol(matrix.list[[1]])

z <- matrix.list[[1]]
class(z)

rm(list = ls())

load("matrix_100-token_chunks.R")
dim(final.m)
colnames(final.m)
which(colnames(final.m) %in% keeper.vars)
final.m_995 <- final.m[, which(colnames(final.m) %in% keeper.vars)]

