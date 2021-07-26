# import ALL the functions
from dice_functions import write_things, roll, continue_funct, tell_the_winner, blank_line

#welcome to players
blank_line()
print("Hi, welcome to the Dice Game!")
blank_line()

#ask for name to player 1 and store it in a variable; do the same with player 2
player1 = str(input("Please enter the name of player 1: "))
player2 = str(input("Please enter the name of player 2: "))

#initialise players score
p1_score = 0
p2_score = 0

blank_line()

#repeat all the following lines 5 times
for round in range (1,6):
  # it's player 1's turn; the line below invokes the header writer
  write_things(round, player1, round_or_not = True)
  #invoke the dices roll function and set player 1's total to the return, then print the total
  p1_total = roll()
  print (f"{player1} rolled at total of: {p1_total}")
  #the total is an even number ->
  if (p1_total% 2) == 0:
    print (f"{player1} rolled an even number, he/she gets 10 bonus points")
    p1_total = p1_total + 10
    print (f"{player1}'s score for this round is {p1_total}")
    p1_score = p1_score + p1_total
  #the total is and odd number ->
  else: 
    print (f"{player1} rolled an odd number, he/she loses 5 points")
    p1_total = p1_total - 5
    print (f"{player1}'s score for this round is: {p1_total}")
    p1_score = p1_score + p1_total
  #write the player's overall score, leave a blank line, and invoke the function that ask the player if he wants to continue
  print (f"{player1}'s overall score is now: {p1_score}")
  blank_line()
  continue_funct(p1_score, p2_score,player1,player2)

  #it's player 2's turn; make the same you did for player 1
  write_things(round, player2, round_or_not = False)

  p2_total= roll ()
  print (f"{player2} rolled at total of: {p2_total}")
  if (p2_total% 2) == 0:
    print (f"{player2} rolled an even number, he/she gets 10 bonus points")
    p2_total = p2_total + 10
    print (f"{player2}'s score for this round is {p2_total}")
    p2_score = p2_score + p2_total
  else:
    print (f"{player2} rolled an odd number, he/she loses 5 points")
    p2_total = p2_total - 5
    print (f"{player2}'s score for this round is {p2_total}")
    p2_score = p2_score + p2_total
  print (f"{player2}'s overall score is now: {p2_score}")
  blank_line()
  continue_funct(p1_score, p2_score, player1, player2)

#game is over; tell who is the winner
tell_the_winner(p1_score,p2_score,player1,player2)