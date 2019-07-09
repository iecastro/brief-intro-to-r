#remotes::install_github("rstudio/gt")

library(gt)
data("pizzaplace")

#write_excel_csv(pizzaplace, "data/pizza.csv")


#--
pizzaplace %>%
  group_by(type) %>%
  count()


pizzaplace %>%
  mutate(date = lubridate::as_date(date)) %>%
  group_by(date, type) %>%
  count() %>%
  ggplot(aes(date, n)) +
  geom_line(aes(color = type))


pizzaplace %>%
  mutate(date = lubridate::as_date(date)) %>%
  group_by(date = lubridate::month(date, label = TRUE)) %>%
  summarise(sales = sum(price)) %>%
  ggplot(aes(date, sales)) +
  geom_line(group = 1) +
  scale_y_continuous(labels = scales::dollar)



