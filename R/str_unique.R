#' Summarize unique string values (i.e counts, proportions).
#'
#'This function identifies all unique string values in a selected vector and returns
#'a summary matrix containing the count and proportion of each unique string. This is
#'useful for quick exploration into categorical string variables and understanding
#'their frequency distribution in your data. The effectiveness of this function (at the
#'moment) is reliant on how noisy the vector or dataframe is.
#'
#'@param df Dataset containing column of interest.
#'
#'@param x A character string or numeric index indicating which column in 'df' should be
#'evaluated.
#'
#'@returns A matrix with named rows for each unique string in the selected column and two columns:
#'  \describe {
#'    \item{Count:} {The number of instances each unique string appears.}
#'    \item{Percentage:} {The proportion of total observations that is represented by that string.}
#'}
#'
#'@export
#'
#'@examples
#'str_unique(iris,"Species)
#'str_unique(mtcars, "cyl)

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










