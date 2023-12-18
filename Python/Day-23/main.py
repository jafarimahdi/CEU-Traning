import time
from turtle import Screen
from player import Player
from car_manager import CarManager
from scoreboard import Scoreboard

screen = Screen()
screen.setup(width=600, height=600)
screen.tracer(0)

player = Player()

screen.listen()
screen.onkey(player.move_up, "Up")
screen.onkey(player.move_down,"Down")

car_manager = CarManager()
show_score = Scoreboard()

game_is_on = True
while game_is_on:
    time.sleep(0.1)
    screen.update()
    show_score.update_score()

    car_manager.create_car()
    car_manager.move_car()

    # check if the cars hit turtle
    for item in car_manager.all_cars:
        if item.distance(player) < 20:
            game_is_on = False
            show_score.game_over()

    # check if the turtle successfully crossed
    if player.is_player_reach_end():
        player.reset_game()
        car_manager.increase_car_speed()
        show_score.player_score += 1


screen.exitonclick()
