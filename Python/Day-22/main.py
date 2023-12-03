from turtle import Screen, Turtle
from paddle import Paddle

screen = Screen()
screen.bgcolor("black")
screen.setup(width=800, height=600)
screen.title('Pong Game')

r_paddle = Paddle((350,0))
l_paddle = Paddle((-350,0))

# use the method and key to move the paddle on screen
screen.listen()
# control the right paddle
screen.onkey(r_paddle.go_up(), "Up")
screen.onkey(r_paddle.go_down(), "Down")
# control the left paddle
screen.onkey(l_paddle.go_up(), "W")
screen.onkey(l_paddle.go_down(), "S")


# remove the animation on the screen
game_is_on = True
while game_is_on:
    screen.update()

screen.exitonclick()
