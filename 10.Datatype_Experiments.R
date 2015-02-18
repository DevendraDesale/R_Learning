newFactor <- factor(c("Pennsylvania", "New York", "New Jersey", "New York",
                       "Tennessee", "Massachusetts", "Pennsylvania", "New York"))
model.matrix(~newFactor - 1)


# Creating an empty list of a certain size is, perhaps confusingly, done with vector.
(emptyList <- vector(mode = "list", length = 4))
