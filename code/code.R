library(tidyverse)

# ======== Wave 7 only ================

dat <- readr::read_csv2("data/wvs_wave7.csv")

head(dat)

dat |>
  dplyr::select(N_TOWN, N_REGION_ISO, N_REGION_WVS) |>
  dplyr::arrange(desc(N_TOWN))

summary(dat$N_REGION_WVS)

# ========= TimeSeries data ================

load("data/TimeSeries.rdata")

dat_time <- data1 |> haven::zap_labels()

dat_time |>
  dplyr::filter(COUNTRY_ALPHA == "JPN") |>
  dplyr::mutate(
    X048ISO = as.numeric(X048ISO),
    # X048ISO = ifelse(X048ISO %in% c(-5:-1), NA_real_, X048ISO)
  ) |>
  dplyr::select(year = S020, X049CS, X048ISO, X048WVS) |>
  dplyr::arrange(year) |>
  print(n = 10000)
