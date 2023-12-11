from turtle import Turtle


class Ball(Turtle):
    def __init__(self):
        super().__init__()
        self.color("white")
        self.shape("circle")
        self.penup()
        self.x_move = 14
        self.y_move = 14
        self.ball_speed = 0.1

    def move(self):
        new_x = self.xcor() + self.x_move
        new_y = self.ycor() + self.y_move
        self.goto(new_x,new_y)

    def hit_wall(self):
        self.y_move *= -1

    def hit_paddle(self):
        self.x_move *= -1
        self.ball_speed *= 0.8

    def reset_pos(self):
        self.hideturtle()
        self.goto(0, 0)
        self.showturtle()
        self.ball_speed = 0.1
        self.hit_paddle()

