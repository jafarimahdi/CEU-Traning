import csv

with open("weather_data.csv","r") as file:
    content = csv.reader(file)
    temperatures = []
    for row in content:
        if row[1] != 'temp':
            temperatures.append(int(row[1]))
    print(temperatures)

