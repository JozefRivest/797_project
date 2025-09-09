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
  dplyr::filter(COUNTRY_ALPHA == c("JPN", "KOR")) |>
  dplyr::mutate(
    X048ISO = as.numeric(X048ISO),
    # X048ISO = ifelse(X048ISO %in% c(-5:-1), NA_real_, X048ISO)
  ) |>
  dplyr::select(year = S020, COUNTRY_ALPHA, X049CS, X048ISO, X048WVS) |>
  dplyr::filter(year == 2010) |>
  print(n = 10000)

dat_time |>
  filter(S020 == 2010, COUNTRY_ALPHA == c("JPN", "KOR")) |>
  group_by(COUNTRY_ALPHA) |>
  summarise(count = n())

# ============= Asian Barometer ===============

ab <- haven::read_sav("data/asian_baro.sav")

head(ab)

summary(ab$IRO)

ab2 <- haven::read_dta("data/asian_baro2.dta")

head(ab2)

nrow(ab2)

unique(ab2$country)

jpn <- ab2 |>
  filter(country == 1)

jpn |>
  group_by(Region) |>
  summarise(count = n())

jpn$Region
