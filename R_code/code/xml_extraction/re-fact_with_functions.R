rm(list = ls())

source("./code/xml_extraction/DD_functions_1b.R")

require(XML)
require(igraph)




# Identify directory with the input files.
input.dir <- "./xml_input"

# Identify directory for the output files.
output.dir <- "./xml_output"


files.v <- dir(path=input.dir, pattern=".*xml") # A vector with each file name from input directory.
DD.l <- list() # unclear: what does this list do???
node.DD.l <- list() # unclear: what does this list do???
i <- 1
j <- 1

ptm <- proc.time()

for (i in 1:length(files.v)) {
  
  doc <- xmlParse(file.path(input.dir, files.v[i]))  # create object with full xml of tree file. 
  
  sentence.nodes <- getNodeSet(doc, "//sentence") # extract setences from full tree xml
  
  sentence.list <- xmlApply(sentence.nodes, xmlToList) # convert nodes to list object
  
  subtree.xml <- xmlNode("subTree_document") # create root node for new xml document
  
  
  
  
  for (j in 1:length(sentence.list)) {
    
    
    
    
    sent_working <- lapply(sentence.list[[j]][1:length(sentence.list[[j]])  -1], extract_words) # extract target sentence 
    # with tokens as items in list object.
    
    node.list <- vector("list", 9)
    names(node.list) <- c("Ellipsis", "Subtree_eligibility", "Subtree", "Projectivity_eligibility", 
                          "Projectivity", "Planarity",  "DepDist", "Neighborhood", "Neighborhood_values")
    
    
    node.list$Ellipsis <- sapply(sent_working, ellipsis_identification) # logical vector with TRUE for each ellipsis node in target sentence
    # vector is necessary input for function DD_criteria().
    
    punct.index.v <- unlist(lapply(sent_working, find_punct_index))
    
    edge.graph  <- extract_edge_graph(sent_working) # create graph object (package = "igraph") from sent_working.
    
    
    subtree.l <- ego(edge.graph, 50, mode = "out") # List of elements; each element contains id values
    # for subtree of given node. A subtree is the given node
    # and its direct AND indirect dependents.
    
    neighborhood.l <- ego(edge.graph, 1, mode = "out") # List of elements; each element contains id values
    # for neighborhood of given node. A neighborhood is
    # a given node and its direct dependents ONLY.
    
    
    node.list$DepDist <- sapply(sent_working, DD_calculation) # produces a  vector; this mode is suitible for insertion as 
    # values of attributes in word elements of the XML output.
    
    node.list$Subtree_eligibility <-  sapply(sent_working, Subtree_criteria)
    
    node.list$Neighborhood <- sapply(sent_working, neighborhood_extraction)
    
    node.list$Projectivity_eligibility <- sapply(sent_working, projectivity_eligibility)
    
    node.list$Subtree  <- sapply(sent_working, subtree_extraction)
    
    node.list$Projectivity <- sapply(sent_working, projectivity_extraction)
    
    node.list$Planarity <- sapply(sent_working, gap_extraction)
    
    node.list$Neighborhood_values <- sapply(sent_working, neighborhood_values_extraction)
    
   
    
    sentence_P <- if("NonProjective" %in% node.list$Projectivity) {
      "NonProjective"
    } else {
      "Projective"
    }
    
    sentence_Pl <- if ("NonPlanar" %in% node.list$Planarity) {
      "NonPlanar"
    } else {
      "Planar"
    }
    
    sentence_DD <- round(mean(sapply(sent_working, abs_DD_calculation), na.rm = TRUE), digits = 4 )
    
    
    a <- unlist(sentence.list[[j]][length(sentence.list[[j]])]) # make vector of sentence attributes.
    # sentence attributes appear in last sublist of each list
    # in sentence.list. This list is accessed using 
    # length(sentence.list[[j]]).
    
    sent.xml <- xmlNode("sentence") # create sentence node
    
    sent.xml  <-  addAttributes(sent.xml, id = a[".attrs.id"], 
                                document_id = a[".attrs.document_id"], 
                                subdoc = a[".attrs.subdoc"], span = a[".attrs.span"],
                                Sentence_Projectivity = sentence_P,
                                Sentence_Planarity = sentence_Pl,
                                Mean_DepDist = sentence_DD) 
    
    
    
    sent.xml <- append.xmlNode(sent.xml, lapply(sent_working, populate_word_element))
    
    subtree.xml <- append.xmlNode(subtree.xml, sent.xml) # Insert sentence into document xml.
    
  } # end of loop j
  
  
  
  
} # end of loop i

proc.time() - ptm

subtree.xml[1]


saveXML(subtree.xml, "prepped_Xen.xml")
