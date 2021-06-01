import sys

fahrIn = input("Please enter the temperature in Fahrenheit: ")
print(fahrIn + " degrees Fahrenheit is " + str(int(((int(fahrIn) - 32)/1.8))) + " degrees Celsius")
celIn = input("Please enter the temperature in Celsius: ")
print(celIn + " degrees Celsius is " + str(int(((int(celIn) *1.8 + 32)))) + " degrees Fahrenheit")
