## code to prepare 'animals.df', 'animals.dict', 'invest.df', 'invest.dict'. 'letters.df'

#####Animals Dictionary and Dataset:#########

#Animals dictionary
animals.dict <- list(
  "feline"  = c("house cat", "tiger", "panther", "lion", "jaguar"),
  "canine"  = c("wolf", "fox", "coyote", "house dog", "jackal"),
  "birds"   = c("sparrow", "pigeon", "chicken", "falcon", "eagle"),
  "turtles" = c("snapping turtle", "box turtle", "tortoise"),
  "insects" = c("beetle", "ants", "wasp", "bees", "mantis")
)

#Animals dataset
spec <- unlist(animals.dict)
n.spec <- length(spec)

#Randomly generate species
set.seed(123)
rand_spe_ind <- sample(1:n.spec, size = 50, replace = TRUE)
animal.size <- sample(1:50, size = 50, replace = TRUE)
animals.df <- data.frame(animal.size = paste(animal.size, "in", sep = ""), species = spec[rand_spe_ind])

#####Investment Dictionary and Dataset:#########

#Investment firms dictionary.
invest.dict <- list(
  "KKR" = c("kohlberg kravis roberts", "kkr"),
  "Chase" = c("chase", "jp morgan", "jp morgan chase"),
  "BofA" = c("bofa", "bofa securities, inc.", "bank of america"),
  "Blackstone" = c("bx", "blackstone", "blackstone inc."),
  "UBS" = c("ubs", "ubs group ag")
)

#Investment dataset (find in data folder)
invest.df <- read.csv('~/data/invest.dataset.csv')

#####Random Letters Dataset:#########

#Randomly generate letters
letters.df <- data.frame(random.char = sample(LETTERS, size = 50, replace = TRUE))
set.seed(123)
lower_idx <- sample(c(TRUE, FALSE), size = length(letters.df$random.char), replace = TRUE)
letters.df$mixed_random.char <- ifelse(lower_idx, tolower(letters.df$random.char), letters.df$random.char)





