library(knitr)
library(xtable)

# Method 1: Two step process
knit("codebook/codebook.Rnw") # Creates example.tex
system("pdflatex codebook.tex") # Creates example.pdf
