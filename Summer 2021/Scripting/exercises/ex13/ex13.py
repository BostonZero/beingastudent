import math
import random

print("The value of pi is", math.pi)
print("The cosine of pi is", math.cos(math.pi))
print("The floor of pi is", math.floor(math.pi))
print("The ceiling of pi is", math.ceil(math.pi))

random.seed(1010)
for i in range(5):
	print(random.randint(1, 100))

print()
print("Dice game")
total = 0
count = 0
while total != 7:
	die_1 = random.randint(1, 6)
	die_2 = random.randint(1, 6)
	count += 1
	print(die_1, die_2)
	total = die_1 + die_2
print("You rolled a 7 after", count, "tries")
