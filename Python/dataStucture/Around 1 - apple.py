def turn_right():
    turn_left()
    turn_left()
    turn_left()
    
def take_apple():
    try:
        take()
    except:
        print('no apple')
        
def catch_end():
    repeat 9:
        move()   
        take_apple()   
    turn_left()

 

repeat 4:       
    catch_end()
################################################################
# WARNING: Do not change this comment.
# Library Code is below.
################################################################
