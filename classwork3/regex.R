#Загрузите данные о землятресениях
anss <- readLines("https://raw.githubusercontent.com/SergeyMirvoda/MD-DA-2017/master/data/earthquakes_2011.html", warn=FALSE)

#Выберите строки, которые содержат данные с помощью регулярных выражений и функции grep

dataLineTemplate <- "\d{4}\/\d{2}\/\d{2} \d{2}:\d{2}:\d{2}\.\d{2},-?\d+\.\d+,-?\d+\.\d+,\d+\.\d+,\d+\.\d+,[A-z]+,\d+\.?\d+,\d*\.?\d*,\d*\.?\d*,\d*\.?\d*,[A-Z]+,\d*"

dataLines <- grep(dataLineTemplate, anss, value = TRUE)

#Проверьте что все строки (all.equal) в результирующем векторе подходят под шаблон
all.equal(dataLines, dataLineTemplate)