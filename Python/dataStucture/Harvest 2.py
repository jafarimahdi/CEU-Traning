def turn_right():
    turn_left()
    turn_left()
    turn_left()
    
def turn_back():
    repeat 2:
        turn_left()
# -----------------------------
def get_carots():
    while object_here():
        take()
    
def take_one_row():
    repeat 5:
        get_carots()
        move()
        
def next_line():
    turn_left()
    move()
# ----------      
turn_left()
repeat 2:
    move()
turn_right()
repeat 2:
    move()
take_one_row()
################################################################
# WARNING: Do not change this comment.
# Library Code is below.
################################################################
