#! /usr/bin/python3

def open_file_read():
	while True:
		filename = input("Filename: ")
		try:
			file = open(filename, "r")
			return file
		except FileNotFoundError:
			print("Cannot find", filename)
		except PermissionError:
			print("You do not have permission to read", filename)

file = open_file_read()
count = 0
total = 0
max = -100
min = 200
for line in file:
	count += 1
	date, temp = line.split()
	temp = int(temp)
	total += temp
	if temp > max:
		max = temp
	if temp < min:
		min = temp

average = round(total/count, 2)
print('Average:', average)
print('Maxinum:', max)
print('Mininum:', min)
