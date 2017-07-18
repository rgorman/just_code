
rm(zzz)

find_heads(sent_working)

zzz <- extract_edge_graph(sent_working)

extract_edge_graph <- function(x) {
  a <- find_heads(x)
  b <- find_ids(x)
  m <- matrix(a, ncol = 1)
  m <- cbind(m, b)
  index <- which(m[, 1] > 0)
  m <- m[index, ]
  g <- graph_from_edgelist(m)
  return(g)
}

edge.matrix <- matrix(heads.v, ncol=1) # create matrix of @head attributes of each word. Row number is equal to
# number of words in sentence. Column number = 1.

edge.matrix <- cbind(edge.matrix, ids.v) # add second column to matrix, containing @id attributes for each word.

index <- which(edge.matrix[, 1] > 0) # make vector containing position of each row in matrix
# whose @head attribute is greater than zero. This step removes punctuation
# and also removes an edge from the root vertex to a "parent."

short.edge.matrix <- matrix(edge.matrix[index, ], ncol = 2) # Use index to make new matrix without any cases of head = 0.
graph.object <- graph_from_edgelist(short.edge.matrix) # create graph using igraph function.


DD_crit.v <- sapply(sent_working, DD_criteria) # returns vector of logical values corresponding to DD criteria.
# Any TRUE value indicates that a DD should not be calculated for the relevant token.

DD_calculation <- function(x) {
  a <- NULL
  word.v <- NULL
  word.v <- append(word.v, as.numeric(x["head"]) == 0) # Nodes dependent on 0 (sentence root, etc) have no DD.
  
  # a set of lines to catch punctuation; no DD should be figured for punctuation marks. This code is somewhat redundant,
  # since it checks for relation values commonly assigned to punctuation and also checks part of speech attribute
  # for value "punctuation."
  word.v <- append(word.v, x["relation"] == "AuxX") # If node is comma, assign TRUE.
  word.v <- append(word.v, x["relation"] == "AuxK") # If node is sentence final punctuation, assign TRUE.
  word.v <- append(word.v, x["relation"] == "AuxG") # If node is bracketing punctuation, assign TRUE.
  word.v <- append(word.v, substr(x["postag"], 1, 1) == "u") # If part of speech is "punctuation", mark TRUE.
  
  
  word.v <- append(word.v, "insertion_id" %in% names(x)) # Nodes that are ellipses have no DD.
  word.v <- append(word.v, ellipsis.v[as.numeric(x["head"])]) # Nodes dependent on ellipses have no DD. This assessment
  # requires ellipsis.v as input. That vector is the output of
  # function ellip_1().
  
  node_DD.v <- NULL
  
  
  if (TRUE %in% word.v) { # do not calculate DD
    
    node_DD.v <- NA
    
  } else {
    # p.holder.v <- length(seq(heads.v[k], ids.v[k])) - length(setdiff(seq(heads.v[k], ids.v[k]), punct.index.v))
    a <-  length(seq(as.numeric(x["head"]), as.numeric(x["id"]))) - length(setdiff(seq(as.numeric(x["head"]), as.numeric(x["id"])),
                                                                                   punct.index.v))
    
    if (as.numeric(x["head"]) > as.numeric(x["id"])) { # Selects for a head node that follows the child node.
      a <- as.numeric(x["head"]) - (as.numeric(x["id"]) + a)  # Effectively moves child node (the subtrahend) closer in value to the head.
      
      if (a > 6) {
        node_DD.v <- append(node_DD.v, "GT6")
        
      } else {
        
        node_DD.v <- append(node_DD.v, a)
      }
      
    } else { # Selects for a head node that precedes the child node.
      # p.holder.v <- (heads.v[k] + p.holder.v) - ids.v[k] # Effectively moves head node (the minuend) closer in value to the child.
      
      a <- (as.numeric(x["head"]) + a) - as.numeric(x["id"]) # Effectively moves head node (the minuend) closer in value to the child.
      if ( a < (0 - 6 )) {
        
        node_DD.v <- append(node_DD.v, "LT-6")
        
      } else {
        
        node_DD.v <- append(node_DD.v, a)
      }
      
    }
    
    # if (heads.v[k] > ids.v[k])  { # Tests whether head node follows child node.
    
    
    
  }
  
  return(node_DD.v)
  
} # end of DD_calculation() function.




#################################
punct.index.v <- unlist(lapply(sent_working, find_punct_index))


sapply(sent_working, DD_calculation)


if (heads.v[k] > ids.v[k])  { # Tests whether head node follows child node.
  p.holder.v <- heads.v[k] - (ids.v[k] + p.holder.v) # Effectively moves child node (the subtrahend) closer in value to the head.
  
  if (p.holder.v > 6) { # A test to find and bin large dependency distnces
    
    node.DepDist.v <- append(node.DepDist.v, "GT6")
    holder.node.DepDist.v <- append(holder.node.DepDist.v, p.holder.v) # Adds value to vector. 
    
  } else {
    
    node.DepDist.v <- append(node.DepDist.v, p.holder.v) # Adds value to vector.  
    holder.node.DepDist.v <- append(holder.node.DepDist.v, p.holder.v) # Adds value to vector. 
    
  }
  
  
} else { # Test is true when child node follows head.
  
  p.holder.v <- (heads.v[k] + p.holder.v) - ids.v[k] # Effectively moves head node (the minuend) closer in value to the child.
  
  if (p.holder.v < -6) {
    
    node.DepDist.v <- append(node.DepDist.v, "LT-6")
    holder.node.DepDist.v <- append(holder.node.DepDist.v, p.holder.v) # Adds value to vector. 
    
    
  } else {
    
    node.DepDist.v <- append(node.DepDist.v, p.holder.v) # Adds value to the vector.
    
    holder.node.DepDist.v <- append(holder.node.DepDist.v, p.holder.v) # Adds value to vector.             
    
  }
  
  
  
}


}

}


