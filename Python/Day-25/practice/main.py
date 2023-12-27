# import csv
#
# with open("weather_data.csv","r") as file:
#     content = csv.reader(file)
#     temperatures = []
#     for row in content:
#         if row[1] != 'temp':
#             temperatures.append(int(row[1]))
#     print(temperatures)

import pandas

data = pandas.read_csv("weather_data.csv")

select_by_day = data[data.day == "Monday"]  #it will find the row has monday
select_row = data[data.temp == data.temp.max()] #it will return the row, that has max num in temp column
# print(select_row)

# challenge -1: find the monday Temperature and show it in Fahrenheit
monday = data[data.day == "Monday"]
monday_in_c = monday.temp
print(monday_in_c)
monday_in_f = (monday_in_c * 1.8) + 32
print(monday_in_f)

# creat dataFrame from scratch