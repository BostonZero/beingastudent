number = 0
print("Entering while loop")
while number < 4:
    print("number:", number)
    number = number + 1
print("Left while loop")
print("number:", number)

print()

total = 0
num = 1
while num <= 100:
    total = total + num
    num = num + 1
print('The sum of all the numbers from 1 to 100 is', total)

print()

reply = ''
while reply != 'yes' :
    reply = input('Are we there yet? ')
print('Yeah!')

print()

value = int(input("Please enter an integer greater than 0: "))
while value <= 0:
    print(value, "is not greater than 0")
    value = int(input("Please enter an integer greater than 0: "))
print(value)

