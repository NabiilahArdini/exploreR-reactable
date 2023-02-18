library(reactable)
library(dplyr)

# CONDITIONAL COLOR FOR SPECIFIC COLUMN REACTABLE 

# function which returns background colour based on cell value (using colour map)
# also takes column name as input
stylefunc <- function(value, index, name) {
  color <- if (value >= 0.5) {"#fc695f"} else {"white"}
  list(background = color)
}

# list giving column formatting (using style function) for single column
coldefs <- list(
  colDef(style = stylefunc)
)


# get names of selected cols
cols <- iris[,-c(1,5)] %>% colnames()
# replicate list to required length
coldefs <- rep(coldefs,length(cols))
# name elements of list according to cols
names(coldefs) <- cols

# create table
reactable(iris,
          columns = coldefs)
