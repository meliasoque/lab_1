## start from raw, clean things up, save to model data


anes <- read_csv("~/lab_1/sample_answer/data/raw/anes_pilot_2018.csv")

nrow_original <- nrow(anes)

anes <- anes %>% 
  mutate(
    voted_2016 = case_when(
      turnout16 == 1 ~ T, 
      turnout16 == 2 ~ F, 
      turnout16 == 3 & turnout16b == 1 ~ T, 
      turnout16 == 3 & turnout16b == 2 ~ F), 
    voted_2018 = case_when(
      turnout18 %in% 1:3 ~ T, 
      turnout18 == 4 ~ F, 
      turnout18 == 5 & turnout18ns == 1 ~ T, 
      turnout18 == 5 & turnout18ns == 2 ~ F)) %>% 
  filter(
    geangry  >= 0, 
    geafraid >= 0, 
    !is.na(voted_2016), 
    !is.na(voted_2018)) %>% 
  filter(birthyr < 1998) %>% 
  mutate(
    emotions = case_when(
      geafraid < geangry  ~ "More Anger", 
      geafraid == geangry ~ "Equal", 
      geafraid > geangry  ~ "More Fear"),
    emotions = factor(emotions, levels = c("More Anger", "Equal", "More Fear")),
    voting_change = voted_2018 - voted_2016
  )

write_csv(anes, file = '~/lab_1/sample_answer/data/model/anes_pilot_2018.csv')