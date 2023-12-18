from turtle import Turtle

FONT = ("Courier", 20, "normal")


class Scoreboard(Turtle):
    def __init__(self):
        super().__init__()
        self.color('black')
        self.penup()
        self.hideturtle()
        self.player_score = 1
        self.update_score()

    def update_score(self):
        self.clear()
        self.goto(-180, 250)
        self.write(f"Level: {self.player_score}", align="right", font=FONT)

    def game_over(self):
        self.goto(10, 0)
        self.write("GAME OVER", align="right", font=FONT)