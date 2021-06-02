import sys


def average_temps(max, min):
    return round((max+min)/2)

#read into list: parsed vals (date, max, min), calculate average. zero index is just for formatting
f = open("temps_max_min.txt","r")
table = []
for line in f:
    tempStr = line.split()
    table.append([tempStr[0], tempStr[1], tempStr[2], average_temps(int(tempStr[1]), int(tempStr[2]))])

max_average = -5000 #lame attempt at unrealistic value since i cant leave this null
min_average = 999 #same here
max_date = None
min_date = None

for line in table:
    if (line[3] > max_average):
        max_average = line[3]
        max_date = line[0]
    if (line[3] < min_average):
        min_average = line[3]
        min_date = line[0]    


print("Maximum average temperature: " + str(max_average) + " on " + max_date)
print("Minimum average temperature: " + str(min_average) + " on " + min_date)








