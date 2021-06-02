import sys

def list_average(number_list):
    total = 0
    i = 0
    for num in number_list:
        total += num
        i += 1
    return round(total/i)
def list_minimum(number_list):
    min = 999
    for num in number_list:
        if (num<min):
            min=num
    return min
def list_maximum(number_list):
    max = -100
    for num in number_list:
        if (num>max): 
            max=num
    return max

def above_average(number_list):
    avg = list_average(number_list)
    total = 0
    for num in number_list:
        if (num > avg):
            total+=1
    return total

numbers = [62, 60, 58, 50, 85, 93, 99, 77, 72, 74, 61, 68, 73, 65, 57]
print("numbers      :", numbers)
print("average      :", list_average(numbers))
print("minimum      :", list_minimum(numbers))
print("maximum      :", list_maximum(numbers))
print("above average:", above_average(numbers))