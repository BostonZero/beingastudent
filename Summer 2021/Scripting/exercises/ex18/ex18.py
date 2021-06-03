import random

FILENAME = "scores.txt"

# generate a file of pseudorandom numbers
random.seed(89)
scores_file = open(FILENAME, "w")
for i in range(20):
	number = str(random. randint(0, 100))
	scores_file.write(number + "\n")
scores_file.close()

# print the file using a while loop
scores_file = open(FILENAME, "r")
line = scores_file.readline()
while line != "":
	print(line, end="")
	line = scores_file.readline()
scores_file.close()

print()

# average the numbers in the scores file using a for loop
scores_file = open(FILENAME, "r")
total = 0
count = 0
for number in scores_file:
	total += int(number)
	count += 1
print("There were", count, "numbers" )
average = round(total/count)
print("The average of the numbers was", str(average))
