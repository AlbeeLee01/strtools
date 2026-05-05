#'Summarize unique string values in a dataset column
#'
#'Identifies all unique string values in a selected vector and returns a sorted summary matrix containing the count and proportion of each unique string.
#'This is useful for quick exploration into categorical string variables and understanding their frequency distribution in the data.
#'The effectiveness of this function is reliant on how noisy the string data is.
#'
#'@param df A data frame containing the variable to be analyzed.
#'
#'@param x Column name (character) or column index (numeric) indicating the variable to summarize.
#'
#'@return A sorted matrix where each row corresponds to a unique value in the selected column. The matrix contains two columns:
#'\itemize{
#'  \item Count: Number of occurences of each unique value.
#'  \item Percentage: Proportion of each value in the dataset.
#'}
#'The matrix is sorted in descending order by Count.
#'
#'@export
#'
#'@examples
#'
#'#Basic example with a string variable
#'str_unique(iris,"Species")
#'
#'#Example with character-coerced numeric columns
#'str_unique(mtcars, "cyl")

str_unique <- function(df,x) {

  #Setup information for function
  str_vec <- as.character(df[,x])
  n.row <- length(str_vec)

  unique_vec <- unique(str_vec)
  n.unique <- length(unique_vec)

  #Empty iteritable matrix:
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

  #Ordered based on count
  str.mat <- str.mat[order(str.mat[, "Count"], decreasing = TRUE), ]

  return(str.mat)
}




