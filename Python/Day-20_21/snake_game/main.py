from turtle import Screen
import time
from snake import Snake
from food import Food
from scoreBoard import Score

# play grand creation
screen = Screen()
screen.setup(width=600, height=600)
screen.bgcolor("black")
screen.title("My Snake Game")
screen.tracer(0)

# make object from other classes
snake = Snake()
food = Food()
score = Score()

# add key event for control the snake
screen.listen()
screen.onkey(snake.up, "Up")
screen.onkey(snake.down, "Down")
screen.onkey(snake.right, "Right")
screen.onkey(snake.left, "Left")


# run the game
is_game_on = True
while is_game_on:
    screen.update()
    time.sleep(0.1)
    snake.move()

    # get the food and added to the tail
    if snake.head.distance(food) < 15:
        food.refresh_food()
        snake.concat_segment()
        score.increase()

    # detect collision with walls
    if snake.head.xcor() > 280 or snake.head.xcor() < -280 or snake.head.ycor() > 280 or snake.head.ycor() < -280:
        is_game_on = False
        score.game_over()

    # detect collision with tails
    for item in snake.segments[1:]:
        if snake.head.distance(item) < 5:
            is_game_on = False
            score.game_over()

screen.exitonclick()
