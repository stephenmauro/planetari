def check_guess(guess, answer):
    global score
    still_guessing = True
    attempt = 0
    while still_guessing and attempt < 3:
       if guess.lower() == answer.lower():
          print("Correct answer!")
          score = score + 1
          still_guessing = False
       else:
           if attempt < 2:
              guess = input("Sorry wrong answer. Try again. ")
           attempt = attempt + 1

    if attempt == 3:
       print("The correct answer is " + answer)
       
score = 0

print("Guess the Animal!")

guess1 = input("Which bear lives at the North Pole? ")
check_guess(guess1, "polar bear")

guess2 = input("What animal is thought to have inspired the unicorn? ")
check_guess(guess2, "narwhal")

guess3 = input("What is the largest animal in the world? ")
check_guess(guess3, "blue whale")

guess4 = input("Which one of the following is a fish: dolphin, eagle, turtle, salmon? ")
check_guess(guess4, "salmon")

guess5 = input("What is the largest bird in the world? ")
check_guess(guess5, "ostrich")

guess6 = input("What is the fastest animal in the world? ")
check_guess(guess6, "cheetah")

guess7 = input("which one of these is smaller?\n A) elephant\n B) dolphin\n C) sea horse\n D) chicken\n Type A, B, C, or D ")
check_guess(guess7, "c")
