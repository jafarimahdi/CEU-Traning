from turtle import Turtle

class Score(Turtle):
    def __init__(self):
        super().__init__()
        self.color('white')
        self.penup()
        self.hideturtle()
        self.left_player = 0
        self.right_player = 0
        self.update_score()

    def update_score(self):
        self.clear()
        self.goto(-100, 200)
        self.write(self.right_player, align="center", font=("Courier", 80, "normal"))
        self.goto(100, 200)
        self.write(self.left_player, align="center", font=("Courier", 80, "normal"))

    def point_to_right(self):
        self.right_player += 1
        self.update_score()

    def point_to_left(self):
        self.left_player += 1
        self.update_score()