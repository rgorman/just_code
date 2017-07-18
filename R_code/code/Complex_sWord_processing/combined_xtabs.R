
combo.combo.list[[2]][1]

d <- combo.combo.list[[1]][2]
str(combo.combo.list[[1]][1])
length(combo.combo.list[[1]][1])

j <- 1
d[[1]][1]
bookids.v <- gsub(".xml", "", files.v)
combined.df <- data.frame()

######################## set second index of combo.combo.list and bookids.v

for (j in 1:31) {
  df.holder <- NULL
  i <- 1
  
  for (i in 1:length(combo.combo.list)) {
    d <- combo.combo.list[[i]][j]
    freqs.l <- mapply(data.frame, ID=paste0(bookids.v[j], seq_along(d[[1]])) ,
                      d[[1]] , SIMPLIFY=FALSE, MoreArgs=list(stringsAsFactors=FALSE))
    
    freqs.df <- do.call(rbind, freqs.l)
    df.holder <- rbind(df.holder, freqs.df)
    print(paste0("fiished_file_", i, "_", bookids.v[j] ))
    
  }
  
  
  combined.df <- rbind(combined.df, df.holder)
  
  save(combined.df, file = "50-token_dataframe_for_xtab.R")
  
  
}

##################################
load("variable_names_one_percent.R")
keepers.v <- which(combined.df$Var1 %in% keepers.variable.names)

dim(combined.df)
check.df <- combined.df[1:20,]
check.df <- droplevels(check.df)

backup.df <- combined.df

combined.df <- combined.df[keepers.v, ]
combined.df <- droplevels(combined.df)



result <- xtabs(Freq ~ ID+Var1, data=combined.df)
save(result, file = "50-token_xtab.R")


final.m <- apply(result, 2, as.numeric)




row.names(result)

row.names(final.m) <- row.names(result)

save(final.m, file = "50-token_final_matrix.R")

write(final.m[, 1:3], file = "metadata_50-token_samples.csv") # save file to provide factors and probabilities for classification

#################################


df.holder <- NULL
i <- 1

for (i in 1:length(combo.combo.list)) {
  d <- combo.combo.list[[i]][13]
  freqs.l <- mapply(data.frame, ID=paste0(bookids.v[13], seq_along(d[[1]])) ,
                    d[[1]] , SIMPLIFY=FALSE, MoreArgs=list(stringsAsFactors=FALSE))
  
  freqs.df <- do.call(rbind, freqs.l)
  df.holder <- rbind(df.holder, freqs.df)
  
}


combined.df <- rbind(combined.df, df.holder)

save(combined.df, file = "dataframe_for_xtab.R")
########################################

combined.df2 <- combined.df[keepers.v,]
save(combined.df2, file = "culled_dataframe_for_xtab.R")
save(result, file = "result_2.R")

#############
load("culled_dataframe_for_xtab.R")
nrow(combined.df2)/2

rm(result)

i <- 1

for (i in 1:length(start.v)) {
  result <- xtabs(Freq ~ ID+Var1, data=combined.df2[start.v[i]:end.v[i],])
  output_file <- paste0("./R_output/results", i, ".R")
  final.m <- apply(result, 2, as.numeric)
  row.names(final.m) <- row.names(result)
  sparse.m <- Matrix(final.m, sparse = TRUE)
  
  save(sparse.m, file = output_file)
  rm(result, final.m, sparse.m)
}


sparse.m <- Matrix(final.m, sparse = TRUE)
object.size(final.m) /
object.size(sparse.m2)


load("./R_output/results2.R")
sparse.m2 <- sparse.m

sparse.m1 <- rbind(sparse.m1, sparse.m2)
dim(sparse.m1)
dim(sparse.m2)
require(Matrix)
View(final.m[1:10, 1:10])

colnames(sparse.m1)

result <- xtabs(Freq ~ ID+Var1, data=combined.df2[1000001:1500001,])
result <- xtabs(Freq ~ ID+Var1, data=combined.df2[1500002:2000000,])

start.v <- seq(from=1, to=9219262, by=50000)
end.v <- seq(from=0, to=9219262, by=50000)
start.v
end.v <- start.v
end.v

end.v <- end.v[2:length(end.v)]
end.v <- append(end.v, 9219262)

1500001

object.size(result)

rm(df.holder2, final.m, final.m1, freqs.df)
row.names(final.m) <- row.names(result)

combined.df <- df.holder

dim(df.holder)

freqs.l <- mapply(data.frame, ID=seq_along(d[[1]]),
                  d[[1]] , SIMPLIFY=FALSE, MoreArgs=list(stringsAsFactors=FALSE))





freqs.l <- mapply(data.frame, ID=seq_along(comb.var.list[[1]]),
                  comb.var.list[[1]], SIMPLIFY=FALSE, MoreArgs=list(stringsAsFactors=FALSE))


freqs.df <- do.call(rbind, freqs.l)


freqs.df <- do.call(rbind, freqs.l)
freqs.df2 <- freqs.df[keepers.v, ]

df.holder2 <- df.holder[keepers.v, ]

keepers.v <- which(combined.df$Var1 %in% names.of.variables.v)

keepers.v <- which(df.holder$Var1 %in% names.of.variables.v)

result <- xtabs(Freq ~ ID+Var1, data=combined.df)

final.m <- apply(result, 2, as.numeric)

dim(final.m)

final.m1 <- final.m

str(result)
attributes(result, "ID")

row.names(result)

row.names(final.m) <- row.names(result)

test <- cbind(final.m1, final.m)

result[1]
