from turtle import Turtle

class Snake:
    def __init__(self):
        self.starting_position = [(0, 0), (-20, 0), (-40, 0)]
        self.segments = []

    for position in starting_position:
        segment = Turtle("square")
        segment.color("white")
        segment.penup()
        segment.goto(position)
        self.segments.append(segment)

    def move(self):
        for item in range(len(segments)-1, 0, -1):
                new_x = segments[item - 1].xcor()
                new_y = segments[item - 1].ycor()
                segments[item].goto(new_x, new_y)
            segments[0].forward(20)