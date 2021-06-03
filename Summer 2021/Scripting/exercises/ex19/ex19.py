#! /usr/bin/python3
file = open('temps.txt', 'r')
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
print('Maximum:', max)
print('Minimum:', min)
