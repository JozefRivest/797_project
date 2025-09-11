library(tidyverse)
library(tinytable)

mil_bases <- data.frame(
  region = c(
    "Kanagawa",
    "Aomori"
  ),
  city = c(
    "Yokosuka",
    "Hachinohe"
  ),
  operated = c(
    2,
    0
  ),
  personel = c(
    24000,
    NA
  ),
  personel_prop = c(0.06, NA),
  type = c(
    0,
    2
  ),
  size = c( # Acres
    568,
    NA
  ),
  prop_size = c(
    0.02,
    NA
  ),
  longitude = c(
    35.29249,
    40.55782
  ),
  latitude = c(
    139.66956,
    141.46555
  )
)

# =============== Type of base =====================
t <- data.frame(
  "Naval Base" = 0,
  "Ground Base" = 1,
  "Air Base" = 2,
  check.names = FALSE
)

type <- t |>
  pivot_longer(
    cols = c("Naval Base", "Ground Base", "Air Base"),
    names_to = "Type",
    values_to = "Value"
  )

tt(type) |>
  style_tt(i = c(1, 2), j = 2, align = "c") |>
  style_tt(i = 0, bold = TRUE) |>
  print("latex")


# =============== Type of base =====================
o <- data.frame(
  "Japan" = 0,
  "United States" = 1,
  "Joint" = 2,
  check.names = FALSE
)

operated <- o |>
  pivot_longer(
    cols = c("Japan", "United States", "Joint"),
    names_to = "Operated",
    values_to = "Value"
  )

tt(operated) |>
  style_tt(i = c(1:3), j = 2, align = "c") |>
  style_tt(i = 0, bold = TRUE) |>
  print("latex")
