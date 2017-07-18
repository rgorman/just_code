# clean workspace
rm(list = ls())


i <- 1

for (i in 1:40)  {
  
  input.dir1 <- "R_input1"
  input.dir2 <- "R_input2"
  
  nam1 <- paste("data.vector.list", i,  sep = "")
  
  
  input_file1 <- paste(input.dir1, "/data.vector.list", i, ".R", sep = "")
  
  
  input_file2 <- paste(input.dir2, "/data.vector.list", i, ".R", sep = "")
  
  load(input_file1, verbose = TRUE)
  x <- y
  load(input_file2, verbose = TRUE)
  y <- get(nam1)
  
  
  
  j <- 1
  
  for (j in 1:6) {
    
    q <- j + 17
    y[[q]]  <- x[[j]]
    
  }
  
  
  
  
 #  y[[1]]  <- x[[1]]
  
  output_file <- paste("./complex_sWord_data/data.vector.list", i, ".R", sep = "")
  
  save(y, file=output_file)
  
  
}



################################



names(y[17:24])
names(y[1])
y[[1]][1]

j <- 1

for (j in 1:6) {
  
  q <- j + 17
  y[[q]]  <- x[[j]]
  
}

sum(lengths(y))

lengths(data.vector.list33)

lengths(y[18:23])

lengths(x)
y[[j]]+17
j+17
