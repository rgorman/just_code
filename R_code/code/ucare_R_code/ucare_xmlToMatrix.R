rm(list = ls())
require(XML)

input.dir <- "./xslt_output"
files.v <- dir(path=input.dir, pattern=".*xml")


i <- 1
files.v[i]

# read xml structure from file to .R object
doc.object <- xmlTreeParse(file.path(input.dir, files.v[i]), useInternalNodes=TRUE)

# extract all <word> elements and children into XmlNodeList object
word.nodes <- getNodeSet(doc.object, "//word")

# extract all <sWord> elements from word,nodes. The result is an XMLNodeList object.
sWord.nodes <- sapply(word.nodes, xmlChildren)

word.list <- xmlApply(word.nodes, xmlToList)




a <- lapply(word.list, names) #extract names of variable categories (these are the names of children of word elements.)


b <- unlist(a, recursive = TRUE, use.names = TRUE) # change a from list to character vector
var_types <-  sort(unique(b)) # alphabetize b


# Remove extraneous names from vector b
var_types <- var_types[which(! var_types == ".attrs")]
var_types <- var_types[which(! var_types == "text")]





holder.list <- vector("list", length(var_types)) # make list of length equal to number of variable categories

names(holder.list) <- var_types # add name of variable type to each element in list




# function to extract values of each variable type; it checks whether type of variable exists for each word.

f1 <- function(x) { # var_types as input 
  
  if (x %in% names(word.list[[k]]))  {
   a <-   word.list[[k]][[x]]["text"]
  } else {
    a <-    "NA"
  }
  
}


# create objects to hold results
result <- NULL
citations <- NULL

ptm <- proc.time()

for (k in 1:length(word.list)) { # loop applies function f1 to each word in word.list
  
 result <- append(result, sapply(var_types, f1)) 
 
 
 citations <- append(citations, word.list[[k]]$.attrs["cite"]) # word and sentence number collected for each word in word.list
  
}

result <- tolower(result) # lower case

temp <- unlist(result) # change contents of result to named character vector

z <- matrix(temp, ncol=length(var_types),byrow = TRUE) # create matrix containing results; rows are words, columns are variable types.
colnames(z) <- var_types # names for columns
row.names(z) <- citations # names for rows

proc.time() - ptm

write.csv(z, file = "intermed_sev-2.csv")



#############################

dim(z)


sent_name <-  unique(z[, 16])


sent.freq.table <- vector("list", length(unique(z[, 16])))



n <- 1

for (n in 1:length(sent_name)) {
  row_index <- (which(z[,16] == sent_name[n]))
  sent.vars <- z[row_index,1:15]
  
  sent.freq.table[[n]] <- table(sent.vars)/ length(row_index)
 
  
}



freqs.l <- mapply(data.frame, ID=seq_along(sent.freq.table),
                  sent.freq.table, SIMPLIFY=FALSE, MoreArgs=list(stringsAsFactors=FALSE))


freqs.df <- do.call(rbind, freqs.l)


#convert from long form table to wide format
tab.result <- xtabs(Freq ~ ID+sent.vars, data=freqs.df)


#convert wide format table to matrix object
final.m <- apply(tab.result, 2, as.numeric)
row.names(final.m) <- unique(z[, 16])

write.csv(final.m, file = "output_wint_no_ellips.csv")

output.m <- read.csv(file = "output_wint_no_ellips.csv",check.names = FALSE, row.names = 1, stringsAsFactors = FALSE)

combined.m <- read.csv(file = "combined_sent_data.csv",check.names = FALSE, stringsAsFactors = FALSE)

plot(log(combined.m[,2]), log(combined.m[,3]))


cor.test(log(combined.m[,2]), log(combined.m[,3]))

dim(output.m)

plot(output.m[,1], output.m[,2])


plot(output.m[,4], output.m[,5])


output.m[,1]

cor.test(log(output.m[,1]), log(output.m[,2]))


cor.test(log(output.m[,1]), log(output.m[,3]))

cor.test(output.m[,4], output.m[,5])
cor.test(output.m[,4], log2(output.m[,5]))
plot(output.m[,4], log2(output.m[,5]))

dim(final.m)

10^-12
log(.1)
2.718 ^ -2.30

z.corr <- cor(log(output.m[,1]), output.m[,4:1962] )
write.csv(z.corr, file = "wint_cor_matrix_no_ellips.csv")


