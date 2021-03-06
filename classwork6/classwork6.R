install.packages('tidyverse')
install.packages('dplyr')
install.packages('gapminder')
library(gapminder)
library(dplyr)
#������� ������
filter(gapminder, lifeExp < 29)
filter(gapminder, country == "Afghanistan", year > 1981)
filter(gapminder, continent %in% c("Asia", "Africa"))
#���� ����� ��� ��������
gapminder[gapminder$lifeExp < 29, ]
subset(gapminder, country == "Rwanda")



head(gapminder)
gapminder %>% head(3)
head(gapminder)


#���� �� �� �����, �� � ������
gapminder %>%
  head(4)

gapminder %>%
  filter(country == "Cambodia")
#���� �� �� �����
gapminder[gapminder$country == "Cambodia", c("year", "lifeExp")]

#��� ������������ ��������� ������� �������� ������ �������
msleep <- read.csv("https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv")
head(msleep)
#����������� �� ����� �������
msleep %>% arrange(order) %>% head
#�� ����������
msleep %>% 
  select(name, order, sleep_total) %>%
  arrange(order, sleep_total) %>% 
  head
#����������� � ����������� �� ��������
msleep %>% 
  select(name, order, sleep_total) %>%
  arrange(order, sleep_total) %>% 
  filter(sleep_total >= 16)

#���������� �������
msleep %>%
  select(name, sleep_rem, sleep_total) %>% 
  mutate(rem_proportion = sleep_rem / sleep_total) %>%
  head
#��������� ������
msleep %>% 
  summarise(avg_sleep = mean(sleep_total), 
            min_sleep = min(sleep_total),
            max_sleep = max(sleep_total),
            total = n())

msleep %>% 
  group_by(order) %>%
  summarise(avg_sleep = mean(sleep_total), 
            min_sleep = min(sleep_total), 
            max_sleep = max(sleep_total),
            total = n())