def turn_right():
    turn_left()
    turn_left()
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
        
def game_on():
    put()
    start()
    
game_on()
################################################################
# WARNING: Do not change this comment.
# Library Code is below.
################################################################
