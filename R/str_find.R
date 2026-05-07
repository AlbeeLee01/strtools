#'Finding rows containing specified keywords
#'
#'This function searches for specified keyword(s) within a selected data frame column and returns all rows where a match is found.
#'It is useful for filtering observations based on string values.
#'
#'@param df a data frame containing the variable to be analyzed.
#'
#'@param x column name (character) or column index (numeric) indicating the variable to evaluate.
#'
#'@param k.word a string vector that contains keyword(s) to be detected from the data frame.
#'
#'@param case.sensitive a logical evaluating to \code{TRUE} or \code{FALSE} indicating whether the function evaluates for uppercase or lowercase strings.
#'
#'@details If \code{case.sensitive = TRUE}, matching requires exact agreement in letter casing (i.e \code{"PANTHER"} and \code{"Panther"} will be treated as different values).
#'
#'If \code{case.sensitive = FALSE}, matching ignores differences in letter casing (i.e, \code{"PANTHER"} and \code{"Panther"} are treated as equal).
#'
#'@return A data frame containing only the rows where the selected column matches at least one of the specified keywords.
#'A message is printed indicating the total number of matches found.
#'
#'
#'If no matches are found, an empty data frame is returned with a message indicating no matching values were found.
#'
#'
#'@examples
#'
#'
#'t <- c("eagles", "beetle", "falcon")
#'str_find(animals.df,"species", t, TRUE)
#'
#'#Case.sensitive = TRUE
#'str_find(letters.df, 2,'Y', case.sensitive = TRUE)
#'
#'#Case.sensitive = FALSE
#'str_find(letters.df, 2, 'Y', case.sensitive = FALSE)
#'
#'@export


str_find <- function(df, x, k.word, case.sensitive = TRUE) {

  str_vec <- as.character(df[,x])

  #If word is not case sensitive then set every string value to lowercase.
  if(!case.sensitive) {
    str_vec <- tolower(str_vec)
    k.word <- tolower(k.word)
  }

  #Vector that contains the index of the key word
  str_ind <- which(str_vec %in% k.word)

  #Data frame of rows that contains the keyword
  str_found <- df[str_ind,]

  #Message notifying number of instances found
  message(paste("Found", nrow(str_found), "total instances."))

  if(nrow(str_found) == 0) {
    message("That string value could not be found.")
  }

  return(str_found)
}




