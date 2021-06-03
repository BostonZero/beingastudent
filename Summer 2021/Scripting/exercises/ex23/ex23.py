#! /usr/bin/python3

# functions dealing with lists

days = ["Sunday", "Monday", "Tuesday", "Wednesday"]
days += ["Thursday", "Friday", "Saturday"]
print("days:      ", days)
weekdays = days[1:6]
print("weekdays:     ", weekdays)
daynames = days[:]
print("daynames: ", daynames)

digits = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
print("digits: ", digits)
even_digits = digits[1::2]
print("even_digits:", even_digits)
print()

print("1 in digits:    ", 1 in digits)
print("'foo' in digits:", 'foo' in digits)
print()

numbers = [1, 2, 3, 4, 5]
print("numbers:           ", numbers)
numbers.append(6)
print("numbers:           ", numbers)
print("numbers.index(6):  ", numbers.index(6))
numbers.insert(0,0)
print("numbers:           ", numbers)
numbers.remove(0)
print("numbers:           ", numbers)
numbers.reverse()
print("numbers:           ", numbers)
numbers.sort()
print("numbers:           ", numbers)
del(numbers[5])
print("numbers:           ", numbers)
print("min(numbers):      ", min(numbers))
print("max(numbers):      ", max(numbers))
