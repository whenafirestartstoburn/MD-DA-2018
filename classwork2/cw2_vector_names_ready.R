# ���� (�������� �����)
ural_home <- c(2, 0, 1, 0)

# ��������
ural_away <- c(0, 0, 1, 1)

#����������� �� ������� ��� �������
print("�������:")
print(ural_home)
print(ural_away)

# �������� ����� �������� ������� (������� �����)
names(ural_home) <- c("Ufa", "CSKA", "Arsenal", "Anzhi")

#���������� �� �� ����� ��� ������� ural_away �������� ����� ������ ������ (away_names)
away_names <- c("Rostov", "Amkar", "Rubin", "Orenburg")

names(ural_away) <- away_names

#����������� �� ������� ��� �������, �������� �������
print("���������� �������� ������:")
print(ural_home)
print("���������� �������� ������:")
print(ural_away)

#���������� ���������� �������� � �������� ������ (����� ���-�� �����, ������� ���������� �����)
print("������� ���������� ����� � �������� ������:")
mean(ural_home)
print("������� ���������� ����� � �������� ������:")
mean(ural_away)
print("����� ���������� ����� � �������� ������:")
sum(ural_home)
print("����� ���������� ����� � �������� ������:")
sum(ural_away)

#�������� ������� ural_home � ural_away � �������� �����
if(identical(ural_home,ural_away)) print("������� ���������") else print("������� �� ��������� :( ")
