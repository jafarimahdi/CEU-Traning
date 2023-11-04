def turn_right():
    turn_left()
    turn_left()
    turn_left()
def turn_back():
    repeat 2:
        turn_left()
        
def start():
    while front_is_clear():
        if right_is_clear():
            turn_right()
        move()
        if wall_in_front():
            turn_left()
        if object_here():
            break

def jump():
    turn_back()
    move()
    turn_right()
    repeat 2:
        move()
    turn_right()
    move()
    turn_left()

   

def game_on():
    put()
    jump()
    start()
    
game_on()
################################################################
# WARNING: Do not change this comment.
# Library Code is below.
################################################################
