#! /usr/bin/python3

def open_file_read():
	while True:
		filename = input('Filename: ')
		try:
			file = open(filename, 'r')
			return file
		except:
			print('Cannot open', filename)

file = open_file_read()
count = 0
total = 0
for line in file:
	count += 1
	date, temp = line.split()
	temp = int(temp)
	total += temp

average = round(total/count, 2)
print("Average:", average)
