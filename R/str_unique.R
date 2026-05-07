#'Summarize unique string values
#'
#'\code{str_unique()} identifies all unique string values in a selected vector and returns a sorted summary of the count and proportion of each unique string.
#'A bar plot can also be produced showing the top n frequent values based on count or percentage.
#'
#'@param x a vector containing character or character-coercible values.
#'
#'@param case.sensitive a logical value. If \code{TRUE}, unique values consider for letter casing (i.e \code{"TREE"} and \code{"tree"} will be treated as different values). If \code{FALSE}, all string values are set to lowercase (i.e, \code{"PANTHER"} is set to \code{"panther"}). Default is \code{TRUE}.
#'
#'@param top_n a numeric value indicating how many of the most frequent values the bar plot shows. Default is 10.
#'
#'@param plot a logical value. If \code{TRUE}, a bar plot showing the top 10 frequent string values will be shown. If \code{FALSE}, no bar plot will be created.
#'
#'@param use_percentage a logical value. If \code{FALSE}, the y-axis and y-labels will use the \code{Count} data. If \code{TRUE}, the y-axis and y-labels will use the \code{Percentage} data.
#'
#'@param ... further arguments passed to customize bar plot visualization.
#'
#'@details The effectiveness of this function is reliant on how noisy the string data is.
#'
#'@return A descending sorted matrix where each row corresponds to a unique value from the string vector. The matrix contains two columns:
#'\itemize{
#'  \item \code{Count}: Number of occurrences of each unique value.
#'  \item \code{Percentage}: Proportion of each value in the dataset.
#'}
#'If \code{plot} is set to \code{TRUE}, a bar plot will be created using the sorted matrix data.
#'
#'If \code{use_percentage} is \code{TRUE}, the bar plot will use Percentage data rather than the default \code{Count} data.
#'
#'
#'@export
#'
#'@examples
#'
#'#Example with use_percentage = TRUE and top_n = 5
#'str_unique(letters.df$mixed_random.char, case.sensitive = TRUE, top_n = 5, plot = TRUE, use_percentage = TRUE)
#'
#'#Example with use_percentage = FALSE, case.sensitive = FALSE and color = red
#'str_unique(letters.df$mixed_random.char, case.sensitive = FALSE, top_n = 10, plot=TRUE, use_percentage = FALSE, col = 'red')
#'
#'#Example with character-coerced numeric columns
#'str_unique(mtcars$cyl)

str_unique <- function(x, case.sensitive = TRUE, top_n = 10, plot = TRUE, use_percentage = FALSE, ...) {

  #Setup information for function
  str_vec <- as.character(x)
  n.row <- length(str_vec)

  #Optional case-handling
  if (case.sensitive == FALSE) {
    str_vec <- tolower(str_vec)
  }

  unique_vec <- unique(str_vec)
  n.unique <- length(unique_vec)

  #Empty iterable matrix:
  str.mat <- matrix(NA, nrow = n.unique, ncol = 2)

  #Nested loop to find count and percentage of each unique string.

  #For each unique string in unique_vec, check if str_vec contains that unique value. If so count goes up.
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

  #Descending order based on count
  str.mat <- str.mat[order(str.mat[, "Count"], decreasing = TRUE), ]

  #Optional Top 10 plot:
  if(plot == TRUE) {
    top_str <- head(str.mat, top_n)

    #If use_percentage == TRUE, then use percentage value, otherwise use count (DEFAULT CASE)
    values <- if(use_percentage ==TRUE) {
      top_str[, "Percentage"]
    } else {
      top_str[, "Count"]
    }
    barplot(values, names.arg = rownames(top_str), las = 2, main = paste("Top", top_n, "Most Frequent Values"),
      ylab = if (use_percentage == TRUE) "Percentage" else "Count", ...)
  }

  #If plot is set to FALSE return only the matrix.
  return(str.mat)
}




