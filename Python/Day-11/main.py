#_______ Blackjack Project ______

##### Our Blackjack House Rules ########

## The deck is unlimited in size. 
## There are no jokers. 
## The Jack/Queen/King all count as 10.
## The the Ace can count as 11 or 1.
## Use the following list as the deck of cards:
## cards = [11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
## The cards in the list have equal probability of being drawn.
## Cards are not removed from the deck as they are drawn.
## The computer is the dealer.

import random
from art import logo
from replit import clear

cards = [11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
user_cards = []
machine_cards = []

def add_card(list):
  random_card = random.choice(cards)
  list.append(random_card)
    
  
for item in range(2):
  add_card(user_cards)
  add_card(machine_cards)
  
def calculate_score(list):
  sum_of_value = sum(list)
  return sum_of_value

def show_cards(list):
  outPut =''
  for item in list:
    outPut += str( item )
    outPut += ' '
  print(f"the cards are: {outPut} = {calculate_score(list)}")
  
keep_run = True
result = ''

while keep_run:
  clear()
  print(logo)
  user_score = calculate_score(user_cards)
  machine_score = calculate_score(machine_cards)

  show_cards(user_cards)
  print(f"the first card for machine is: {machine_cards[0]}")
  
  if user_score == 21:
    result = "Awsome, you win the Game! "
    keep_run = False
  elif machine_score == 21:
    result = "Winner is the machine "
    keep_run = False
    show_cards(machine_cards)
      
  elif user_score > 21:
    if 11 in user_cards:
      user_cards.remove(11)
      user_cards.append(1)
    else:
      result = "Winner is the machine "
      keep_run = False
      show_cards(machine_cards)
      
  elif machine_score > 21: 
    if 11 in machine_cards:
      machine_cards.remove(11)
      machine_cards.append(1)
    else:
      result = "Winner is the machine "
      keep_run = False
      show_cards(machine_cards)
      
  else:
    more_card = input("would you like more card? 'Y' or 'N': ")
    if more_card  == 'y':
      add_card(user_cards)
      
    else:
      if calculate_score(user_cards) > calculate_score(machine_cards):
        result = "Great, You are the winner "  
        keep_run = False
      else:
        result = "ohhm ,machine won the game "
        keep_run = False
       # show_cards(machine_cards)

  print(result)