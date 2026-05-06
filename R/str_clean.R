#'Clean string data
#'
#''str_clean()' maps raw string values in a selected column to harmonized keywords defined in a user-supplied dictionary.
#'Each value is matched against a list of synonyms assigned to each key and replaced with that key if a match is found.
#'Values that are unmatched are left as-is and reported in a data frame containing information on unmatched values.
#'
#'
#'@param df a data frame containing the string or string-coercible numeric data to be analyzed.
#'
#'@param x a column name (character) or column index (numeric) indicating the variable to evaluate.
#'
#'@param dict a named list where each element is a character vector of synonyms assigned to a key (i.e list(Chase = c("chase", "jp morgan")))
#'
#'@param str.sep a character string used to split multi-word entries within a cell (i.e str.sep = ";" or "."). Default is NULL, meaning each cell is treated as a single value.
#'
#'@details The function sets all string values to lowercase before matching. As such dictionary synonyms should also be set in lowercase. Matching is conducted after leading and trailing white spaces are trimmed.
#'
#'Any unmatched strings are stored in a data frame called 'no_match.df' which is assigned to the global environment for additional analysis or cleaning. Each row contains the unmatched string and a vector of row indices where it occurred.
#'
#'A cleaned column is inserted directly after the source column in the output. The cleaned column is a list-column where each cell contains a character vector of both matched and unmatched keys.
#'
#'@return Returns 'df' with a new column inserted directly after the source column 'x'. A complimentary data frame 'no_match.df' stores any unmatched values and their corresponding rows in the global environment containing:
#'\itemize{
#'  \item string: the unmatched string value.
#'  \item rows: a vector of row indices of the unmatched values.
#'}
#'
#'If unmatched values exist, a warning message is produced detailing the number of unmatched strings and recommending the user to check their dictionary synonyms. Otherwise, a message declaring that the data was cleaned is printed.
#'
#'@export
#'
#'@examples
#'#Cleaning a semicolon-separated string values column
#'str_clean(invest.df, "co.investors", invest.dict, str.sep = ";")
#'
#'#Cleaning columns with single value cells and categorizing values
#'str_clean(animals.df, "species", animals.dict, str.sep = NULL)



str_clean <- function(df, x, dict, str.sep = NULL) {

  #Retrieve index of selected column to help with df$cleaned placement.:
  if (is.character(x)) {
    col.ind <- which(names(df) == x)
  } else {
    col.ind <- x
  }

  #Vectorize string column
  str_vec <- tolower(as.character(df[, col.ind]))
  n.vec <- length(str_vec)

  #Split strings if needed based on str.sep value.
  if (!is.null(str.sep)) {
    str_list <- strsplit(str_vec, str.sep) #Each row becomes a vector of split strings.
  } else {
    str_list <- str_vec
  }

  #Dictionary variables
  keys <- names(dict)
  n.keys <- length(keys)

  #Output list and unmatched information.
  result_list <- vector("list", n.vec) #result_list is an empty vector that contains both cleaned and uncleaned string values.
  n.no_match <- 0 #Count unmatched string data.
  no_match.ind <- list() #Named list containing uncleaned strings and the row numbers they appear in.

  for (i in seq_along(str_list)) {

    items <- trimws(str_list[[i]], which = "both") #Trim leading white spaces
    result <- c()

    #For each entry in items
    for (entry in items) {

      found_match <- FALSE #This is necessary for the loop to stop once a value is matched to a key.

      for (j in seq_along(dict)) {

        #If the entry matches a synonym replace the original string with the key.
        if (entry %in% dict[[j]]) {

          result <- c(result, keys[j])
          found_match <- TRUE
          break

        }
      }

      if(!found_match) {

        result <- c(result, entry)
        n.no_match <- n.no_match + 1
        no_match.ind[[entry]] <- c(no_match.ind[[entry]], i)

      }
    }
    result_list[[i]] <- result
  }

  #Mutate data frame to include cleaned data next to raw data.
  df <- append(df, list(cleaned = I(result_list)), after = col.ind)
  df <- as.data.frame(df)

  no_match.df <- data.frame(string = names(no_match.ind), rows = I(no_match.ind), row.names = NULL)
  assign("no_match.df", no_match.df, envir = .GlobalEnv)

  #Uncleaned information:
  if(n.no_match > 0) {
    warning(paste("There was", n.no_match), " string value(s) uncleaned. Please check your dictionary synonyms and the raw data.\nYou can refer to the list of unmatched strings and corresponding rows at no_match.df loaded in your global environment.")
  } else {
    message("All string values have been cleaned.")
  }

  #By setting no_match.ind into the global environment it allows the user to utilize the information directly for continued cleaning purposes.
  assign("no_match.df", no_match.df, envir = .GlobalEnv)

  return(head(df))
}
















