# a script to process complex sWord files into chunks

load("./R_input2/data.vector.list40.R")
load("copy_of_all_data_50-token_chunks.R")

######################################################
# get token indices for randomly populated chunks of a give maximum size
i <- 1
random.indices.l <- list()
max <- 20

for (i in 1:31) {
  token.indices.v <- seq_along(1:length(data.vector.list40[[i]])) # index number for each token in file
  token.indices.v <- sample(token.indices.v, replace = FALSE) # randomize 
  aaa <- seq_along(token.indices.v) # vector to provide input to split() function
  random.indices.l[[i]] <- split(token.indices.v, ceiling(aaa/max))
}

length(unique(random.indices.l[[31]]$`3`))

save(random.indices.l, file = "indices_for_20-token_chunks.R")

# get token metadata corresponding to above indices

token.metadata.l <- list()
i <-1

for (i in 1:length(data.vector.list40)) { # data.vector.list40  contains metadata for each token
  temp.list <- list()
  for (j in 1:length(random.indices.l[[i]])) {
    
    zz <- unlist(random.indices.l[[i]][j])
     temp.list[[j]] <- data.vector.list40[[i]][zz]
    
  }
  token.metadata.l[[i]] <- temp.list
  j <- 1
}


save(token.metadata.l, file = "token_ids_for_20-token_chunks.R")
###################################################

i <- 1
load("./metadata/indices_for_100-token_chunks.R")
load("names_of_variable_top_10_percent.R")


combo.combo.list <- list()

i <- 1
timestamp()

for (i in 11:39)  {
  
  input_file <- paste0("./R_input1/data.vector.list", i, ".R")
  load(input_file)
  file.name <- paste0("data.vector.list", i)
  a <- get(file.name)
  
  j <- 1
  comb.var.list <- list()
  
 
  for (j in 1:length(a)) {
    var.list <- list()
    k <- 1
    x <- length(random.indices.l[[j]])-1
    for (k in 1:x)  {
      b <-unlist(random.indices.l[[j]][k])
      var.list[[k]] <- a[[j]][b]
      freq.chunks.l <- lapply(var.list, table)
      print(paste0("finished_file_", i, "_text_", j, "_bow_", k))
      print(timestamp())
      
    }
    comb.var.list[[j]] <- freq.chunks.l
    print(paste0("finished_file_", j))
    print(timestamp())
    
  }
  
  combo.combo.list[[i]] <- comb.var.list
  save(combo.combo.list, file = "another_copy_of_all_data_25-token_chunks.R")
}


timestamp()

save(combo.combo.list, file = "all_data_25-token_chunks.R")
#############################


input_file <- paste0("./R_input1/data.vector.list", i, ".R")
load(input_file)
file.name <- paste0("data.vector.list", i)
a <- get(file.name)

j <- 1
comb.var.list <- list()

timestamp()
for (j in 1:length(a)) {
  var.list <- list()
  k <- 1
  x <- length(random.indices.l[[j]])-1
  for (k in 1:x)  {
    b <-unlist(random.indices.l[[j]][k])
    var.list[[k]] <- a[[j]][b]
    freq.chunks.l <- lapply(var.list, table)
    
  }
  comb.var.list[[j]] <- freq.chunks.l
  
}
timestamp()




############################


freqs.l <- mapply(data.frame, ID=seq_along(comb.var.list[[1]]),
                  comb.var.list[[1]], SIMPLIFY=FALSE, MoreArgs=list(stringsAsFactors=FALSE))


freqs.df <- do.call(rbind, freqs.l)


freqs.df <- do.call(rbind, freqs.l)
freqs.df2 <- freqs.df[keepers.v, ]


keepers.v <- which(freqs.df$Var1 %in% names.of.variables.v)

result <- xtabs(Freq ~ ID+Var1, data=freqs.df2)

final.m <- apply(result, 2, as.numeric)



# make row names
m <- 1
chunk.names.v <- NULL
for (m in 1:6706) {
 chunk.names.v <-   append(chunk.names.v, paste0("Aeschylus_Agamemnon_chunk", seq(1:nrow(final.m))))
  
}

row.names(final.m) <- chunk.names.v

seq(1:nrow(final.m))

freqs.df[70:78,]
chunk.names.v[70:78]

chunk.names.v[1:200]
length(chunk.names.v)

nrow(freqs.df)

names.of.variables.v[1]

length(which(freqs.df$Var1 %in% names.of.variables.v))
dim(freqs.df)

var.list <- list()
k <- 1
x <- length(random.indices.l[[j]])-1
for (k in 1:x)  {
  b <-unlist(random.indices.l[[j]][k])
  var.list[[k]] <- a[[j]][b]
}
comb.var.list[[j]] <- var.list


#convert the list object chunks.l into table objects
freq.chunks.l <- lapply(comb.var.list, table)

#convert the result from raw frequencies to relative fequencies
rel.freq.chunk.l <- lapply(freq.chunks.l, prop.table)



multi.f <- function(x) (x*1000)

a[[1]][b]
b <-unlist(random.indices.l[[1]][1])

length(random.indices.l[[1]])

freq.chunks.l[[1]]

z <- freq.chunks.l[[1]]
z <-append(z, freq.chunks.l[[2]])
z


sum(lengths(comb.var.list))
