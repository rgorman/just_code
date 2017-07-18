
projectivity_extraction <- function(x) {
  
  
  if (as.numeric(x["id"]) <= length(subtree.l) & node.list$Projectivity_eligibility[[as.numeric(x["id"])]] == TRUE & 
      (length(node.list$Subtree[as.numeric(x["id"])]) > 0)) {
    
    if (! ("insertion_id" %in% names(x)) & (length(node.list$Subtree[as.numeric(x["id"])]) = 1)) {
      
     a <- unlist(strsplit(node.list$Subtree[as.numeric(x["id"])], " "))
     a <- as.numeric(a)
     b <- min(a, na.rm = TRUE) : max(a, na.rm = TRUE)
     c <- setdiff(b, a)
     d <- sapply(c, punc_in_gap)
     d <- append(d, sapply(x, ellipis_in_gap))
     
     if (FALSE %in% d) {
       e <- "NonProjective"
     } else {
       
       e <- "Projective"
       
     }
      
    }
    
  } else {
    
    e <- NA
  }
 
}



projectivity_extraction <- function(x) {
  
  
  if (as.numeric(x["id"]) <= length(subtree.l) & node.list$Projectivity_eligibility[[as.numeric(x["id"])]] == TRUE & 
      (length(node.list$Subtree[as.numeric(x["id"])]) > 0)) {
    
    
      a <- unlist(strsplit(node.list$Subtree[as.numeric(x["id"])], " "))
      a <- as.numeric(a)
      b <- min(a, na.rm = TRUE) : max(a, na.rm = TRUE)
      c <- setdiff(b, a)
      d <- sapply(c, punc_in_gap)
      d <- append(d, sapply(x, ellipis_in_gap))
      
      if (FALSE %in% d) {
        e <- "NonProjective"
      } else {
        
        e <- "Projective"
        
      }
    
    
  } else {
    
    e <- NA
  }
  
}



node.list$Projectivity_eligibility


projectivity_eligibility <- function(x) {
  a <- NULL
  a <- append(a, x["relation"] == "AuxX")
  a <- append(a, x["relation"] == "AuxK")
  a <- append(a, x["relation"] == "AuxG")
  a <- append(a, "insertion_id" %in% names(x))
  
  if (TRUE %in% a) {
    
    return(FALSE)
  } else {
    
    return(TRUE)
  }
  
}



word.v <- append(word.v, x["relation"] == "AuxX") # If node is comma, assign TRUE.
word.v <- append(word.v, x["relation"] == "AuxK") # If node is sentence final punctuation, assign TRUE.
word.v <- append(word.v, x["relation"] == "AuxG") # If node is bracketing punctuation, assign TRUE.


if (TRUE %in% word.v) { # Checks word.v for any TRUE value.  Such a value disqualifies node from DD calculation.
  return(FALSE) # Node does NOT qualify for DD calculation.
} else
  return(TRUE) # Node may be used in DD calculation.


neighborhood_values_extraction <- function(x) {
  
  result <- NULL
  
  if (node.list$Subtree_eligibility[as.numeric(x["id"])] == TRUE)  {
    
    a <-  strsplit(node.list$Neighborhood[as.numeric(x["id"])], " ")
    a <- sapply(a, as.numeric)
    a <- sort(a)
    
    holder1 <- NULL
    holder2 <- NULL
    holder3 <- NULL
    
    
    if (length(a) == 1) {
      
      b <- paste("Leaf", x["relation"], sep = ".")
      c <- paste("Leaf", substr(x["postag"], 1,1), sep = ".")
      d <- paste(b,  substr(x["postag"], 1,1), sep = "-")
      
     result <- append(b, c)
     result <- append(result, d)
      
    } else { # neighborhood with more than 1 member
      
      index <- which(as.numeric(x["id"]) == a)
      e <-  sapply (a, rel_extraction)
      f <- e[which(as.numeric(x["id"]) == a)] 
      g <- paste("Self", f, sep = ".")
      
      holder1 <- e
      holder1[index] <- g
      holder1 <- paste(holder1, collapse = "-")
      
      
      
      h <- sapply (a, pos_extraction)
      i <-  substr(h[which(as.numeric(x["id"]) == a)], 1, 1) 
      j <- paste("Self", i, sep = ".")
      holder2 <- i
      holder2[index] <- j
      holder2 <- paste(holder2, collapse = "-")
      
      
     # result <-  paste(result, collapse = "-")
      
      k <- sapply(a, rel_pos_extraction)
      l <- k[which(as.numeric(x["id"]) == a)] 
      m <- paste("Self", l, sep = ".")
      holder3 <- k
      holder3[index] <- m
      holder3 <- paste(holder3, collapse = "-")
      
      result <- append(holder1, holder2)
      result <- append(result, holder3)
      
      
      return(result)
      
    }
      
  } else {
    
    return("NA")
  }
  
}

z <-  sapply(sent_working, rel_neighborhood_extraction)

a <- vector("integer", 5)
a[3] <- 5

rel_extraction <- function(x)  {
  a <-  sent_working[[x]]["relation"]
}

pos_extraction <- function(x)  {
  a <-  sent_working[[x]]["postag"]
}

rel_pos_extraction <- function(x) {
  a <- sent_working[[x]]["relation"]
  b <- substr(sent_working[[x]]["postag"], 1, 1)
  c <- paste(a, b, sep = "-")
  
}


z <-  sapply(sent_working, rel_neighborhood_extraction)

paste(z[[1]], collapse = "-")
z[[1]]

substr(n.holder.v["word.postag"], 1, 1)


rel.v <-  paste("Leaf", n.holder.v["word.relation"],  sep = ".")



abs_DD_calculation <- function(x) { # A function to calculate DD for each eligible node.
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
    
    
    a <-  length(seq(as.numeric(x["head"]), as.numeric(x["id"]))) - length(setdiff(seq(as.numeric(x["head"]), as.numeric(x["id"])),
                                                                                   punct.index.v))
    
    if (as.numeric(x["head"]) > as.numeric(x["id"])) { # Selects for a head node that follows the child node.
      
      a <- as.numeric(x["head"]) - (as.numeric(x["id"]) + a)  # Effectively moves child node (the subtrahend) closer in value to the head.
      node_DD.v <- append(node_DD.v, a) 
      
    } else { # Selects for a head node that precedes the child node.
      # p.holder.v <- (heads.v[k] + p.holder.v) - ids.v[k] # Effectively moves head node (the minuend) closer in value to the child.
      
      a <- (as.numeric(x["head"]) + a) - as.numeric(x["id"]) # Effectively moves head node (the minuend) closer in value to the child.
      
      
      node_DD.v <- append(node_DD.v, a)
      
      
    }
    
    
    
  }
  
  return(abs(node_DD.v))
  
} # end of DD_calculation() function.


mean(sapply(sent_working, abs_DD_calculation), na.rm = TRUE)


sent_projectivity <- function(x)  {
  if("NonProjective" %in% node.list$Projectivity) {
    return("NonProjective")
  } else {
    return("Projective")
  }
}

a <- if("NonProjective" %in% node.list$Projectivity) {
  "NonProjective"
} else {
  "Projective"
}

sent_projectivity(frog)
node.list$Projectivity



b <- unlist(sentence.list[[j]][[k]]) # vector of attributes for given word element.
word.xml <- xmlNode("word") # create word xml node

# The following if/else switch accounts for the different attributes in ellipsis vertices

if ("insertion_id" %in% names(b)) {
  
  word.xml <-  addAttributes(word.xml, id=b["id"], form = b["form"],
                             lemma = b["lemma"], postag = b["postag"],
                             relation = b["relation"], head = b["head"],
                             cite = b["cite"], insertion_id = b["insertion_id"],
                             artificial = b["artificial"],  Subtree = raw.subtree.v,
                             Projectivity = projectivity.attr,
                             DepDist = node.DepDist.v[k],
                             Neighborhood = neighborhood.attr.v,
                             Relation_Subtree = rel.holder.v[k],
                             POS_Subtree = pos.holder.v[k], 
                             Rel_Pos_Subtree = rel.pos.holder.v[k]) # populate node from input xml. Add new @Subtree attribute.
  
  
  
} else  {
  
  word.xml <-  addAttributes(word.xml, id=b["id"], form = b["form"],
                             lemma = b["lemma"], postag = b["postag"],
                             relation = b["relation"], head = b["head"],
                             cite = b["cite"], Subtree = raw.subtree.v,
                             Projectivity = projectivity.attr,
                             DepDist = node.DepDist.v[k],
                             Neighborhood = neighborhood.attr.v,
                             Relation_Subtree = rel.holder.v[k],
                             POS_Subtree = pos.holder.v[k], 
                             Rel_Pos_Subtree = rel.pos.holder.v[k]) # populate node from input xml. Add new @Subtree attribute.
  
  
} # end of if/else switch



sent.xml <- append.xmlNode(sent.xml, word.xml) # insert word.xml as child of given sentence node.

}


k <- 1 # reset iterator for each token.



ellipsis_identification <- function(x) {
  "insertion_id" %in% names(x)
}

sapply(sent_working, ellipsis_identification)


populate_word_element <- function(x) {
  y <- as.numeric(x["id"])
  word.xml <- xmlNode("word") # create word xml node
  
  if (node.list$Ellipsis[y] == FALSE) {
    
    word.xml <- addAttributes(word.xml, id = x["id"], form = x["form"], lemma = x["lemma"], postag = x["postag"],
                              relation = x["relation"], head = x["head"], cite = x["cite"], Subtree = node.list$Subtree[y],
                              Projectivity = node.list$Projectivity[y], DepDist = node.list$DepDist[y],
                              Neighborhood = node.list$Neighborhood[y], Relation_Subtree = node.list$Neighborhood_values[[y]][1],
                              POS_Subtree = node.list$Neighborhood_values[[y]][2], Rel_Pos_Subtree = node.list$Neighborhood_values[[y]][3])
    
  } else {
    
    word.xml <- addAttributes(word.xml, id = x["id"], form = x["form"], lemma = x["lemma"], postag = x["postag"],
                              relation = x["relation"], head = x["head"], cite = x["cite"], insertion_id = x["insertion_id"],
                              artificial = x["artificial"], Subtree = node.list$Subtree[y],
                              Projectivity = node.list$Projectivity[y], DepDist = node.list$DepDist[y],
                              Neighborhood = node.list$Neighborhood[y], Relation_Subtree = node.list$Neighborhood_values[[y]][1],
                              POS_Subtree = node.list$Neighborhood_values[[y]][2], Rel_Pos_Subtree = node.list$Neighborhood_values[[y]][3])
    
  }
  
  return(word.xml)
}


lapply(sent_working, populate_word_element)

n.xml <- xmlNode("sentence") # create sentence node
n.xml <- append.xmlNode(n.xml, lapply(sent_working, populate_word_element))

n.xml


extract_edge_graph <- function(x) {
  a <- find_heads(x)
  b <- find_ids(x)
  m <- matrix(a, ncol = 1)
  m <- cbind(m, b)
  index <- which(m[, 1] > 0)
  m <- m[index, ]
  if (length(m) == 2) {
    m <- matrix(m, nrow = 1)
  }
  g <- graph_from_edgelist(m)
  return(g)
}

extract_edge_graph(sent_working)

a <- c(2, 0, 0)
b <- 1:3

m
n <- matrix(m, nrow = 1)
graph_from_edgelist(n)




check_gap_heads <- function(x, arg2, arg3) {
  result <- NULL
  a <- sent_working[[x]]["head"]
  b <- as.numeric(a)
  result <- append(result, ((b > 0) & (b < arg2)) | b > arg3)
  
}


gap_extraction <- function(x) {
  y <- as.numeric(x["id"])
  if ("NonProjective" %in% node.list$Projectivity[y]) {
    a <- as.numeric(unlist(strsplit(node.list$Neighborhood[y], " ")))
    gap_min <- min(a)
    gap_max <- max(a)
    c <- seq(gap_min, gap_max)
    d <- which(! c %in% a)
    e <- c[d]
    
    result <- sapply(e, check_gap_heads, arg2=gap_min, arg3=gap_max)
    if (TRUE %in% result) {
      return("NonPlanar")
    } else {
      return("Planar")
    }
    
  } else {
    return("Planar")
  }
}




test1 <- lapply(sent_working, find_ill_nested)

length(which(node.list$Planarity == "NonPlanar"))

find_ill_nested <- function(x) {
  if (length(which(node.list$Planarity == "NonPlanar")) >= 2) {
    y <- as.numeric(x["id"])
    if (node.list$Planarity[y] == "NonPlanar") {
      a <- as.numeric(unlist(strsplit(node.list$Subtree[y], " ")))
      gap_min <- min(a)
      gap_max <- max(a)
      c <- seq(gap_min, gap_max)
      d <- which(! c %in% a)
      e <- c[d] 
      
      
      result <- sapply(e, check_ancestors, arg2 = y, arg3 = c)
      
      # if (TRUE %in% result) {
      #   return("WellNested")
      # } else {
      #   return("IllNested")
      #   
      # }
      
    } else {
      return("WellNested")
    }
  } else {
    return("WellNested")
  }
}




check_ancestors <- function(x, arg2, arg3) {
  a <- as.numeric(sent_working[[x]]["head"]) # head of gap word
  b <- a[which(! a %in% arg3)]
  
  c <- as.numeric(unlist(strsplit(node.list$Subtree[x], " "))) # gap word subtree
  # d <- as.numeric(unlist(strsplit(node.list$Subtree[b], " "))) # head word subtree
  # 
  # e <- arg2 %in% c
  # f <- arg2 %in% d 
  # 
  # g <- append(e, f)
  
}
