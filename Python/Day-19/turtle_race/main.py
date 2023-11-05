from turtle import Turtle, Screen
import random



screen = Screen()
screen.setup(width=500, height=400)
user_bet = screen.textinput(title="Make your bet", prompt="Which turtle will win the race? Enter a color:")
colors = ["red","orange","yellow","green","blue","purple"]
turtles_pos = [-70, -40,-10, 20,50,80]

for item in range(0, 6):
    tim = Turtle(shape="turtle")
    tim.color(colors[item])
    tim.penup()
    tim.goto(x=-230, y=turtles_pos[item])






screen.exitonclick()