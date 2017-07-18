
require(xml2)

a <- lapply(word.list, names)
unique(b)

b <- unlist(a, recursive = TRUE, use.names = TRUE)
var_types <-  sort(unique(b))

var_types <- unique(b)

var_types <- var_types[which(! var_types == ".attrs")]
var_types <- var_types[which(! var_types == "text")]

holder.list <- vector("list", length(var_types))
names(holder.list) <- var_types


# C:\Users\rgorm\Documents\SyntaxMetrics\R_files\xslt_output

input.dir <- "./xslt_output"
files.v <- dir(path=input.dir, pattern=".*xml")
bookids.v <- gsub(".xml", "", files.v)

i <- 2

# read xml structure from file to .R object
doc.object <- xmlTreeParse(file.path(input.dir, files.v[i]), useInternalNodes=TRUE)
# extract all <word> elements and children into XmlNodeList object
word.nodes <- getNodeSet(doc.object, "//word")
# extract all <sWord> elements from word,nodes. The result is an XMLNodeList object.
sWord.nodes <- sapply(word.nodes, xmlChildren)
word.list <- xmlApply(word.nodes, xmlToList)


if ("DD-rel-pos-sWord-0" %in% names(word.list[[k]]))  {
  data.holder.v1 <-   append(data.holder.v1, word.list[[k]]$`DD-rel-pos-sWord-0`$text)
} else {
  data.holder.v1 <-   append(data.holder.v1, NA)
}

f1 <- function(x) { # var_types as input
  
  if (x %in% names(word.list[[k]]))  {
   a <-   word.list[[k]][[x]]["text"]
  } else {
    a <-    "NA"
  }
  
}

result <- NULL
citations <- NULL

ptm <- proc.time()

for (k in 1:length(word.list)) {
  
 result <- append(result, sapply(var_types, f1)) 
 
 
 citations <- append(citations, word.list[[k]]$.attrs["cite"])
  
}

result <- tolower(result)
temp <- unlist(result)
m <- matrix(temp, ncol=length(var_types),byrow = TRUE)
colnames(m) <- var_types
row.names(m) <- citations

proc.time() - ptm


dim(m)
z <- m
m2 <- cbind(m, z)
#############################



word.list[[1]]$.attrs["cite"]

result[[1]]
result[[50]]
var_types[49]
x <- 1
k <- 1
word.list[[k]][[var_types[1]]]["text"]
word.list[[k]][[x]]["text"]
