#Number Guessing Game Objectives:

# Include an ASCII art logo.
# Allow the player to submit a guess for a number between 1 and 100.
# Check user's guess against actual answer. Print "Too high." or "Too low." depending on the user's answer. 
# If they got the answer correct, show the actual answer to the player.
# Track the number of turns remaining.
# If they run out of turns, provide feedback to the player. 
# Include two different difficulty levels (e.g., 10 guesses in easy mode, only 5 guesses in hard mode).

import random
random_num = random.randint(1, 100)
print(random_num)

games_level = input('would you like to play in "Easy" or "hard" level? :')


if games_level == 'hard':
  time_player_try = 4
else:
  time_player_try = 7

while time_player_try > 0:
  print(f"you have {time_player_try} life to left")
  user_guas = int(input("please add you first number: "))
  
  if user_guas > random_num:
    time_player_try -= 1
    if user_guas - random_num >= 15:
      print('you are so far and enter smaller number! ')

    else:
      print('you are close and enter smaller number! ')

  elif random_num > user_guas:
    time_player_try -= 1
    if random_num - user_guas >= 15:
            print('you are so far and enter bigger number! ')
    else:
      print('you are close and enter bigger number! ')

  else:
    print('you guess is correct!  ')

if time_player_try == 0:
  print('sorry, you lost the game!')
  print(f"the correct number was {random_num}")