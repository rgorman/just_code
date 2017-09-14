
a <- paste('<?xml version="1.0" encoding="UTF-8"?>', '<sentence id="1" document_id="" subdoc="" span="">
             <word id="1" form="Marcus" lemma="Marcus" postag="n-s---mn-" relation="SBJ" head="3"/>
             <word id="2" form="Liviam" lemma="Livia" postag="n-s---fa-" relation="OBJ" head="3"/>
             <word id="3" form="amat" lemma="amo" postag="v3spia---" relation="PRED" head="0"/>
             <word id="4" form="." lemma="punc1" postag="u--------" relation="AuxK" head="0"/>
             </sentence>' )

a

doc <- xmlTreeParse(a)
top <- xmlRoot(doc)
b <- xmlSApply(top, function(x) xmlGetAttr(x, "id"))
c <- xmlSApply(top, function(x) xmlGetAttr(x, "head"))

b <- as.numeric(b)
c <- as.numeric(c)

edge.matrix <- matrix(b, ncol=1)
edge.matrix <- cbind(edge.matrix, c)

index <- which(edge.matrix[, 2] > 0)
# Use "index" to create new matrix.
short.edge.matrix <- edge.matrix[index, ]

# Call "archplot()" to create diagram to visualize edge crossing in sentences.
arcplot(short.edge.matrix, las = 1, sorted = TRUE, lwd.arcs = 7 )

graph.object <- graph_from_edgelist(short.edge.matrix)
plot.igraph(graph.object)
tkplot(graph.object)
curve_multiple(graph.object, start = 0.5)
