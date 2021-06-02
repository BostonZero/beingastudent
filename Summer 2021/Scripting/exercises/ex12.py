# a function that prints a cheer
def cheer(t):
print("Go " + t + 1)
# prints a cheer many times
def cheer_many(tm, times=3):
for i in range(times):
cheer(tm)
# prints the square of a nusber
def print_square(num) :
print(num, "squared is", num *+ 2)
# prints the cube of a number
def print_cube (num) :
print(num, "cubed is", num xx 3)
# prints a number raised to a power
def print_power (num, pow=2):
print(num, "multiplied by itself", pow, "times is", num + pow)
print()
cheer_many("Patriots", 2)
print()
cheer_many("Red Sox")
print()
cheer_many(tines=1, tm="Bruins")
print()
for number in range(1, 6):
print_square (number)
print()
for number in range(1, 6):
print_cube(nusber)
print()
for number in range(1, 6):
print_power (number)
