import turtle
from turtle import Turtle, Screen
import random


screen = Screen()
screen.setup(width=500, height=400)
user_bet = screen.textinput(title="Make your bet", prompt="Which turtle will win the race? Enter a color:")
colors = ["red","orange","yellow","green","blue","purple"]
turtles_pos = [-70, -40,-10, 20,50,80]
all_turtles = []


is_race_on = False


for item in range(0, 6):
    new_turtle = Turtle(shape="turtle")
    new_turtle.color(colors[item])
    new_turtle.penup()
    new_turtle.goto(x=-230, y=turtles_pos[item])
    all_turtles.append(new_turtle)

if user_bet:
    is_race_on = True

while is_race_on:
    for turtle in all_turtles:
        if turtle.xcor() > 230:
            is_race_on = False
            win_color = turtle.pencolor()
            if win_color == user_bet:
                print(f" Yes, your {win_color} turtle is the winner! ")
            else:
                print(f"Sorry, the {win_color} turtle is the winner and you lost the bet")
        else:
            rand_step = random.randint(0, 10)
            turtle.forward(rand_step)


screen.exitonclick()