#! /usr/bin/python3
# This is the Python script for Class Exercise 26

# returns the number of times a character occurs in a string
def character_count(string, char):
    count = 0
    for ch in string:
        if ch == char:
            count += 1
    return count

# returns a string that is the reverse of a string given
def string_reverse(string):
    new_string = ""
    for ch in string:
        new_string = ch + new_string
    return new_string

# turns an integer into a string with digits represented by words
def digits_to_words(number):
    new_string = ""
    number_string = str(number)
    for digit in number_string:
        digit = int(digit)
        new_string += digits[digit] + " "
    return new_string

# returns the first name from a full name
def first_name(full_name):
    return full_name[:full_name.index(' ')]

# returns the last name from a full name
def last_name(full_name):
    return full_name[full_name.index(' ') + 1:]

print("character_count('Mississippi', 'i'):", character_count('Mississippi', 'i'))
print("character_count('Mississippi', 'p'):", character_count('Mississippi', 'p'))
print("character_count('Mississippi', 's'):", character_count('Mississippi', 's'))
print()
print("string_reverse('Mississippi'):      ", string_reverse('Mississippi'))
print("string_reverse('radar'):            ", string_reverse('radar'))
print()
digits = ["zero", "one", "two", "three", "four"]
digits += ["five", "six", "seven", "eight", "nine"]
print("digits:", digits)
for i in range(len(digits)):
    print(str(i) + ":\t" + digits[i])
print("digits_to_words(512)", digits_to_words(512))
print("digits_to_words(10428)", digits_to_words(10428))
print()
print("first_name('Glenn Hoffman'):", first_name('Glenn Hoffman'))
print("last_name('Glenn Hoffman'): ", last_name('Glenn Hoffman'))
