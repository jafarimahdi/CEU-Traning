import turtle
import pandas

screen = turtle.Screen()
screen.title("U.S. States Game")

image ="blank_states_img.gif"
screen.addshape(image)
turtle.shape(image)

# 1- reading csv file
# 2- select the names of the states in csv and convert to the list
data = pandas.read_csv("50_states.csv")
list_of_states = data.state.tolist()
user_guested = []


while len(user_guested) < 50:
    user_input = screen.textinput(title=f"{len(user_guested)}/50 states", prompt="what's another state's name?").title()

    if user_input == "Exit":
        break
    if user_input in list_of_states:
        user_guested.append(user_input)
        t = turtle.Turtle()     # use turtle class
        t.hideturtle()
        t.penup()
        place_on_map = data[data.state == user_input]
        t.goto(int(place_on_map.x), int(place_on_map.y))
        t.write(user_input)

# add the forgotten states to learn .csv format
