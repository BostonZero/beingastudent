#! /usr/bin/python3
# functions dealing with lists

# adds each element in two lists and returns the total
def lists_add(l1, l2):
	total = 0
	for i in range(len(l1)):
		total += l1[i]
	for i in range(len(l2)):
		total += l2[i]
	return total

# returns the sun of subtracting the elements of the
# second parameter from the elements of the first
def lists_subtract(l1, l2):
	total = 0
	if len(l1) > len(l2):
		for i in range(len(l2)):
			total += l1[i] - l2[i]
	else:
		for i in range(len(l1)):
			total += l1[i] - l2[i]
	return total

# returns the average of a list
def list_average(l1):
	total = 0
	for i in range(len(l1)):
		total += l1[i]
	return total/len(l1)

list_1 = [1,2,3,4,5]
list_2 = [6,7,8,9,10]

print("list_1 :", list_1)
print("list_2 :", list_2)
print("list_1 + list_2 :", list_1 + list_2)
print("list_2 + list_1 :", list_2 + list_1)
print("list_1 * 2:", list_1 * 2)
print("list_2 * 3:", list_2 * 3)

print()
print("lists_add(list_1, list_2) :", lists_add(list_1, list_2))
print("lists_add(list_1, [3,2,1]) :", lists_add(list_1, [3,2,1]))

print()
print("lists_subtract(list_2, list_1) :", lists_subtract(list_2, list_1))
print("lists_subtract(list_2, [5,4,3]) :", lists_subtract(list_2, [5,4,3]))

print()
print("list_average(list_1)", list_average(list_1))
print("list_average(list_2)", list_average(list_2))
