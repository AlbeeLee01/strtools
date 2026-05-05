#'Identify rows containing key words
#'
#'Extract and report all instances of keywords defined in a string-based vector x.
#'
#'@param df A data frame containing the variable to be analyzed.
#'
#'@param x Column name (character) or column index (numeric) indicating the variable to evaluate.
#'
#'@param k.word A string vector that contains keyword(s) to be detected from the data frame.
#'
#'@param case.sensitive=TRUE
#'A logical evaluating to TRUE or FALSE indicating whether the function evaluates for uppercase or lowercase strings.
#'
#'@examples
#'p <- c("jackal","panther")
#'str_find(animals_df, 2, p, case.sensitive=T)
#'


str_find <- function(df, x, k.word, case.sensitive = TRUE) {

  str_vec <- as.character(df[,x])

  #If word is not case sensitive
  if(!case.sensitive) {
    str_vec <- tolower(str_vec)
    k.word <- tolower(k.word)
  }

  #Vector that contains the index of the key word
  str_ind <- which(str_vec %in% k.word)

  #Dataframe of rows that contains the keyword
  str_found <- df[str_ind,]

  #Message notifying number of instances found
  message(paste("Found", nrow(str_found), "total instances."))

  if(nrow(str_found) == 0) {
    message("That string value could not be found.")
  }

  return(str_found)
}




