from turtle import Turtle
ALIGN = "center"
FONT = ("Arial", 20, "normal")


class Score(Turtle):
    def __init__(self):
        super().__init__()
        self.score = 0
        self.color("white")
        self.penup()
        self.goto(0, 270)
        self.hideturtle()
        self.update_score()

    def update_score(self):
        self.write(f"Score:{self.score}", align=ALIGN, font=FONT)

    # increase the score and update
    def increase(self):
        self.score += 1
        self.clear()
        self.write(f"Score:{self.score}", align=ALIGN, font=FONT)

    # show the game over on screen
    def game_over(self):
        self.color("white")
        self.penup()
        self.goto(0, 0)
        self.write("Game Over", align=ALIGN, font=FONT)


