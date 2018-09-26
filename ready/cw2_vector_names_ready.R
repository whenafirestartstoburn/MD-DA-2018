# Урал (Домашние матчи)
ural_home <- c(2, 0, 1, 0)

# Выездные
ural_away <- c(0, 0, 1, 1)

#Напечатайте на консоль оба вектора
print("Векторы:")
print(ural_home)
print(ural_away)

# Назначим имена элеметом вектора (Команды Гости)
names(ural_home) <- c("Ufa", "CSKA", "Arsenal", "Anzhi")

#Проделайте то же самое для вектора ural_away назначив имена команд гостей (away_names)
away_names <- c("Rostov", "Amkar", "Rubin", "Orenburg")

names(ural_away) <- away_names

#Напечатайте на консоль оба вектора, заметьте разницу
print("Результаты домашних матчей:")
print(ural_home)
print("Результаты выездных матчей:")
print(ural_away)

#Посчитайте статистику домашних и выездных матчей (общее кол-во голов, среднее количество голов)
print("Среднее количество голов в домашних матчах:")
mean(ural_home)
print("Среднее количество голов в выездных матчах:")
mean(ural_away)
print("Общее количество голов в домашних матчах:")
sum(ural_home)
print("Общее количество голов в выездных матчах:")
sum(ural_away)

#сравните векторы ural_home и ural_away и сделайте вывод
if(identical(ural_home,ural_away)) print("Векторы совпадают") else print("Векторы не совпадают :( ")
