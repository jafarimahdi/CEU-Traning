from art import logo, vs
from game_data import data
import random
from replit import clear 

def new_game():  # for Recursion 
  your_score = 0
  game_continue = True
  
  def ran_choice():
    global ch_a
    ch_a = random.choice(data)
    print(f"Comper A: {ch_a['name']}, {ch_a['description']}, {ch_a['country']}")
    print(vs)
    global ch_b
    ch_b = random.choice(data)
    print(f"Comper B: {ch_b['name']}, {ch_b['description']}, {ch_b['country']}")
    if ch_a == ch_b:
      ch_b = random.choice(data)
      print(f"Comper B: {ch_b['name']}, {ch_b['description']}, {ch_b['country']}")
    
    return(ch_a, ch_b)
  
   # -------------
  while game_continue:
    clear()
    print(logo)
    ran_choice()
    
    player_choice = input('please choice "a" or "b": ')
    user = {}
    machine ={}
    
    if player_choice == 'a':
      user = ch_a
      machine = ch_b
    else:
      user = ch_b
      machine = ch_b
  
    
    if user['follower_count'] > machine['follower_count']:
      your_score += 1
      print(f'you win and your score is: {your_score}')
    else:
      game_continue = False
      print(f'sorry, you lost the game, and your score is: {your_score}')
      if input('would you like to start game again? "y" or "n" ') == 'y':
        new_game()
      else:
        break


new_game()