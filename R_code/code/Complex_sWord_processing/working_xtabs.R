
lengths(matrix.list)
sum(lengths(matrix.list))

x <- matrix.list[[2]]
dim(x)
View(x[,1:10])
sum(x)


# quantile(colSums(final.m), probs = seq(0, 1, 0.1))

names(matrix.list) <- data.names.v[index.v]
names(matrix.list)
file.ids.v
gsub("data.vector.list", "", file.ids.v)
index.v <- as.numeric(gsub("data.vector.list", "", file.ids.v))
data.names.v[index.v]

sums.for.quants <- lapply(matrix.list, colSums)
quants.list <- lapply(sums.for.quants, quantile, probs = seq(0, 1, 0.01))


quants.list[[2]]

deciles <- do.call(rbind, quants.list)
write.csv(deciles, file = "percentiles_4-2-17.csv")
z <- which(sums.for.quants[[2]] >= 766)
z
matrix.list[[1]][, z]
y <- matrix.list[[1]]
y[, z]

dim(x)
View(x[, z])
colnames(x[,z])
save(matrix.list, file = "matrix_list_named_4-3-17.R")
load("./metadata/indices_for_100-token_chunks.R")

precentiles.v <- read.csv(file = "percentiles_4-2-17.csv")
precentiles.v <- precentiles.v[,101]

vars.to.keep.v <- NULL

i <- 1

for (i in 1:length(data.names.v)) {
  car.holder.l <- which(sums.for.quants[[i]] >= precentiles.v[i])
  vars.to.keep.v <- append(vars.to.keep.v, car.holder.l)
  
  
}



keepers.variable.names <- names(vars.to.keep.v)
save(keepers.variable.names, file = "variable_names_one_percent.R")

precentiles.v[i]
which(sums.for.quants[[2]] >= precentiles.v[2])
floor(precentiles.v[1])

combo.combo.list[[3]][2]
names(combo.combo.list) <- data.names.v
names(combo.combo.list[[2]])
i <- 1

for (i in 1:length(combo.combo.list)) {
  
  for (j in 1:length(combo.combo.list[[i]])) {
    names(combo.combo.list[[i]]) <- bookids.v  
    
  }
  j <- 1
  
}

names(combo.combo.list[[1]])

lengths(combo.combo.list)

data.names.v[3]
combo.combo.list[[1]][1]

load("variable_names_one_percent.R")
length(x)
dim(freqs.df)
final.df <- data.frame()
#################################
i <- 1

for (i in 1: length(combo.combo.list)) {
  x <- combo.combo.list[[i]]
  for (j in 1:length(x)) {
    freqs.l <- mapply(data.frame, ID=seq_along(x[[j]]),
                      x[[j]], SIMPLIFY=FALSE, MoreArgs=list(stringsAsFactors=FALSE))
    
    freqs.df <- do.call(rbind, freqs.l)
    
    freqs.df$ID <- paste0(bookids.v[j], "_chunk_", freqs.df$ID)
    
    index <- which(freqs.df$Var1 %in% keepers.variable.names)
    
    freqs.df<- freqs.df[index,]
    
    final.df <- rbind(final.df, freqs.df)
    
    
  } # end of j loop 
  j <- 1
} # end of i loop


save(final.df, file = "input_for_xtabs.R")
load("input_for_xtabs.R")


"v-v-n-n-l" %in% keepers.variable.names

start.v <- seq(from = 1, to = 4784399, by = 100000)
end.v <- seq(from = 100000, to = 4784399, by = 100000)
end.v <- append(end.v, 4784399)

final.df[start.v[1]:end.v[1], ]

z <- final.df[1:10,]
z <- droplevels(z)

final.df2 <- droplevels(final.df) # remove factors that don't occur in data frame
rm(final.m, final.m2, x, y, result)

########################
result <- xtabs(Freq ~ ID+Var1, data=final.df2)
dim(result)




#convert wide format table to matrix object
final.m <- apply(result, 2, as.numeric)


rownames(final.m) <- row.names(result) # add row names to final.m



ordered.m <- final.m[, order(colSums(final.m), decreasing=TRUE)] # sort final.m from most common to least common variable

save(ordered.m, file = "./R_output/ordered_matrix_100-token_chunks.R")
save(final.m, file = "./R_output/matrix_100-token_chunks.R")
write.csv(ordered.m[,1:10], file = "./R_output/metadata_100-token_chunks.csv")
