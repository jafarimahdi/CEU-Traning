from turtle import Turtle
import random

COLORS = ["red", "orange", "yellow", "green", "blue", "purple"]
STARTING_MOVE_DISTANCE = 5
MOVE_INCREMENT = 10

class CarManager():
    def __init__(self):
        self.all_cars = []

    def create_car(self):
        car_amount = random.randint(1,6)
        if car_amount == 1:
            new_car = Turtle()
            new_car.shape("square")
            new_car.shapesize(stretch_len=2, stretch_wid=1)
            new_car.penup()
            new_car.color(random.choice(COLORS))
            new_car.goto(300, random.randint(-230, 230))
            self.all_cars.append(new_car)

    def move_car(self):
        for item in self.all_cars:
            item.backward(MOVE_INCREMENT)