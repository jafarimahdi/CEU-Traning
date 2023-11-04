from turtle import Turtle, Screen

tim = Turtle()
screen = Screen()

def move_forward():
    tim.forward(10)
def move_backward():
    tim.backward(10)

def turn_left():
    tim.left(10)

def turn_right():
    tim.right(10)

def restart():
    tim.clear()
    tim.penup()
    tim.home()
    tim.pendown()

screen.listen()

screen.onkey(move_forward,"w")
screen.onkey(move_backward,"s")
screen.onkey(turn_right,"a")
screen.onkey(turn_left,"d")

screen.onkey(restart,"c")

screen.exitonclick()