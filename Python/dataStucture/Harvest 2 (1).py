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
    get_carots()   
        
def next_line():
    turn_left()
    move()
    if object_here():
       turn_left()
    else:
        turn_back()
        repeat 2:
            move()
        turn_right()
# ----------      
turn_left()
repeat 2:
    move()
turn_right()
repeat 2:
    move()
repeat 6:
    take_one_row()
    next_line()
################################################################
# WARNING: Do not change this comment.
# Library Code is below.
################################################################
