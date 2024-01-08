import turtle

screen = turtle.Screen()
screen.title("U.S. States Game")

image ="blank_states_img.gif"
screen.addshape(image)

turtle.shape(image)

name_of_state = screen.textinput(title="Guess the state", prompt="what's another state's name?")
print(name_of_state)

# 1- reading csv
# 2- finding the right data in csv
# 3- make class for each state new object/turtle on each state and move to the place it must go by X and Y


screen.exitonclick()
