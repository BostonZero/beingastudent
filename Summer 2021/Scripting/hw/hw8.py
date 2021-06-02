import sys
import random

def random_number_file_create(min, max, name, num):
    f = open(name, "w")
    for i in range(0,num):
        f.write(str(random.randint(min,max))+"\n")
    f.close()
def lines_print(name):
    f = open(name, "r")
    for line in f:
        print(line.rstrip())
    f.close()

def lines_count(name):
    f = open(name, "r")
    i = 0
    for line in f:
        i += 1
    f.close()
    return i
def total_numbers_in_file(name):
    f = open(name, "r")
    i = 0
    for line in f:
        line = line.rstrip()
        i += int(line)
    f.close()
    return i




FILENAME = "numbers.txt"
random.seed(83)
random_number_file_create(50, 100, FILENAME, 20)
lines_print(FILENAME)
print()
entries = lines_count(FILENAME)
total   = total_numbers_in_file(FILENAME)
average = round(total/entries)
print("Entries:", entries)
print("Total:", total)
print("Average:", average)