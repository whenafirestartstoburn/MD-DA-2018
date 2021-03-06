#��������� ������ � ��������������
anss <- readLines("https://raw.githubusercontent.com/SergeyMirvoda/MD-DA-2017/master/data/earthquakes_2011.html", warn=FALSE)

#�������� ������, ������� �������� ������ � ������� ���������� ��������� � ������� grep

#��������� �������� ��� ������ � ������� (������������� ������ regex101.com)
dataLineTemplate <- "\\d{4}\\/\\d{2}\\/\\d{2} \\d{2}:\\d{2}:\\d{2}\\.\\d{2},-?\\d+\\.\\d+,-?\\d+\\.\\d+,\\d+\\.\\d+,\\d+\\.\\d+,[A-z]+,\\d+\\.?\\d+,\\d*\\.?\\d*,\\d*\\.?\\d*,\\d*\\.?\\d*,[A-Z]+,\\d*"

#������� ������ � �������
dataLines <- grep(dataLineTemplate, anss, value = TRUE)

#��������� ��� ��� ������ (all.equal) � �������������� ������� �������� ��� ������
all.equal(dataLines, dataLineTemplate)
