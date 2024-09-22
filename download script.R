library(tidyverse)
library(purrr)

download_FuelWatch_file_if_not_exists <- function(filename) {
  if (!file.exists(filename)) {
    url <- paste0("https://warsydprdstafuelwatch.blob.core.windows.net/historical-reports/", filename)
    download.file(url, destfile = filename, mode = "wb")
  }
}

last_12_months <- seq(Sys.Date() - months(11), Sys.Date(), by = "months")
date_strings <- format(last_12_months, "%m-%Y")


file_names <- paste0("FuelWatchRetail-", date_strings, ".csv")
map(file_names, download_FuelWatch_file_if_not_exists)


data_frames <- map(file_names, ~ read_csv(.x))


combined_data <- bind_rows(data_frames)


write_csv(combined_data, "FuelWatch.csv")


FuelWatch <- read_csv("FuelWatch.csv")

