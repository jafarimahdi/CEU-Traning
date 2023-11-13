from turtle import Screen
import time
from snake import Snake
from food import Food
from scoreBoard import Score


screen = Screen()
screen.setup(width=600, height=600)
screen.bgcolor("black")
screen.title("My Snake Game")
screen.tracer(0)

snake = Snake()
food = Food()
score = Score()


screen.listen()
screen.onkey(snake.up, "Up")
screen.onkey(snake.down, "Down")
screen.onkey(snake.right, "Right")
screen.onkey(snake.left, "Left")


is_game_on = True
while is_game_on:
    screen.update()
    time.sleep(0.1)
    snake.move()

# get the food
    if snake.head.distance(food) < 15:
        food.refresh_food()
        score.increase()


screen.exitonclick()
