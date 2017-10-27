1:3 %>% accumulate(`+`)

1:10 %>% accumulate(`*`)

(1/(1/1024)) %>% log2()

log2(1/0.0009765625)


1:10 %>% accumulate(max, .init = 5)


1:10 %>%
map(rnorm, n = 10)

%>%
map_dbl(mean)

10 %/% 3
100 %% 3


set.seed(1014)
df <- data.frame(replicate(6, sample(c(1:10, -99), 6, rep = TRUE)))
names(df) <- letters[1:6]
df



fix_missing <- function(x) {
  x[x == -99] <- NA
  x
}
df[] <- lapply(df, fix_missing)

df

(m2 <- matrix(1:20, 4, 5))
lower.tri(m2)
m2[lower.tri(m2)] <- NA
m2


require(gapminder)
require(broom)

gapminder <- gapminder %>% mutate(year1950 = year - 1950)
by_country <- gapminder %>%
  group_by(continent, country) %>%
  nest()
by_country
str(by_country)

by_country$data[[1]]


country_model <- function(df) {
  lm(lifeExp ~ year1950, data = df)
  }


models <- by_country %>%
  mutate(mod = map(data, country_model))

models$mod[[2]]
models %>% filter(continent == "Africa")

models

models <- models %>%
  mutate(
    tidy = map(mod, broom::tidy),
    glance = map(mod, broom::glance),
    augment = map(mod, broom::augment)
  )

unnest(models, data)

factorial(39) / (2* factorial(37))



self_attrs <- c(17, 16, 18:26, 13:15, 9:10)
parent_attrs <- 27:39
g1parent_attrs <- 40:52
g2parent_attrs  <- 53:55
g3parent_attrs <- 56:58
g4parent_attrs <- 59:61

group1.v <- c(17, 16, 18, 28, 27, 31, 41, 40, 44, 54, 53, 55) # indices (from vector "y") for creation of sWord level variables.


group2.v <- c(self_attrs, parent_attrs) %>% 
  unique()

group3.v <- c(self_attrs, g1parent_attrs) %>%
  unique()

group4.v <- c(self_attrs, g2parent_attrs) %>%
  unique()


group5.v <- c(self_attrs, g3parent_attrs) %>%
  unique()

group6.v <- c(self_attrs, g4parent_attrs) %>%
  unique()





################
###################### Create all combinations of chosen variables



self_attrs <- c(17, 16, 18:26, 13:15, 9:10)
parent_attrs <- 27:39
g1parent_attrs <- 40:52
g2parent_attrs  <- 53:55
g3parent_attrs <- 56:58
g4parent_attrs <- 59:61

group1.v <- c(17, 16, 18, 28, 27, 31, 41, 40, 44, 54, 53, 55) # indices (from vector "y") for creation of sWord level variables.


group2.v <- c(self_attrs, parent_attrs) %>%  # self and parent morphology etc.
  unique()

group3.v <- c(self_attrs, g1parent_attrs) %>% # self and g1-parent morphology etc.
  unique()

group4.v <- c(self_attrs, g2parent_attrs) %>%  # self morphology etc. and g2-parent attributes
  unique()


group5.v <- c(self_attrs, g3parent_attrs) %>% # self morphology etc. and g2-parent attributes
  unique()

group6.v <- c(self_attrs, g4parent_attrs) %>% # self morphology etc. and g3-parent attributes
  unique()



####


group_1.list <- list() # make empty list object to store result of loop
nomina.v <- NULL # make empty vector to store names


for (i in seq_along(group1.v)) { # iterate for each item in group1.v
  group_1.list[[i]] <- combn(y[group1.v], i) # make all possible combinations of variables
  nomina.v <- paste(length(group1.v), "Choose",  i, collapse = " ") %>% # create names for elements in list
    append(nomina.v, .)
}

names(group_1.list) <- nomina.v  # assign names to list elements

##


group_2.list <- list() # make empty list object to store result of loop
nomina.v <- NULL # make empty vector to store names

for (i in 1:5) { # iterate selected number of times
  group_2.list[[i]] <- combn(y[group2.v], i) # make all possible combinations of variables
  nomina.v <- paste(length(group2.v), "Choose",  i, collapse = " ") %>% # create names for elements in list
    append(nomina.v, .)
}

names(group_2.list) <- nomina.v  # assign names to list elements

##

group_3.list <- list() # make empty list object to store result of loop
nomina.v <- NULL # make empty vector to store names

for (i in 1:5) { # iterate selected number of times
  group_3.list[[i]] <- combn(y[group3.v], i) # make all possible combinations of variables
  nomina.v <- paste(length(group3.v), "Choose",  i, collapse = " ") %>% # create names for elements in list
    append(nomina.v, .)
}

names(group_3.list) <- nomina.v  # assign names to list elements

##
group_4.list <- list() # make empty list object to store result of loop
nomina.v <- NULL # make empty vector to store names


for (i in seq_along(group4.v)) { # iterate for each item in group1.v
  group_4.list[[i]] <- combn(y[group4.v], i) # make all possible combinations of variables
  nomina.v <- paste(length(group4.v), "Choose",  i, collapse = " ") %>% # create names for elements in list
    append(nomina.v, .)
}

names(group_4.list) <- nomina.v  # assign names to list elements

##

group_5.list <- list() # make empty list object to store result of loop
nomina.v <- NULL # make empty vector to store names


for (i in seq_along(group5.v)) { # iterate for each item in group1.v
  group_5.list[[i]] <- combn(y[group5.v], i) # make all possible combinations of variables
  nomina.v <- paste(length(group5.v), "Choose",  i, collapse = " ") %>% # create names for elements in list
    append(nomina.v, .)
}

names(group_5.list) <- nomina.v  # assign names to list elements

##

group_6.list <- list() # make empty list object to store result of loop
nomina.v <- NULL # make empty vector to store names


for (i in seq_along(group6.v)) { # iterate for each item in group1.v
  group_6.list[[i]] <- combn(y[group6.v], i) # make all possible combinations of variables
  nomina.v <- paste(length(group6.v), "Choose",  i, collapse = " ") %>% # create names for elements in list
    append(nomina.v, .)
}

names(group_6.list) <- nomina.v  # assign names to list elements

##



###############

choose(19, 1:6) %>%
  sum()

choose(29, 1:5) %>%
  sum()




################
###################### Create all combinations of chosen variables



self_attrs <- c(17, 16, 18:26, 13:15, 9:10)
parent_attrs <- 27:39
g1parent_attrs <- 40:52
g2parent_attrs  <- 53:55
g3parent_attrs <- 56:58
g4parent_attrs <- 59:61

group1.v <- c(17, 16, 18, 28, 27, 31, 41, 40, 44, 54, 53, 55) # indices (from vector "y") for creation of sWord level variables.


group2.v <- c(self_attrs, parent_attrs) %>%  # self and parent morphology etc.
  unique()

group3.v <- c(self_attrs, g1parent_attrs) %>% # self and g1-parent morphology etc.
  unique()

group4.v <- c(self_attrs, g2parent_attrs) %>%  # self morphology etc. and g2-parent attributes
  unique()


group5.v <- c(self_attrs, g3parent_attrs) %>% # self morphology etc. and g2-parent attributes
  unique()

group6.v <- c(self_attrs, g4parent_attrs) %>% # self morphology etc. and g3-parent attributes
  unique()



####


group_1.list <- list() # make empty list object to store result of loop
nomina.v <- NULL # make empty vector to store names


for (i in seq_along(group1.v)) { # iterate for each item in group1.v
  group_1.list[[i]] <- combn(y[group1.v], i) # make all possible combinations of variables
  nomina.v <- paste(length(group1.v), "Choose",  i, collapse = " ") %>% # create names for elements in list
    append(nomina.v, .)
}

names(group_1.list) <- nomina.v  # assign names to list elements

##


group_2.list <- list() # make empty list object to store result of loop
nomina.v <- NULL # make empty vector to store names

for (i in 1:5) { # iterate selected number of times
  group_2.list[[i]] <- combn(y[group2.v], i) # make all possible combinations of variables
  nomina.v <- paste(length(group2.v), "Choose",  i, collapse = " ") %>% # create names for elements in list
    append(nomina.v, .)
}

names(group_2.list) <- nomina.v  # assign names to list elements

##

group_3.list <- list() # make empty list object to store result of loop
nomina.v <- NULL # make empty vector to store names

for (i in 1:5) { # iterate selected number of times
  group_3.list[[i]] <- combn(y[group3.v], i) # make all possible combinations of variables
  nomina.v <- paste(length(group3.v), "Choose",  i, collapse = " ") %>% # create names for elements in list
    append(nomina.v, .)
}

names(group_3.list) <- nomina.v  # assign names to list elements

##
group_4.list <- list() # make empty list object to store result of loop
nomina.v <- NULL # make empty vector to store names


for (i in 1:5) { # iterate a selected number of times.
  group_4.list[[i]] <- combn(y[group4.v], i) # make all possible combinations of variables
  nomina.v <- paste(length(group4.v), "Choose",  i, collapse = " ") %>% # create names for elements in list
    append(nomina.v, .)
}

names(group_4.list) <- nomina.v  # assign names to list elements

##

group_5.list <- list() # make empty list object to store result of loop
nomina.v <- NULL # make empty vector to store names


for (i in 1:5) { # iterate a selected number of times
  group_5.list[[i]] <- combn(y[group5.v], i) # make all possible combinations of variables
  nomina.v <- paste(length(group5.v), "Choose",  i, collapse = " ") %>% # create names for elements in list
    append(nomina.v, .)
}

names(group_5.list) <- nomina.v  # assign names to list elements

##

group_6.list <- list() # make empty list object to store result of loop
nomina.v <- NULL # make empty vector to store names


for (i in 1:5) { # iterate a selected number of times
  group_6.list[[i]] <- combn(y[group6.v], i) # make all possible combinations of variables
  nomina.v <- paste(length(group6.v), "Choose",  i, collapse = " ") %>% # create names for elements in list
    append(nomina.v, .)
}

names(group_6.list) <- nomina.v  # assign names to list elements

##

y


bad_c <- NULL

bad_c <- apply(group_2.list[[5]], 2, function(x) ("self-morph-person"  %in% x & "self-morph-gender" %in% x)) 


combs.v <- subset(group_2.list[[5]], select = which(bad_c == FALSE))

dim(combs.v)

View(group_1.list[[7]])

badder_c <- apply(group_2.list, 2, function(x) ("self-morph-person"  %in% x & "self-morph-gender" %in% x)) %>%
  lapply(.)

badder_c <- lapply(group_2.list, `[`)  %>%
  apply(., 2, function(x) ("self-morph-person"  %in% x & "self-morph-gender" %in% x))
  

group_2.list[[3]]
View(group_2.list[[3]])

group.names.v <- c("group_2.list",  "group_3.list", "group_4.list", "group_5.list", "group_6.list")

groups.list
for (i in seq_along(group.names.v)) {
  groups.list[[i]] <- group.names.v[[i]] %>%
    get()
}
names(groups.list) <- group.names.v

culled.groups.list <- list()
for (i in seq_along(groups.list)) {
  for (j in seq_along(groups.list[[i]])) {
    
    combs.v <- groups.list[[i]][j] %>%
      
    
    
    bad_c <- NULL
    
    bad_c <- apply(combs.v, 2, function(x) ("self-morph-person"  %in% x & "self-morph-gender" %in% x))
    combs.v <- subset(combs.v, select = which(bad_c == FALSE))
    
    culled.groups.list[[i]][[j]] <- combs.v
    
  }
  
  
  
}


apply(groups.list[[1]][1], 2, function(x) ("self-morph-person"  %in% x & "self-morph-gender" %in% x))
"self-morph-person"  %in% groups.list[[1]][2]

seq_along(groups.list[[1]])


for (i in 2:6) {
  a <- paste0("group_", i, ".list") %>%
    get()
  
  
  
  for (j in seq_along(a)) {
    bad_c <- NULL
    bad_c <- apply(a[[j]], 2, function(x) ("self-morph-person"  %in% x & "self-morph-gender" %in% x))
    combs.v <- subset(a[[j]], select = which(bad_c == FALSE))
    
    culled.list[i] <- combs.v
    
  }
  
}




sapply(group_2.list[[2]], `[` )
map_chr(group_2.list[[2]], `[`)

group_2.list[[2]] %>%
apply(., 2, function(x) ("self-morph-person"  %in% x & "self-morph-gender" %in% x))





test.f(group_2.list)

culled.list <- vector("list", 5)
combs.v


newlist <- list(group_1.list, list(group_2.list))

culled.list[[2]] <- combs.v
culled.list[[2]]

i <- 2
j <- 1

paste0("culled", 1 ".list")
i
assign(paste0("culled", ".list"), list())
get(i)
  

culled.list[[j]] <- combs.v


a <- group_2.list[[2]]
dim(a)

i <- 1
j <- 1
rm(combs.v)

bad_c <- apply(a, 2, function(x) ("self-morph-person"  %in% x & "self-morph-gender" %in% x))
combs.v <- subset(a, select = which(bad_c == FALSE))

length(group_1.list)
seq_along(groups.list)
seq_along(a)




groups.list[[1]][1] %>%
  str()

a <- groups.list[[1]][1] 
b <- group_1.list[[1]]
a <- matrix(a, nrow = 1)
paste(a, sep = " ")

all.groups <- c(group1.v, group2.v, group3.v, group4.v, group5.v, group6.v) %>%
  length()




################
###################### Create all combinations of chosen variables



self_attrs <- c(17, 16, 18:26, 13:15, 9:10)
parent_attrs <- 27:39
g1parent_attrs <- 40:52
g2parent_attrs  <- 53:55
g3parent_attrs <- 56:58
g4parent_attrs <- 59:61

group1.v <- c(17, 16, 18, 28, 27, 31, 41, 40, 44, 54, 53, 55) # indices (from vector "y") for creation of sWord level variables.


group2.v <- c(self_attrs, parent_attrs) %>%  # self and parent morphology etc.
  unique()

group3.v <- c(self_attrs, g1parent_attrs) %>% # self and g1-parent morphology etc.
  unique()

group4.v <- c(self_attrs, g2parent_attrs) %>%  # self morphology etc. and g2-parent attributes
  unique()


group5.v <- c(self_attrs, g3parent_attrs) %>% # self morphology etc. and g2-parent attributes
  unique()

group6.v <- c(self_attrs, g4parent_attrs) %>% # self morphology etc. and g3-parent attributes
  unique()




################## loops to generate new variables

output.list <- vector("list", 37) # initialize list with number of elements = to sum of lengths of all input groups
counter <- 1 # create vector to increment through output list


nomina.v <- NULL # make empty vector to store names


for (i in seq_along(group1.v)) { # iterate for each item in group1.v
  output.list[[counter]] <- combn(y[group1.v], i) # make all possible combinations of variables
  nomina.v <- paste("group1", length(group1.v), "Choose",  i, collapse = " ") %>% # create names for elements in list
    append(nomina.v, .) # add new names to vector
  counter <- counter + 1 # add 1 to incremetizing vector
}



##



for (i in 1:5) { # iterate selected number of times
  output.list[[counter]] <- combn(y[group2.v], i) # make all possible combinations of variables
  nomina.v <- paste("group2", length(group2.v), "Choose",  i, collapse = " ") %>% # create names for elements in list
    append(nomina.v, .) # add new names to vector
  counter <- counter + 1 # add 1 to incremetizing vector
}



##



for (i in 1:5) { # iterate selected number of times
  output.list[[counter]] <- combn(y[group3.v], i) # make all possible combinations of variables
  nomina.v <- paste("group3", length(group3.v), "Choose",  i, collapse = " ") %>% # create names for elements in list
    append(nomina.v, .) # add new names to vector
  counter <- counter + 1 # add 1 to incremetizing vector
}




##



for (i in 1:5) { # iterate a selected number of times.
  output.list[[counter]] <- combn(y[group4.v], i) # make all possible combinations of variables
  nomina.v <- paste("group4", length(group4.v), "Choose",  i, collapse = " ") %>% # create names for elements in list
    append(nomina.v, .) # add new names to vector
  counter <- counter + 1 # add 1 to incremetizing vector
}


##




for (i in 1:5) { # iterate a selected number of times
  output.list[[counter]] <- combn(y[group5.v], i) # make all possible combinations of variables
  nomina.v <- paste("group5", length(group5.v), "Choose",  i, collapse = " ") %>% # create names for elements in list
    append(nomina.v, .) # add new names to vector
  counter <- counter + 1 # add 1 to incremetizing vector
}



##



for (i in 1:5) { # iterate a selected number of times
  output.list[[counter]] <- combn(y[group6.v], i) # make all possible combinations of variables
  nomina.v <- paste("group6", length(group6.v), "Choose",  i, collapse = " ") %>% # create names for elements in list
    append(nomina.v, .) # add new names to vector
  counter <- counter + 1 # add 1 to incremetizing vector
}



##

names(output.list) <- nomina.v # add names to list elements

### loop to remove impossible combinations

culled.output.list <- vector("list", length(output.list)) # initialize list with same number of elements as output.list
  
for (i in seq_along(output.list)) { # iterate through output.list
  combs.v <- output.list[[i]] # extract vector to check
  
  
  bad_c <- NULL # create vector for output
  
  ## a series of anonymous functions to check for co-occurence of categories not allowed by Greek or Latin morphology
  
  bad_c <- apply(combs.v, 2, function(x) ("self-morph-person"  %in% x & "self-morph-gender" %in% x))
  combs.v <- subset(combs.v, select = which(bad_c == FALSE))
  
  bad_c <- apply(combs.v, 2, function(x) ("self-morph-person"  %in% x & "self-morph-case" %in% x)) 
  combs.v <- subset(combs.v, select = which(bad_c == FALSE))
  
  bad_c <- apply(combs.v, 2, function(x) ("self-morph-person"  %in% x & "self-morph-degree" %in% x))
  combs.v <- subset(combs.v, select = which(bad_c == FALSE))
  
  bad_c <- apply(combs.v, 2, function(x) ("parent-morph-person"  %in% x & "parent-morph-gender" %in% x)) 
  combs.v <- subset(combs.v, select = which(bad_c == FALSE))
  
  bad_c <- apply(combs.v, 2, function(x) ("parent-morph-person"  %in% x & "parent-morph-case" %in% x)) 
  combs.v <- subset(combs.v, select = which(bad_c == FALSE))
  
  bad_c <- apply(combs.v, 2, function(x) ("parent-morph-person"  %in% x & "parent-morph-degree" %in% x)) 
  combs.v <- subset(combs.v, select = which(bad_c == FALSE))
  
  culled.output.list[[i]] <- combs.v # store culled vector in list

}


names(culled.output.list) <- names(output.list) # add names to list elements

#################
i <- 15
dim(var.holder)

v.list <- vector("list", sum(lengths(culled.output.list)))
counter <- 1
var.names <- NULL
for (i in 1:2) {
  
  var.holder <- culled.output.list[[i]]
  # v.list <- vector("list", ncol(var.holder))
  
  
  
  
  for (j in seq_len(ncol(var.holder))) {
    compound.vars <- apply(z, 1, function(x) paste0(x[var.holder[, j]], collapse = "-")) %>%
      as.character()
    
    var.names  <- paste0(var.holder[, j], collapse = "*") %>%
      append(var.names, .)
    
    compound.vars <- tolower(compound.vars) # convert to lower case
    
    v.list[[counter]] <- compound.vars
    names(v.list[[counter]]) <- var.names
    counter <- counter + 1
    
  }
  
}


com.variables.m  <- do.call(cbind, v.list) # make matrix containing new variables

abc  <- do.call(cbind, v.list)
ab <- temp.l[[1]]
colnames(abc) <- var.names
rownames(abc) <- NULL
dim (ab)

View(abc[1:5, 1:20])
View(a2[1:5, 1:20])

c <- which(str_detect(ab, "na") == TRUE )
a2 <- a

####### The following 2 lines work well to insert Boolean NAs into cells.
ab[which(str_detect(ab, "na") == TRUE )] <- NA
ab[which(str_detect(ab, "null") == TRUE )] <- NA




ab <- cbind(z[, 7], ab)

ab.df <- data.frame(ab, stringsAsFactors = FALSE, check.names = FALSE)


View(ab.df[1:5, 1:20])
colnames(a2.df[1]) <- "cite"
colnames(a2.df)

long.na.test2 <- gather(ab.df, variable_name, variable_value, -(V1)) %>%
  drop_na() # much memory saved through this format

object.size(long.na.test2)

284463 / 478977

test.table <- table(long.na.test[, 3])
dim(test.table)
test.table["self_neg5"]
names(test.table)
str(test.table)

renewed <- spread(long.na.test, variable_name, variable_value, fill = NA)

renewed[1,]
renewed[1, "self.depdist.self.relation"]
