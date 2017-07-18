
# clean workspace
rm(list = ls())

require(XML)

# C:\Users\rgorm\Documents\large_file_archive\xslt_output-3-12-17

input.dir <- "C:/Users/rgorm/Documents/large_file_archive/xslt_output-3-18-17"

# input.dir <- "./xml_test"
files.v <- dir(path=input.dir, pattern=".*xml")



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


data.type.collection.v <- c("append(data.holder.v, word.list[[k]]$`DD-rel-pos-sWord-0`$text)",
                            "append(data.holder.v, word.list[[k]]$`DD-rel-pos-sWord-1`$text)",
                            "append(data.holder.v, word.list[[k]]$`DD-rel-pos-sWord-2`$text)",
                            "append(data.holder.v, word.list[[k]]$`DD-rel-pos-sWord-3`$text)",
                            "append(data.holder.v, word.list[[k]]$`DD-rel-sWord-0`$text)",
                            "append(data.holder.v, word.list[[k]]$`DD-rel-sWord-1`$text)",
                            "append(data.holder.v, word.list[[k]]$`DD-rel-sWord-2`$text)",
                            "append(data.holder.v, word.list[[k]]$`DD-rel-sWord-3`$text)",
                            "append(data.holder.v, word.list[[k]]$`DD-pos-sWord-0`$text)",
                            "append(data.holder.v, word.list[[k]]$`DD-pos-sWord-1`$text)",
                            "append(data.holder.v, word.list[[k]]$`DD-pos-sWord-2`$text)",
                            "append(data.holder.v, word.list[[k]]$`DD-pos-sWord-3`$text)",
                            "append(data.holder.v, word.list[[k]]$`Neighborhood-rel-pos-sWord-0`$text)",
                            "append(data.holder.v, word.list[[k]]$`Neighborhood-rel-pos-sWord-1`$text)",
                            "append(data.holder.v, word.list[[k]]$`Neighborhood-rel-pos-sWord-2`$text)",
                            "append(data.holder.v, word.list[[k]]$`Neighborhood-rel-sWord-0`$text)",
                            "append(data.holder.v, word.list[[k]]$`Neighborhood-rel-sWord-1`$text)",
                            "append(data.holder.v, word.list[[k]]$`Neighborhood-rel-sWord-2`$text)",
                            "append(data.holder.v, word.list[[k]]$`Neighborhood-pos-sWord-0`$text)",
                            "append(data.holder.v, word.list[[k]]$`Neighborhood-pos-sWord-1`$text)",
                            "append(data.holder.v, word.list[[k]]$`Neighborhood-pos-sWord-2`$text)",
                            "append(data.holder.v, word.list[[k]]$`project-rel-pos-sWord-0`$text)",
                            "append(data.holder.v, word.list[[k]]$`project-rel-pos-sWord-1`$text)",
                            "append(data.holder.v, word.list[[k]]$`project-rel-pos-sWord-2`$text)",
                            "append(data.holder.v, word.list[[k]]$`rel-pos-sWord-0`$text)",
                            "append(data.holder.v, word.list[[k]]$`rel-pos-sWord-1`$text)",
                            "append(data.holder.v, word.list[[k]]$`rel-pos-sWord-2`$text)",
                            "append(data.holder.v, word.list[[k]]$`rel-pos-sWord-3`$text)",
                            "append(data.holder.v, word.list[[k]]$`rel-pos-sWord-4`$text)",
                            "append(data.holder.v, word.list[[k]]$`rel-sWord-0`$text)",
                            "append(data.holder.v, word.list[[k]]$`rel-sWord-1`$text)",
                            "append(data.holder.v, word.list[[k]]$`rel-sWord-2`$text)",
                            "append(data.holder.v, word.list[[k]]$`rel-sWord-3`$text)",
                            "append(data.holder.v, word.list[[k]]$`rel-sWord-4`$text)",
                            "append(data.holder.v, word.list[[k]]$`pos-sWord-0`$text)",
                            "append(data.holder.v, word.list[[k]]$`pos-sWord-1`$text)",
                            "append(data.holder.v, word.list[[k]]$`pos-sWord-2`$text)",
                            "append(data.holder.v, word.list[[k]]$`pos-sWord-3`$text)",
                            "append(data.holder.v, word.list[[k]]$`pos-sWord-4`$text)")


  



print(c(data.names.v[f], data.type.collection.v[f]))

for (h in 1:length(data.type.collection.v)) {
  
  data.table.list <- list()
  
  i <- 1
  
  for (i in 1:length(files.v))  {
    
    # read xml structure from file to .R object
    doc.object <- xmlTreeParse(file.path(input.dir, files.v[i]), useInternalNodes=TRUE)
    # extract all <word> elements and children into XmlNodeList object
    word.nodes <- getNodeSet(doc.object, "//word")
    # extract all <sWord> elements from word,nodes. The result is an XMLNodeList object.
    sWord.nodes <- sapply(word.nodes, xmlChildren)
    word.list <- xmlApply(word.nodes, xmlToList)
    
    data.holder.v <- NULL
    
    
    for (k in 1:length(word.list)) {
      data.holder.v <- eval(parse(text = data.type.collection.v[h])) 
      
      
      
    }
    
    data.table.list[[i]] <- table(data.holder.v)
    
    
    
  } 
  
  
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
  nam <- paste("./complex_sWord_data/", data.names.v[h], ".csv", sep = "")
  
  write.csv(sorted.m, file = nam)
  
  
  
} # end of loop h



