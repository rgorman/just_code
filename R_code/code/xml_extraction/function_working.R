



raw.subtree.l <- list() # list to store subtree generated from edge matrix made from heads.v and ids.v.

neighborhood.l <- list() # list to store for each node in a sentence j the closed neighborhood.  This means
# the @id of the vertex itself and all its immediate dependents.





extract_heads <- function(x) {
  a <- NULL
  a <- append(a, x["head"])
  return(as.numeric(a))
}

extract_ids <- function(x) {
  a <- NULL
  a <- append(a, x["id"])
  return(as.numeric(a))
}

heads.v <- unlist(lapply(zzz, extract_heads))
ids.v <- unlist(lapply(zzz, extract_ids))






edge.matrix <- matrix(heads.v, ncol=1) # create matrix of @head attributes of each word. Row number is equal to
# number of words in sentence. Column number = 1.

edge.matrix <- cbind(edge.matrix, ids.v) # add second column to matrix, containing @id attributes for each word.

index <- which(edge.matrix[, 1] > 0) # make vector containing position of each row in matrix
# whose @head attribute is greater than zero. This step removes punctuation
# and also removes an edge from the root vertex to a "parent."

short.edge.matrix <- matrix(edge.matrix[index, ], ncol = 2) # Use index to make new matrix without any cases of head = 0.
graph.object <- graph_from_edgelist(short.edge.matrix) # create graph using igraph function.

raw.subtree.l <- ego(graph.object, 50, mode = "out") # populate raw.subtree.l
# with subtrees for each vertex in input vector.
# first parameter = input graph, second parameter = number of "steps"
# to take to find elements of subtree (50 is chosen as greater than any in corpus)
# mode parameter = "out" finds descendents, mode = "in" finds ancestors.

neighborhood.l <- ego(graph.object, 1, mode = "out") # populate neighborhood.l with subtrees of distance = 1.
