#Dictionary:

#List structure.
animals <- list(
  feline  = c("house cat", "tiger", "panther", "lion", "jaguar"),
  canine  = c("wolf", "fox", "coyote", "house dog", "jackal"),
  birds   = c("sparrow", "pigeon", "chicken", "falcon", "eagle"),
  turtles = c("snapping turtle", "box turtle", "tortoise"),
  insects = c("beetle", "ants", "wasp", "bees", "mantis")
)

n.names <- length(animals)
species <- c()
count <- 0

for(i in 1:n.names) {
  # for each index in the species sublist
  for(j in animals[[i]]) {
    spec <- c(species, j)
    count <- count + 1
  }

}

n.spec <- length(species)
set.seed(123)
rand_spe_ind <- sample(1:n.spec, size = 50, replace = T)
animal.size <- sample(1:50, size = 50, replace = T)
animals_df <- data.frame(animal.size = paste(animal.size, "in", sep = ""), species = spec[rand_spe_ind])

df1 <- data.frame(random.char = sample(LETTERS, size = 50, replace = TRUE))
set.seed(123)
lower_idx <- sample(c(TRUE, FALSE), size = length(df1$random.char), replace = TRUE)
df1$mixed_random.char <- ifelse(lower_idx, tolower(df1$random.char), df1$random.char)




