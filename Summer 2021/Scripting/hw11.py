import sys

def read_file_into_integer_list(filename):
    intlist = []
    try:
        f = open(filename, "r")
        for line in f:
            intlist.append(int(line))
        return intlist
    except:
        return intlist
def list_mean(list):
    total = 0
    i = 0
    for num in list:
        total += num
        i += 1
    return round(total/i)

def list_median(list):
    for i in range(0,len(list)): #selection sorting algorithm
        for j in range(i,len(list)):
            if (list[i] > list[j]):
                temp = list[i]
                list[i] = list[j]
                list[j] = temp
    return list[int(len(list)/2)]
                
def list_range(list):
    min = 9999
    for num in list:
        if (num<min):
            min=num
    max = -1009
    for num in list:
        if (num>max): 
            max=num
    return max-min



###driver code
numbers = read_file_into_integer_list("xxxxxxx")
numbers = read_file_into_integer_list("numbs.txt")
print("numbers:             ", numbers)
print("list_mean(numbers):  ", list_mean(numbers))
print("list_median(numbers):", list_median(numbers))
print("list_range(numbers): ", list_range(numbers))