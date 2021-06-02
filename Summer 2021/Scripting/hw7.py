import sys


def celsius_to_fahrenheit(celsius):
    print(str(celsius) + "\t" + str(round((celsius *1.8 + 32))))

def print_celsius_to_fahrenheit_conversion_table(min, max):
    print("Fahrenheit\tCelsius\n-----------------------")
    for fahrenheit in range(min,max+1):
        celsius_to_fahrenheit(fahrenheit)


def fahrenheit_to_celsius(fahrenheit):
    print(str(fahrenheit) + "\t" + str(round(((fahrenheit - 32)/1.8))))

def print_fahrenheit_to_celsius_conversion_table(min, max):
    print("Celsius\tFahrenheit\n----------------------")
    for celsius in range(min,max+1):
        fahrenheit_to_celsius(celsius)





min_celsius = int(input("Minimum Celsius temperature: "))
max_celsius = int(input("Maximum Celsius temperature: "))
print()
print_celsius_to_fahrenheit_conversion_table(min_celsius, max_celsius)
print()
min_fahrenheit = int(input("Minimum Fahrenheit temperature: "))
max_fahrenheit = int(input("Maximum Fahrenheit temperature: "))
print()
print_fahrenheit_to_celsius_conversion_table(min_fahrenheit, max_fahrenheit)