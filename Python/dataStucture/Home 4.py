def turn_right():
    turn_left()
    turn_left()
    turn_left()
    
def L_shape():
    repeat 3:
        move()
    turn_left()
    repeat 3:
        move()
def next_L():
    move()
    turn_right()
        
repeat 3:
    L_shape()
    turn_right()
    next_L()
    
L_shape()
################################################################
# WARNING: Do not change this comment.
# Library Code is below.
################################################################
