def turn_right():
    turn_left()
    turn_left()
    turn_left()
    
def turn_back():
    repeat 2:
        turn_left()
 
def get_to_point():
    turn_left()
    repeat 2:
        move()
    turn_right()
    repeat 2:
        move()
        
#get_to_point()    

def get_carrot():
   repeat 5:
        take()
        move()

def head_left():
    take()
    turn_left()
    move()
    turn_left()
  
#def head_right():
    

        


def game_on():
    get_to_point()
    repeat 4:
        get_carrot()
        head_left()
    take()
    
game_on()
################################################################
# WARNING: Do not change this comment.
# Library Code is below.
################################################################
