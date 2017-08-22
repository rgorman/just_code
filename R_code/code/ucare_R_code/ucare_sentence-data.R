rm(list = ls())
require(XML)

input.dir <- "./xslt_output"
files.v <- dir(path=input.dir, pattern=".*xml")


i <- 8
files.v[i]


# read xml structure from file to .R object
doc.object <- xmlTreeParse(file.path(input.dir, files.v[i]), useInternalNodes=TRUE)

# extract all <sentence> elements and children into XmlNodeList object
sentence.nodes <- getNodeSet(doc.object, "//sentence")

# extract all <sWord> elements from word,nodes. The result is an XMLNodeList object.
data.nodes <- sapply(sentence.nodes, xmlChildren)



xm <- matrix(sapply(data.nodes, xmlToList), ncol = 3, byrow = TRUE)

write.csv(xm, file = "wint-1_sent_data.csv")

sent_data.m <- read.csv(file = "deOff-1_sent_data.csv", check.names = FALSE, row.names = 1)


cor.test(log(sent_data.m[, 1]), log(sent_data.m[, 3]))

cor.test(sent_data.m[, 2], sent_data.m[, 3])

cor.test(log(sent_data.m[, 2]), sent_data.m[, 3])


