library(tidyverse)
library(tinytable)

mil_bases <- data.frame(
  country = c(
    "Japan",
    "Japan",
    "Japan",
    "Japan"
  ),
  region = c(
    "Kanagawa",
    "Aomori",
    "Aomori",
    "Fukuoka"
  ),
  city = c(
    "Yokosuka",
    "Hachinohe",
    "Misawa",
    "Kasuga"
  ),
  operated = c(
    2,
    0,
    2,
    0
  ),
  personel = c(
    24000,
    NA,
    6450,
    NA
  ),
  personel_prop = c(
    0.06,
    NA,
    0.147,
    NA
  ),
  type = c(
    0,
    2,
    2,
    2
  ),
  size = c( # km^2
    2.3,
    NA,
    23,
    0.35
  ),
  prop_size = c(
    0.02,
    NA,
    0.192,
    0.025
  ),
  longitude = c(
    35.29249,
    40.55782,
    141.23,
    33.53165
  ),
  latitude = c(
    139.66956,
    141.46555,
    40.40,
    130.46745
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
