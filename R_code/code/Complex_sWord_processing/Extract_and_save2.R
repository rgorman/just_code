
# clean workspace
rm(list = ls())

require(XML)

# C:\Users\rgorm\Documents\large_file_archive\xslt_output-3-12-17

input.dir <- "C:/Users/rgorm/Documents/large_file_archive/xslt_output_3-26-17"

# input.dir <- "./xml_test"
files.v <- dir(path=input.dir, pattern=".*xml")
bookids.v <- gsub(".xml", "", files.v)


data.vector.list1  <- list()
data.vector.list2  <- list()
data.vector.list3  <- list()
data.vector.list4  <- list()
data.vector.list5  <- list()
data.vector.list6  <- list()
data.vector.list7  <- list()
data.vector.list8  <- list()
data.vector.list9  <- list()
data.vector.list10  <- list()
data.vector.list11  <- list()
data.vector.list12  <- list()
data.vector.list13  <- list()
data.vector.list14  <- list()
data.vector.list15  <- list()
data.vector.list16  <- list()
data.vector.list17  <- list()
data.vector.list18  <- list()
data.vector.list19  <- list()
data.vector.list20  <- list()
data.vector.list21  <- list()
data.vector.list22  <- list()
data.vector.list23  <- list()
data.vector.list24  <- list()
data.vector.list25  <- list()
data.vector.list26  <- list()
data.vector.list27  <- list()
data.vector.list28  <- list()
data.vector.list29  <- list()
data.vector.list30  <- list()
data.vector.list31  <- list()
data.vector.list32  <- list()
data.vector.list33  <- list()
data.vector.list34  <- list()
data.vector.list35  <- list()
data.vector.list36  <- list()
data.vector.list37  <- list()
data.vector.list38  <- list()
data.vector.list39  <- list()
data.vector.list40  <- list()




for (i in 1:length(files.v))  {
  
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
  data.holder.v11 <- NULL
  data.holder.v12 <- NULL
  data.holder.v13 <- NULL
  data.holder.v14 <- NULL
  data.holder.v15 <- NULL
  data.holder.v16 <- NULL
  data.holder.v17 <- NULL
  data.holder.v18 <- NULL
  data.holder.v19 <- NULL
  data.holder.v20 <- NULL
  data.holder.v21 <- NULL
  data.holder.v22 <- NULL
  data.holder.v23 <- NULL
  data.holder.v24 <- NULL
  data.holder.v25 <- NULL
  data.holder.v26 <- NULL
  data.holder.v27 <- NULL
  data.holder.v28 <- NULL
  data.holder.v29 <- NULL
  data.holder.v30 <- NULL
  data.holder.v31 <- NULL
  data.holder.v32 <- NULL
  data.holder.v33 <- NULL
  data.holder.v34 <- NULL
  data.holder.v35 <- NULL
  data.holder.v36 <- NULL
  data.holder.v37 <- NULL
  data.holder.v38 <- NULL
  data.holder.v39 <- NULL
  data.holder.v40 <- NULL
  
  
  
  for (k in 1:length(word.list)) {
    
    # a sequence if if/else switches adds a NA if there is no relevant data point in a token.  This procedure
    # will give vectors of the same length, that of number of tokens processed.
    
    if ("DD-rel-pos-sWord-0" %in% names(word.list[[k]]))  {
      data.holder.v1 <-   append(data.holder.v1, word.list[[k]]$`DD-rel-pos-sWord-0`$text)
    } else {
      data.holder.v1 <-   append(data.holder.v1, NA)
    }
    
    
    if ("DD-rel-pos-sWord-1" %in% names(word.list[[k]]))  {
      data.holder.v2 <-   append(data.holder.v2, word.list[[k]]$`DD-rel-pos-sWord-1`$text)
    } else {
      data.holder.v2 <-   append(data.holder.v2, NA)
    }
    
    
    if ("DD-rel-pos-sWord-2" %in% names(word.list[[k]]))  {
      data.holder.v3 <-   append(data.holder.v3, word.list[[k]]$`DD-rel-pos-sWord-2`$text)
    } else {
      data.holder.v3 <-   append(data.holder.v3, NA)
    }
    
    
    if ("DD-rel-pos-sWord-3" %in% names(word.list[[k]]))  {
      data.holder.v4 <-   append(data.holder.v4, word.list[[k]]$`DD-rel-pos-sWord-3`$text)
    } else {
      data.holder.v4 <-   append(data.holder.v4, NA)
    }

    
    if ("DD-rel-sWord-0" %in% names(word.list[[k]]))  {
      data.holder.v5 <-   append(data.holder.v5, word.list[[k]]$`DD-rel-sWord-0`$text)
    } else {
      data.holder.v5 <-   append(data.holder.v5, NA)
    }    
    
    
    if ("DD-rel-sWord-1" %in% names(word.list[[k]]))  {
      data.holder.v6 <-   append(data.holder.v6, word.list[[k]]$`DD-rel-sWord-1`$text)
    } else {
      data.holder.v6 <-   append(data.holder.v6, NA)
    }
    
    
    if ("DD-rel-sWord-2" %in% names(word.list[[k]]))  {
      data.holder.v7 <-   append(data.holder.v7, word.list[[k]]$`DD-rel-sWord-2`$text)
    } else {
      data.holder.v7 <-   append(data.holder.v7, NA)
    }
    
    if ("DD-rel-sWord-3" %in% names(word.list[[k]]))  {
      data.holder.v8 <-   append(data.holder.v8, word.list[[k]]$`DD-rel-sWord-3`$text)
    } else {
      data.holder.v8 <-   append(data.holder.v8, NA)
    }
    
    
    if ("DD-pos-sWord-0" %in% names(word.list[[k]]))  {
      data.holder.v9 <-   append(data.holder.v9, word.list[[k]]$`DD-pos-sWord-0`$text)
    } else {
      data.holder.v9 <-   append(data.holder.v9, NA)
    }
    
    
    if ("DD-pos-sWord-1" %in% names(word.list[[k]]))  {
      data.holder.v10 <-   append(data.holder.v10, word.list[[k]]$`DD-pos-sWord-1`$text)
    } else {
      data.holder.v10 <-   append(data.holder.v10, NA)
    }
    
    
    if ("DD-pos-sWord-2" %in% names(word.list[[k]]))  {
      data.holder.v11 <-   append(data.holder.v11, word.list[[k]]$`DD-pos-sWord-2`$text)
    } else {
      data.holder.v11 <-   append(data.holder.v11, NA)
    }
    
    
    if ("DD-pos-sWord-3" %in% names(word.list[[k]]))  {
      data.holder.v12 <-   append(data.holder.v12, word.list[[k]]$`DD-pos-sWord-3`$text)
    } else {
      data.holder.v12 <-   append(data.holder.v12, NA)
    }
    
    
    if ("Neighborhood-rel-pos-sWord-0" %in% names(word.list[[k]]))  {
      data.holder.v13 <-   append(data.holder.v13, word.list[[k]]$`Neighborhood-rel-pos-sWord-0`$text)
    } else {
      data.holder.v13 <-   append(data.holder.v13, NA)
    }
    
    
    if ("Neighborhood-rel-pos-sWord-1" %in% names(word.list[[k]]))  {
      data.holder.v14 <-   append(data.holder.v14, word.list[[k]]$`Neighborhood-rel-pos-sWord-1`$text)
    } else {
      data.holder.v14 <-   append(data.holder.v14, NA)
    }
    
    
    if ("Neighborhood-rel-pos-sWord-2" %in% names(word.list[[k]]))  {
      data.holder.v15 <-   append(data.holder.v15, word.list[[k]]$`Neighborhood-rel-pos-sWord-2`$text)
    } else {
      data.holder.v15 <-   append(data.holder.v15, NA)
    }
   
    
    if ("Neighborhood-rel-sWord-0" %in% names(word.list[[k]]))  {
      data.holder.v16 <-   append(data.holder.v16, word.list[[k]]$`Neighborhood-rel-sWord-0`$text)
    } else {
      data.holder.v16 <-   append(data.holder.v16, NA)
    }
    
    
    if ("Neighborhood-rel-sWord-1" %in% names(word.list[[k]]))  {
      data.holder.v17 <-   append(data.holder.v17, word.list[[k]]$`Neighborhood-rel-sWord-1`$text)
    } else {
      data.holder.v17 <-   append(data.holder.v17, NA)
    }
    
    
    if ("Neighborhood-rel-sWord-2" %in% names(word.list[[k]]))  {
      data.holder.v18 <-   append(data.holder.v18, word.list[[k]]$`Neighborhood-rel-sWord-2`$text)
    } else {
      data.holder.v18 <-   append(data.holder.v18, NA)
    }
    
    
    if ("Neighborhood-pos-sWord-0" %in% names(word.list[[k]]))  {
      data.holder.v19 <-   append(data.holder.v19, word.list[[k]]$`Neighborhood-pos-sWord-0`$text)
    } else {
      data.holder.v19 <-   append(data.holder.v19, NA)
    }
    
    
    if ("Neighborhood-pos-sWord-1" %in% names(word.list[[k]]))  {
      data.holder.v20 <-   append(data.holder.v20, word.list[[k]]$`Neighborhood-pos-sWord-1`$text)
    } else {
      data.holder.v20 <-   append(data.holder.v20, NA)
    }
    
    
    if ("Neighborhood-pos-sWord-2" %in% names(word.list[[k]]))  {
      data.holder.v21 <-   append(data.holder.v21, word.list[[k]]$`Neighborhood-pos-sWord-2`$text)
    } else {
      data.holder.v21 <-   append(data.holder.v21, NA)
    }
    
    
    if ("project-rel-pos-sWord-0" %in% names(word.list[[k]]))  {
      data.holder.v22 <-   append(data.holder.v22, word.list[[k]]$`project-rel-pos-sWord-0`$text)
    } else {
      data.holder.v22 <-   append(data.holder.v22, NA)
    }
    
    
    if ("project-rel-pos-sWord-1" %in% names(word.list[[k]]))  {
      data.holder.v23 <-   append(data.holder.v23, word.list[[k]]$`project-rel-pos-sWord-1`$text)
    } else {
      data.holder.v23 <-   append(data.holder.v23, NA)
    }
    
    
    if ("project-rel-pos-sWord-2" %in% names(word.list[[k]]))  {
      data.holder.v24 <-   append(data.holder.v24, word.list[[k]]$`project-rel-pos-sWord-2`$text)
    } else {
      data.holder.v24 <-   append(data.holder.v24, NA)
    }
    
    
    if ("rel-pos-sWord-0" %in% names(word.list[[k]]))  {
      data.holder.v25 <-   append(data.holder.v25, word.list[[k]]$`rel-pos-sWord-0`$text)
    } else {
      data.holder.v25 <-   append(data.holder.v25, NA)
    }
    
    
    if ("rel-pos-sWord-1" %in% names(word.list[[k]]))  {
      data.holder.v26 <-   append(data.holder.v26, word.list[[k]]$`rel-pos-sWord-1`$text)
    } else {
      data.holder.v26 <-   append(data.holder.v26, NA)
    }
   
    
    if ("rel-pos-sWord-2" %in% names(word.list[[k]]))  {
      data.holder.v27 <-   append(data.holder.v27, word.list[[k]]$`rel-pos-sWord-2`$text)
    } else {
      data.holder.v27 <-   append(data.holder.v27, NA)
    }
    
    
    if ("rel-pos-sWord-3" %in% names(word.list[[k]]))  {
      data.holder.v28 <-   append(data.holder.v28, word.list[[k]]$`rel-pos-sWord-3`$text)
    } else {
      data.holder.v28 <-   append(data.holder.v28, NA)
    }
    
    
    if ("rel-pos-sWord-3" %in% names(word.list[[k]]))  {
      data.holder.v28 <-   append(data.holder.v28, word.list[[k]]$`rel-pos-sWord-3`$text)
    } else {
      data.holder.v26 <-   append(data.holder.v26, NA)
    }
    
    
    if ("rel-pos-sWord-4" %in% names(word.list[[k]]))  {
      data.holder.v29 <-   append(data.holder.v29, word.list[[k]]$`rel-pos-sWord-4`$text)
    } else {
      data.holder.v29 <-   append(data.holder.v29, NA)
    }
    
    
    if ("rel-sWord-0" %in% names(word.list[[k]]))  {
      data.holder.v30 <-   append(data.holder.v30, word.list[[k]]$`rel-sWord-0`$text)
    } else {
      data.holder.v30 <-   append(data.holder.v30, NA)
    }
    
    
    if ("rel-sWord-1" %in% names(word.list[[k]]))  {
      data.holder.v31 <-   append(data.holder.v31, word.list[[k]]$`rel-sWord-1`$text)
    } else {
      data.holder.v31 <-   append(data.holder.v31, NA)
    }
    
    
    if ("rel-sWord-2" %in% names(word.list[[k]]))  {
      data.holder.v32 <-   append(data.holder.v32, word.list[[k]]$`rel-sWord-2`$text)
    } else {
      data.holder.v32 <-   append(data.holder.v32, NA)
    }
    
    
    if ("rel-sWord-3" %in% names(word.list[[k]]))  {
      data.holder.v33 <-   append(data.holder.v33, word.list[[k]]$`rel-sWord-3`$text)
    } else {
      data.holder.v33 <-   append(data.holder.v33, NA)
    }
   
    
    if ("rel-sWord-4" %in% names(word.list[[k]]))  {
      data.holder.v34 <-   append(data.holder.v34, word.list[[k]]$`rel-sWord-4`$text)
    } else {
      data.holder.v34 <-   append(data.holder.v34, NA)
    }
    
    
    if ("pos-sWord-0" %in% names(word.list[[k]]))  {
      data.holder.v35 <-   append(data.holder.v35, word.list[[k]]$`pos-sWord-0`$text)
    } else {
      data.holder.v35 <-   append(data.holder.v35, NA)
    }
    
    
    if ("pos-sWord-1" %in% names(word.list[[k]]))  {
      data.holder.v36 <-   append(data.holder.v36, word.list[[k]]$`pos-sWord-1`$text)
    } else {
      data.holder.v36 <-   append(data.holder.v36, NA)
    }
    
    
    if ("pos-sWord-2" %in% names(word.list[[k]]))  {
      data.holder.v37 <-   append(data.holder.v37, word.list[[k]]$`pos-sWord-2`$text)
    } else {
      data.holder.v37 <-   append(data.holder.v37, NA)
    }
    
    
    if ("pos-sWord-3" %in% names(word.list[[k]]))  {
      data.holder.v38 <-   append(data.holder.v38, word.list[[k]]$`pos-sWord-3`$text)
    } else {
      data.holder.v38 <-   append(data.holder.v38, NA)
    }
    
    
    if ("pos-sWord-4" %in% names(word.list[[k]]))  {
      data.holder.v39 <-   append(data.holder.v39, word.list[[k]]$`pos-sWord-4`$text)
    } else {
      data.holder.v39 <-   append(data.holder.v39, NA)
    }
    
    
   
    data.holder.v40 <- append(data.holder.v40,  word.list[[k]]$.attrs["cite"])
    
    
    
  } # end of loop k
  
  
   data.holder.v1  <- tolower(data.holder.v1)
   data.holder.v2  <- tolower(data.holder.v2)
   data.holder.v3  <- tolower(data.holder.v3)
   data.holder.v4  <- tolower(data.holder.v4)
   data.holder.v5  <- tolower(data.holder.v5)
   data.holder.v6  <- tolower(data.holder.v6)
   data.holder.v7  <- tolower(data.holder.v7)
   data.holder.v8  <- tolower(data.holder.v8)
   data.holder.v9  <- tolower(data.holder.v9)
   data.holder.v10  <- tolower(data.holder.v10)
   data.holder.v11  <- tolower(data.holder.v11)
   data.holder.v12  <- tolower(data.holder.v12)
   data.holder.v13  <- tolower(data.holder.v13)
   data.holder.v14  <- tolower(data.holder.v14)
   data.holder.v15  <- tolower(data.holder.v15)
   data.holder.v16  <- tolower(data.holder.v16)
   data.holder.v17  <- tolower(data.holder.v17)
   data.holder.v18  <- tolower(data.holder.v18)
   data.holder.v19  <- tolower(data.holder.v19)
   data.holder.v20  <- tolower(data.holder.v20)
   data.holder.v21  <- tolower(data.holder.v21)
   data.holder.v22  <- tolower(data.holder.v22)
   data.holder.v23  <- tolower(data.holder.v23)
   data.holder.v24  <- tolower(data.holder.v24)
   data.holder.v25  <- tolower(data.holder.v25)
   data.holder.v26  <- tolower(data.holder.v26)
   data.holder.v27  <- tolower(data.holder.v27)
   data.holder.v28  <- tolower(data.holder.v28)
   data.holder.v29  <- tolower(data.holder.v29)
   data.holder.v30  <- tolower(data.holder.v30)
   data.holder.v31  <- tolower(data.holder.v31)
   data.holder.v32  <- tolower(data.holder.v32)
   data.holder.v33  <- tolower(data.holder.v33)
   data.holder.v34  <- tolower(data.holder.v34)
   data.holder.v35  <- tolower(data.holder.v35)
   data.holder.v36  <- tolower(data.holder.v36)
   data.holder.v37  <- tolower(data.holder.v37)
   data.holder.v38  <- tolower(data.holder.v38)
   data.holder.v39  <- tolower(data.holder.v39)
  
  
  
  
   data.vector.list1[[i]]  <- data.holder.v1
   data.vector.list2[[i]]  <- data.holder.v2
   data.vector.list3[[i]]  <- data.holder.v3
   data.vector.list4[[i]]  <- data.holder.v4
   data.vector.list5[[i]]  <- data.holder.v5
   data.vector.list6[[i]]  <- data.holder.v6
   data.vector.list7[[i]]  <- data.holder.v7
   data.vector.list8[[i]]  <- data.holder.v8
   data.vector.list9[[i]]  <- data.holder.v9
   data.vector.list10[[i]]  <- data.holder.v10
   data.vector.list11[[i]]  <- data.holder.v11
   data.vector.list12[[i]]  <- data.holder.v12
   data.vector.list13[[i]]  <- data.holder.v13
   data.vector.list14[[i]]  <- data.holder.v14
   data.vector.list15[[i]]  <- data.holder.v15
   data.vector.list16[[i]]  <- data.holder.v16
   data.vector.list17[[i]]  <- data.holder.v17
   data.vector.list18[[i]]  <- data.holder.v18
   data.vector.list19[[i]]  <- data.holder.v19
   data.vector.list20[[i]]  <- data.holder.v20
   data.vector.list21[[i]]  <- data.holder.v21
   data.vector.list22[[i]]  <- data.holder.v22
   data.vector.list23[[i]]  <- data.holder.v23
   data.vector.list24[[i]]  <- data.holder.v24
   data.vector.list25[[i]]  <- data.holder.v25
   data.vector.list26[[i]]  <- data.holder.v26
   data.vector.list27[[i]]  <- data.holder.v27
   data.vector.list28[[i]]  <- data.holder.v28
   data.vector.list29[[i]]  <- data.holder.v29
   data.vector.list30[[i]]  <- data.holder.v30
   data.vector.list31[[i]]  <- data.holder.v31
   data.vector.list32[[i]]  <- data.holder.v32
   data.vector.list33[[i]]  <- data.holder.v33
   data.vector.list34[[i]]  <- data.holder.v34
   data.vector.list35[[i]]  <- data.holder.v35
   data.vector.list36[[i]]  <- data.holder.v36
   data.vector.list37[[i]]  <- data.holder.v37
   data.vector.list38[[i]]  <- data.holder.v38
   data.vector.list39[[i]]  <- data.holder.v39
   data.vector.list40[[i]]  <- data.holder.v40
  
  
} # end of loop i



 names(data.vector.list1)  <- bookids.v
 names(data.vector.list2)  <- bookids.v
 names(data.vector.list3)  <- bookids.v
 names(data.vector.list4)  <- bookids.v
 names(data.vector.list5)  <- bookids.v
 names(data.vector.list6)  <- bookids.v
 names(data.vector.list7)  <- bookids.v
 names(data.vector.list8)  <- bookids.v
 names(data.vector.list9)  <- bookids.v
 names(data.vector.list10)  <- bookids.v
 names(data.vector.list11)  <- bookids.v
 names(data.vector.list12)  <- bookids.v
 names(data.vector.list13)  <- bookids.v
 names(data.vector.list14)  <- bookids.v
 names(data.vector.list15)  <- bookids.v
 names(data.vector.list16)  <- bookids.v
 names(data.vector.list17)  <- bookids.v
 names(data.vector.list18)  <- bookids.v
 names(data.vector.list19)  <- bookids.v
 names(data.vector.list20)  <- bookids.v
 names(data.vector.list21)  <- bookids.v
 names(data.vector.list22)  <- bookids.v
 names(data.vector.list23)  <- bookids.v
 names(data.vector.list24)  <- bookids.v
 names(data.vector.list25)  <- bookids.v
 names(data.vector.list26)  <- bookids.v
 names(data.vector.list27)  <- bookids.v
 names(data.vector.list28)  <- bookids.v
 names(data.vector.list29)  <- bookids.v
 names(data.vector.list30)  <- bookids.v
 names(data.vector.list31)  <- bookids.v
 names(data.vector.list32)  <- bookids.v
 names(data.vector.list33)  <- bookids.v
 names(data.vector.list34)  <- bookids.v
 names(data.vector.list35)  <- bookids.v
 names(data.vector.list36)  <- bookids.v
 names(data.vector.list37)  <- bookids.v
 names(data.vector.list38)  <- bookids.v
 names(data.vector.list39)  <- bookids.v
 names(data.vector.list40)  <- bookids.v


 save(data.vector.list1, file="./complex_sWord_data/data.vector.list1.R")
  save(data.vector.list2, file="./complex_sWord_data/data.vector.list2.R")
  save(data.vector.list3, file="./complex_sWord_data/data.vector.list3.R")
  save(data.vector.list4, file="./complex_sWord_data/data.vector.list4.R")
  save(data.vector.list5, file="./complex_sWord_data/data.vector.list5.R")
  save(data.vector.list6, file="./complex_sWord_data/data.vector.list6.R")
  save(data.vector.list7, file="./complex_sWord_data/data.vector.list7.R")
  save(data.vector.list8, file="./complex_sWord_data/data.vector.list8.R")
  save(data.vector.list9, file="./complex_sWord_data/data.vector.list9.R")
  save(data.vector.list10, file="./complex_sWord_data/data.vector.list10.R")
  save(data.vector.list11, file="./complex_sWord_data/data.vector.list11.R")
  save(data.vector.list12, file="./complex_sWord_data/data.vector.list12.R")
  save(data.vector.list13, file="./complex_sWord_data/data.vector.list13.R")
  save(data.vector.list14, file="./complex_sWord_data/data.vector.list14.R")
  save(data.vector.list15, file="./complex_sWord_data/data.vector.list15.R")
  save(data.vector.list16, file="./complex_sWord_data/data.vector.list16.R")
  save(data.vector.list17, file="./complex_sWord_data/data.vector.list17.R")
  save(data.vector.list18, file="./complex_sWord_data/data.vector.list18.R")
  save(data.vector.list19, file="./complex_sWord_data/data.vector.list19.R")
  save(data.vector.list20, file="./complex_sWord_data/data.vector.list20.R")
  save(data.vector.list21, file="./complex_sWord_data/data.vector.list21.R")
  save(data.vector.list22, file="./complex_sWord_data/data.vector.list22.R")
  save(data.vector.list23, file="./complex_sWord_data/data.vector.list23.R")
  save(data.vector.list24, file="./complex_sWord_data/data.vector.list24.R")
  save(data.vector.list25, file="./complex_sWord_data/data.vector.list25.R")
  save(data.vector.list26, file="./complex_sWord_data/data.vector.list26.R")
  save(data.vector.list27, file="./complex_sWord_data/data.vector.list27.R")
  save(data.vector.list28, file="./complex_sWord_data/data.vector.list28.R")
  save(data.vector.list29, file="./complex_sWord_data/data.vector.list29.R")
  save(data.vector.list30, file="./complex_sWord_data/data.vector.list30.R")
  save(data.vector.list31, file="./complex_sWord_data/data.vector.list31.R")
  save(data.vector.list32, file="./complex_sWord_data/data.vector.list32.R")
  save(data.vector.list33, file="./complex_sWord_data/data.vector.list33.R")
  save(data.vector.list34, file="./complex_sWord_data/data.vector.list34.R")
  save(data.vector.list35, file="./complex_sWord_data/data.vector.list35.R")
  save(data.vector.list36, file="./complex_sWord_data/data.vector.list36.R")
  save(data.vector.list37, file="./complex_sWord_data/data.vector.list37.R")
  save(data.vector.list38, file="./complex_sWord_data/data.vector.list38.R")
  save(data.vector.list39, file="./complex_sWord_data/data.vector.list39.R")
  save(data.vector.list40, file="./complex_sWord_data/data.vector.list40.R")
 
 
 ###################################################################################
 
  
  
 lengths (data.vector.list40)
  names(data.vector.list40)
j <- 1

for (j in 1:40)  {
 
  nam <- paste("data.vector.list", j, sep = "")
  nam2 <- paste("./complex_sWord_data/", nam, ".R", sep = "")
  
  print( paste("save(data.vector.list", j, ", file=", nam2, ")", sep = ""))

  
 
  
  
  
} # end of loop j

nam

names(data.vector.list40) <- bookids.v
names(data.vector.list20)
names(nam) <- bookids.v
data.vector.list40[["f"]]

data.holder <- nam


seq_along(data.vector.list1)
nam


result <- xtabs(Freq ~ ID+data.holder.v, data=freqs.df)


final.m <- apply(result, 2, as.numeric)

# create list of names for rows
bookids.v <- gsub(".xml", "", files.v)

sorted.m <- final.m[, order(colSums(final.m), decreasing=TRUE) ]
dim(sorted.m)

row.names(sorted.m) <- bookids.v
nam2 <- paste("./complex_sWord_data/", nam, ".R", sep = "")

write.csv(sorted.m, file = nam)













data.holder.v11 <-   append(data.holder.v11, word.list[[k]]$`DD-pos-sWord-2`$text)
data.holder.v12 <-   append(data.holder.v12, word.list[[k]]$`DD-pos-sWord-3`$text)
data.holder.v13 <-   append(data.holder.v13, word.list[[k]]$`Neighborhood-rel-pos-sWord-0`$text)
data.holder.v14 <-   append(data.holder.v14, word.list[[k]]$`Neighborhood-rel-pos-sWord-1`$text)
data.holder.v15 <-   append(data.holder.v15, word.list[[k]]$`Neighborhood-rel-pos-sWord-2`$text)
data.holder.v16 <-   append(data.holder.v16, word.list[[k]]$`Neighborhood-rel-sWord-0`$text)
data.holder.v17 <-   append(data.holder.v17, word.list[[k]]$`Neighborhood-rel-sWord-1`$text)
data.holder.v18 <-   append(data.holder.v18, word.list[[k]]$`Neighborhood-rel-sWord-2`$text)
data.holder.v19 <-   append(data.holder.v19, word.list[[k]]$`Neighborhood-pos-sWord-0`$text)
data.holder.v20 <-   append(data.holder.v20, word.list[[k]]$`Neighborhood-pos-sWord-1`$text)
data.holder.v21 <-   append(data.holder.v21, word.list[[k]]$`Neighborhood-pos-sWord-2`$text)
data.holder.v22 <-   append(data.holder.v22, word.list[[k]]$`project-rel-pos-sWord-0`$text)
data.holder.v23 <-   append(data.holder.v23, word.list[[k]]$`project-rel-pos-sWord-1`$text)
data.holder.v24 <-   append(data.holder.v24, word.list[[k]]$`project-rel-pos-sWord-2`$text)
data.holder.v25 <-   append(data.holder.v25, word.list[[k]]$`rel-pos-sWord-0`$text)
data.holder.v26 <-   append(data.holder.v26, word.list[[k]]$`rel-pos-sWord-1`$text)
data.holder.v27 <-   append(data.holder.v27, word.list[[k]]$`rel-pos-sWord-2`$text)
data.holder.v28 <-   append(data.holder.v28, word.list[[k]]$`rel-pos-sWord-3`$text)
data.holder.v29 <-   append(data.holder.v29, word.list[[k]]$`rel-pos-sWord-4`$text)
data.holder.v30 <-   append(data.holder.v30, word.list[[k]]$`rel-sWord-0`$text)
data.holder.v31 <-   append(data.holder.v31, word.list[[k]]$`rel-sWord-1`$text)
data.holder.v32 <-   append(data.holder.v32, word.list[[k]]$`rel-sWord-2`$text)
data.holder.v33 <-   append(data.holder.v33, word.list[[k]]$`rel-sWord-3`$text)
data.holder.v34 <-   append(data.holder.v34, word.list[[k]]$`rel-sWord-4`$text)
data.holder.v35 <-   append(data.holder.v35, word.list[[k]]$`pos-sWord-0`$text)
data.holder.v36 <-   append(data.holder.v36, word.list[[k]]$`pos-sWord-1`$text)
data.holder.v37 <-   append(data.holder.v37, word.list[[k]]$`pos-sWord-2`$text)
data.holder.v38 <-   append(data.holder.v38, word.list[[k]]$`pos-sWord-3`$text)
data.holder.v39 <-   append(data.holder.v39, word.list[[k]]$`pos-sWord-4`$text)

data.vector.list11[[i]]  <- data.holder.v11
data.vector.list12[[i]]  <- data.holder.v12
data.vector.list13[[i]]  <- data.holder.v13
data.vector.list14[[i]]  <- data.holder.v14
data.vector.list15[[i]]  <- data.holder.v15
data.vector.list16[[i]]  <- data.holder.v16
data.vector.list17[[i]]  <- data.holder.v17
data.vector.list18[[i]]  <- data.holder.v18
data.vector.list19[[i]]  <- data.holder.v19
data.vector.list20[[i]]  <- data.holder.v20
data.vector.list21[[i]]  <- data.holder.v21
data.vector.list22[[i]]  <- data.holder.v22
data.vector.list23[[i]]  <- data.holder.v23
data.vector.list24[[i]]  <- data.holder.v24
data.vector.list25[[i]]  <- data.holder.v25
data.vector.list26[[i]]  <- data.holder.v26
data.vector.list27[[i]]  <- data.holder.v27
data.vector.list28[[i]]  <- data.holder.v28
data.vector.list29[[i]]  <- data.holder.v29
data.vector.list30[[i]]  <- data.holder.v30
data.vector.list31[[i]]  <- data.holder.v31
data.vector.list32[[i]]  <- data.holder.v32
data.vector.list33[[i]]  <- data.holder.v33
data.vector.list34[[i]]  <- data.holder.v34
data.vector.list35[[i]]  <- data.holder.v35
data.vector.list36[[i]]  <- data.holder.v36
data.vector.list37[[i]]  <- data.holder.v37
data.vector.list38[[i]]  <- data.holder.v38
data.vector.list39[[i]]  <- data.holder.v39


word.list[[2]]$.attrs["cite"]

data.vector.list1
lengths(data.vector.list13)
files.v[12]
data.vector.list40[[12]][6654]

