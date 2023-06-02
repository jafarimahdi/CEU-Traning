from art import logo, vs
from game_data import data
import random
from replit import clear 

def game():
  user_score = 0
  game_on = True
  
  ch_a = random.choice(data)
  
  while game_on:
    print(f"Comper A: {ch_a['name']}, {ch_a['description']}, {ch_a['country']}, {ch_a['follower_count']}")
    print(vs)
  
    ch_b = random.choice(data)
    while ch_a == ch_b:
      ch_b = random.choice(data)
        
    print(f"Comper B: {ch_b['name']}, {ch_b['description']}, {ch_b['country']}, {ch_b['follower_count']}")
  
    print(f'your score is: {user_score}')
    player_choice = input('please choice "a" or "b": ')
    if player_choice == 'a':
      if ch_a['follower_count'] > ch_b['follower_count']:
        user_score += 1
      else:
        game_on = False
        if input('would you like to paly agin? "y" or "n" ') == 'y':
          clear()
          game()
        
    if player_choice == 'b':
      if ch_a['follower_count'] < ch_b['follower_count']:
        user_score += 1
        ch_a = ch_b
        
      else:
        game_on = False
        if input('would you like to paly agin? "y" or "n" ') == 'y':
          clear()
          game()
        
    clear()
        
game()
