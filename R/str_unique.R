
str_unique <- function(df,x) {

  #Setup information for function
  str_vec <- df[,x]
  n.row <- length(str_vec)
  unique_vec <- unique(str_vec)
  n.unique <- length(unique_vec)

  #Empty iteratable matrix:
  str.mat <- matrix(NA, nrow = n.unique, ncol = 2)

  #Nested loop to find count and percentage of each unique string.
  for(i in 1:n.unique) {
    count <- 0
    for(j in 1:n.row) {
      if(str_vec[j] == unique_vec[i]) {
        count <- count+1
      }
    }
    str.mat[i,1] <- count
    str.mat[i,2] <- count/n.row
  }
  rownames(str.mat) <- unique_vec
  colnames(str.mat) <- c("Count", "Percentage")

  return(str.mat)
}

str_unique(iris, 'Species')









