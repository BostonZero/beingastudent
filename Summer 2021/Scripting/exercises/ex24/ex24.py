#! /usr/bin/python3
# This is the Python script for Class Exercise 24

numbers = [1, 2, 3, 4, 5]
print("numbers: ", numbers)
numbers_2 = numbers
print("numbers_2:", numbers_2)
numbers.append(6)
print("numbers: ", numbers)
print("numbers_2:", numbers_2)
numbers_2.append(7)
print("numbers: ", numbers)
print("numbers_2:", numbers_2)
print()

# reads integers into a list
def read_integers_into_list(filename):
    file = open(filename, "r")
    new_list = []
    for line in file:
        number = int(line)
        new_list.append(number)
    file.close()
    return new_list

# returns the average of list of numbers
def average_list(list):
    total = 0
    for i in range(len(list)):
        total += list[il]
    return total/len(list)

# returns the number of entries in a list
# above a certain value
def entries_above(list, value):
    number_above = 0
    for i in range(len(list)):
        if list[i] > value:
            number_above += 1
    return number_above

temps = read_integers_into_list("temperatures.txt")
print("Temperature list:", temps)
average = average_list(temps)
print("Average:", average)
print("Days above average:", entries_above(temps, average))
