library(tidyverse)
library(arules)

  retail <- read.csv("retail.csv")


# Conversão da base para transctions (arule) ------------------------------

itemList <- retail %>%
  mutate(Description = Description %>% as.character()) %>% 
  select(Description,CustomerID,Date) %>% 
  nest_by(CustomerID,Date) %>% 
  mutate(data = list(data %>% unlist())) %>% 
  ungroup()

tr <- as(itemList$data,"transactions")

summary(tr)

inspect(head(tr))
