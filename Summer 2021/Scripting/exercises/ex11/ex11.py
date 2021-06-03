# prints the address of UMB
def print_umb_address():
    print("University of Massachusetts at Boston")
    print("100 Morrissey Boulevard")
    print("Boston, Massachusetts 02125-3393")

# prints a cheer for a team
def cheer(team):
    print("Go " + team + "!")

# asks for a value and then prints it
def get_and_print_value (label):
    value = input("Please enter your " + label + ": ")
    print()
    print(label + ":\t" + value)

a = 7
print("a:", a)
a += 1
print("a:", a)
a += 4
print("a:", a)
a -= 2
print("a:", a)
a *= 2
print("a:", a)
a //= 3
print("a:", a)
a %= 2
print("a:", a)
a **=3
print()


print_umb_address()
print()

for team in ["Red Sox", "Patriots", "Bruins", "Celtics"]:
    cheer(team)
print()
for label in ["Name", "Address", "City/State" , "Phone", "Email"]:
    get_and_print_value(label)
print()

