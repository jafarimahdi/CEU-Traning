from turtle import Screen, Turtle
from paddle import Paddle
from ball import Ball
import time
from score import Score


screen = Screen()
screen.bgcolor("black")
screen.setup(width=800, height=600)
screen.title('Pong Game')

r_paddle = Paddle((350, 0))
l_paddle = Paddle((-350, 0))
ball = Ball()
score = Score()

# use the method and key to move the paddle on screen
screen.listen()
# control the right paddle
screen.onkey(r_paddle.go_up, "Up")
screen.onkey(r_paddle.go_down, "Down")
# control the left paddle
screen.onkey(l_paddle.go_up, "w")
screen.onkey(l_paddle.go_down, "s")


# remove the animation on the screen
game_is_on = True
while game_is_on:
    time.sleep(ball.ball_speed)
    screen.update()
    ball.move()

    # check the ball hit the wall
    if ball.ycor() > 280 or ball.ycor() < -280:
        ball.hit_wall()

    # check with paddles
    if ball.distance(r_paddle) < 50 and ball.xcor() > 320 or ball.distance(l_paddle) < 50 and ball.xcor() < -320:
        ball.hit_paddle()

    # check if the ball pass the paddle for the point
    if ball.xcor() > 410:
        ball.reset_pos()
        score.point_to_right()

    if ball.xcor() < -410:
        ball.reset_pos()
        score.point_to_left()



screen.exitonclick()

