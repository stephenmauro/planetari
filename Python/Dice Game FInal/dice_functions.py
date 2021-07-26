#import python randomizer used in the "roll" function
import random

#define the dices roll
def roll():
  roll1= random.randint(1,6)
  roll2= random.randint(1,6)
  print ("Dice 1 rolled: ", roll1)
  print("Dice 2 rolled: ", roll2)
  total=roll1+roll2
  #return player's total to the main code
  return total

#define the function asking the player if he wants to continue the game
def continue_funct(p1_score,p2_score,player1,player2):
    continue_or_not = str(input("Do you want to continue? "))
    blank_line()
    #if the player write "yes" the program continues
    if continue_or_not == "yes":
        print("Okay, let's go!")
        blank_line()
    #else, if the player write "no" the code invokes the function that tells the winner and quit
    elif continue_or_not == "no":
        tell_the_winner(p1_score,p2_score,player1,player2)
        print("Bye bye, thanks for playing this game!")
        blank_line()
        exit()
    #else, print player's input and says that it isn't a valid option
    else:
        print(f"'{continue_or_not}' isn't a valid option. Try with 'yes' or 'no'.")
        blank_line()
        continue_funct(p1_score, p2_score,player1,player2)

#define the function that tells the winner
def tell_the_winner(p1_score,p2_score,player1,player2):
    blank_line()
    print("*************** Final Result ***************")
    blank_line()
    print (f"{player1}'s final score is: {p1_score}")
    print (f"{player2}'s final score is: {p2_score}")
    blank_line()
    #player 1 is the winner ->
    if p1_score > p2_score:
        print(f"The winner is... {player1}!")
        blank_line()
    #player 2 is the winner ->
    elif p2_score > p1_score:
        print (f"The winner is... {player2}!")
        blank_line()
    #nobody is the winner ->
    else:
        print ("It was a draw.")
        blank_line()

#define the round's header
def write_things(round, player_name, round_or_not = False):
    if round_or_not == True:
        blank_line()
        print(f"****************** Round {round} ******************")
    blank_line()
    print(f"{player_name}'s turn")
    blank_line()

#define a program that leaves a blank line
def blank_line():
  print()