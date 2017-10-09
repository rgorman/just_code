
seq_along(test2)
length(test2[[1]])
test2[[1]]

test3.df <- as.data.frame(matrix(nrow=length(v.list[[1]])))
test3 <- lapply(v.list, function(x) lapply(x, f_NA2))

i <- 1
system.time(
for (i in seq_along(test3)) {
  test3.df <- cbind.data.frame(test3.df, unlist(test3[[i]]), stringsAsFactors = FALSE)
  
}
)

test3.df <- test3.df[, 2:ncol(test3.df)]


names(test3.df) <- nomina.v

token_id <- seq_along(test3[[1]]) %>%
  paste0("token-", .)

test3.df <- cbind.data.frame(token_id, test3.df, stringsAsFactors = FALSE)

system.time(
long.test3.df <- gather(test3.df, variable_name, variable_value, -(token_id)) %>%
  drop_na()
)

names(long.test3.df)

test.tab <- table(test3.df$`self-depdist*self-relation*self-morph-pos`)
test.tab <- table(test3.df[[2:20]])

seq_along(test3.df)
length(test3.df)

tab.list <- vector("list", length(test3.df))
for (i in seq_along(test3.df)) {
  tab.list[[i]] <- table(test3.df[[i]])
}

names(tab.list)[1] <-"Token_ID"
names(tab.list)[2:length(tab.list)] <- nomina.v
length(tab.list)



#converting an R list into a Data Matrix
tb  <- as.data.frame(tab.list[[2]], stingsAsFactors = FALSE)

tab.list2 <- lapply(tab.list, data.frame)

freqs.df <- do.call(rbind, tab.list2[2:length(tab.list2)])

object.size(freqs.df)

which(freqs.df$Freq >= 5) %>%
  length()

freqs.df2 <- freqs.df[which(freqs.df$Freq >= 5) ,]



