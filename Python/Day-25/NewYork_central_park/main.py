import pandas

data = pandas.read_csv("Central_Park.csv")
# select colors
select_gray = len(data[data["Primary Fur Color"] == "Gray"])
select_cinnamon = len(data[data["Primary Fur Color"] == "Cinnamon"])
select_black = len(data[data["Primary Fur Color"] == "Black"])
print(select_gray)
print(select_cinnamon)
print(select_black)

# make Dictionary of the data selected
data_dict = {
    "Fur Color": ["Gray", "Cinnamon","Black"],
    "Count":[select_gray,select_cinnamon,select_black]
}
# convert to dataFrame and then to CSV file the selected datas
df = pandas.DataFrame(data_dict)
df.to_csv("squirrel_count.csv")
print(df)
