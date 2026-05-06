#'Investment co-investors dataset:
#'
#'This dataset contains fake investment entries with intentionally noisy co-investor string values (in "co.investors") to demonstrate str_clean()'s capabilities.
#'The raw string data includes inconsistent casing, typos, alternative names and punctuation variations.
#'The dataset was derived from invest.dataset.csv made in Excel by me.
#'
#' @format A data frame with 5 rows and 2 columns:
#' \describe{
#'    \item{investment}{Numeric investment ID}
#'    \item{co.investors}{A semicolon-separated character string of noisy co-investor names.}
#'  }
"invest.df"

#'Investment co-investor dictionary
#'
#'This dictionary maps firm names to common abbreviations, subsidiaries and mis-spellings, etc.
#'It is complimentary to invest.df and used in str_clean()
#'
#' @format A data frame with 5 elements. Each element is a character vector of lowercase synonyms corresponding to a firm name known as the "key"
#' \describe{
#'   \item{KKR}{kohlberg kravis roberts, kkr}
#'   \item{Chase}{chase, jp morgan, jp morgan chase}
#'   \item{BofA}{bofa, bofa securities, inc., bank of america}
#'   \item{Blackstone}{bx, blackstone, blackstone inc.}
#'   \item{UBS}{ubs, ubs group ag}
#' }
"invest.dict"

#'Animals dataset
#'
#'This randomly generated dataset pairs animal sizes with species names drawn from 'animals.dict'.
#'Since elements in the dataset represent specific species rather than broad categories, this dataset can demonstrate how 'str_clean' could be used to group values into higher-level classifications.
#'
#' @format A data frame with 50 elements and 2 columns:
#' \describe{
#'   \item{animal.size}{a character string representing the animal size in inches (i.e "12in")}
#'   \item{species}{a character string containing a specific species name (i.e "Panther")}
#' }
"animals.df"

#'Animals dictionary
#'
#'A dictionary mapping broad animal categories to select member species.
#'Like invest.dict, this corresponds with animals.df and used for the 'dict' argument in 'str_clean()', resulting in the recoding of animal species into their broader category (i.e "tiger" -> "feline")
#' @format A named list with 5 elements, each element corresponding to a character vector of species names belonging to a category.
#' \describe{
#'   \item{feline}{house cat, tiger, panther, lion, jaguar}
#'   \item{canine}{wolf, fox, coyote, house dog, jackal}
#'   \item{birds}{sparrow, pigeon, chicken, falcon, eagle}
#'   \item{turtles}{snapping turtle, box turtle, tortoise}
#'   \item{insects}{beetle, ants, wasp, bees, mantis}
#' }
#'
#'
"animals.dict"

#'Random character dataset
#'
#'A randomly generated dataset containing uppercase and mixed-case single letters.
#'This dataset is intended to demonstrate the parameter 'case.sensitive' argument in 'str_unique()' and 'str_find'. where letter casing affects how unique values are counted and identified.
#'
#'@format A dataframe with 50 rows and 2 columns:
#' \describe{
#'   \item{random.char}{a single uppercase letter sampled randomly from LETTERS}
#'   \item{mixed_random.char}{randomly lowercase converted letters in 'random.char', producing a vector of upper and lowercase values. }
#' }

"letters.df"

