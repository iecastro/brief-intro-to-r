library(tidyverse)


fake <- readxl::read_excel("data-raw/fake-data.xlsx")

boot <- modelr::bootstrap(fake, 100)

data <- map_df(boot$strap, as_tibble)

# write_excel_csv(data, "data/fake-study.csv")
