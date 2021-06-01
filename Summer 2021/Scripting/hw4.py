import sys


while (1==1):
    score = input("What is your score: ")
    if (int(score)>= 93):
        print("The grade for a score of " + score + " is A")
    elif (int(score)>= 90):
        print("The grade for a score of " + score + " is A-")
    elif (int(score)>= 86):
        print("The grade for a score of " + score + " is B+")
    elif (int(score)>= 83):
        print("The grade for a score of " + score + " is B")
    elif (int(score)>= 80):
        print("The grade for a score of " + score + " is B-")
    elif (int(score)>= 76):
        print("The grade for a score of " + score + " is C+")
    elif (int(score)>= 73):
        print("The grade for a score of " + score + " is C")
    elif (int(score)>= 70):
        print("The grade for a score of " + score + " is C-")
    elif (int(score)>= 66):
        print("The grade for a score of " + score + " is D+")
    elif (int(score)>= 63):
        print("The grade for a score of " + score + " is D")
    elif (int(score)>= 60):
        print("The grade for a score of " + score + " is D-")
    else:
        print("The grade for a score of " + score + " is F")