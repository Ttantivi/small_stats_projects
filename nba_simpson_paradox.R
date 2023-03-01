# Install and Load the nbastatR package
library('nbastatR')
library('dplyr')
Sys.setenv("VROOM_CONNECTION_SIZE" = 131072 * 2)

# Access the game tables for a particular season
gamedata <- game_logs(seasons = 2021)

# Take a quick look at the data
head(gamedata)

fg_data_2021 <- gamedata %>% 
  select(namePlayer,typeSeason, slugMatchup, pctFG, pctFG3, pctFG2,fg2m, fg2a,fg3m, fg3a, fga, fgm)

curry_2021_fg <- fg_data_2021 %>%
  filter(namePlayer == "Stephen Curry")

kyrie_2021_fg <- fg_data_2021 %>%
  filter(namePlayer == "Kyrie Irving")

# data not lining up because percentages are not weighted by number of shots
mean(curry_2021_fg$pctFG3)
mean(curry_2021_fg$pctFG2)
mean(curry_2021_fg$pctFG)

mean(kyrie_2021_fg$pctFG3)
mean(kyrie_2021_fg$pctFG2)
mean(kyrie_2021_fg$pctFG)

# this should now be correct
plot(curry_2021_fg$fg3a, curry_2021_fg$fga, col = "blue")
points(kyrie_2021_fg$fg3a, kyrie_2021_fg$fga, col = "green")

plot(curry_2021_fg$fg2a, curry_2021_fg$fga, col = "blue")
points(kyrie_2021_fg$fg2a, kyrie_2021_fg$fga, col = "green")


plot(curry_2021_fg$pctFG, curry_2021_fg$fg3a/curry_2021_fg$fga, col = "blue")
points(kyrie_2021_fg$pctFG, kyrie_2021_fg$fg3a/kyrie_2021_fg$fga, col = "green")

plot(curry_2021_fg$fg3a/curry_2021_fg$fga,curry_2021_fg$pctFG, col = "blue")
points(kyrie_2021_fg$fg3a/kyrie_2021_fg$fga, kyrie_2021_fg$pctFG, col = "green")

plot(curry_2021_fg$pctFG3, curry_2021_fg$pctFG3, col = "blue")
points(kyrie_2021_fg$pctFG3, kyrie_2021_fg$pctFG3, col = "green")

plot(curry_2021_fg$pctFG, curry_2021_fg$fg2a, col = "blue")
points(kyrie_2021_fg$pctFG, kyrie_2021_fg$fg2a, col = "green")