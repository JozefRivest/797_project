library(knitr)
library(xtable)

# Method 1: Two step process
knit("codebook/codebook.Rnw", output = "codebook/output/codebook.tex") # Creates example.tex
system("pdflatex -output-directory=codebook/output codebook/output/codebook.tex") # Creates example.pdf
