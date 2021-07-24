# import randon
import random

# Ask player 1 to input their name. Store their answer in the variable player1
player1 = str(input("Please enter the name of player 1: "))
# Ask player 2 to input their name. Store their answer in the variable player2
player2 = str(input("Please enter the name of player 2: "))

# initialise score variable for both players
p1_score = 0
p2_score = 0

# the line below leaves an empty line. This is for styling.
print()

# for loop to play 5 rounds
for round in range (1,5):
  print()
  print ("************ Round ", round ,"******************")
  print()
  print("PLAYER 1")
  print()
  # the two lines of code below are the two dice rolls for player1
  p1_roll1= random.randint(1,6)
  p1_roll2= random.randint(1,6)
  # the two lines of code below tell player1 what their dice rolls were.
  print ("Dice 1 rolled: ", p1_roll1)
  print("Dice 2 rolled: ", p1_roll2)
  # the line beloow adds their two dice rolls together
  p1_total= p1_roll1 + p1_roll2
  # the line below tells them what their total dice roll was
  print ("Player 1 rolled a total of: ",p1_total )
  # the line below divides their total dice roll by two and checks that the remainder is 0 to see if the number is even.
  if (p1_total% 2) == 0:
    print ("Player 1 rolled an even number, they get 10 bonus points")
    # if score is even 10 points is added to their total for this round
    p1_total = p1_total + 10
    print ("Your score for this round is ", p1_total)
    # the line below adds the total for this round to their overall score
    p1_score = p1_score + p1_total
  else: # the total is odd number
    print ("Player 1 rolled an odd number, they lose 5 points")
    # takes 5 points from their total
    p1_total = p1_total - 5
    print ("Your score for this round is ", p1_total)
    # the line below adds the total for this round to their overall score
    p1_score = p1_score + p1_total
  
  # update player1 on their running score
  print ("Player 1's overall score is now: ",p1_score)

  # the code below is a repeat of the code above but for player2
  print()
  print("PLAYER 2")
  print()

  p2_roll1= random.randint(1,6)
  p2_roll2= random.randint(1,6)
  print ("Dice 1 rolled: ", p2_roll1)
  print("Dice 2 rolled: ", p2_roll2)
  p2_total= p2_roll1 + p2_roll2
  print ("Player 2 rolled at total of: ",p2_total )
  if (p2_total% 2) == 0:
    print ("Player 2 rolled an even number, they get 10 bonus points")
    p2_total = p2_total + 10
    print ("Your score for this round is ", p2_total)
    p2_score = p2_score + p2_total
  else:
    print ("Player 2 rolled an odd number, they lose 5 points")
    p2_total = p2_total - 5
    print ("Your score for this round is ", p2_total)
    p2_score = p2_score + p2_total
  print ("Player 2's overall score is now: ",p2_score)

 

print()
print("*************** Final Result ***************")
print()

# tell the players their final score
print ("Player 1 final score is: ", p1_score)
print ("Player 2 final score is: ", p2_score)

# selection statement - compares the players scores and reports the outcome
if p1_score > p2_score:
  print("Player 1 is the WINNER")
 
elif p2_score > p1_score:
  print ("Player 2 is the WINNER")
  
else:
  print ("It was a draw")
  
