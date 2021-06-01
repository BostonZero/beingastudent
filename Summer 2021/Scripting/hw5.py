import sys

print("Celsius\tFahrenheit\n====================")
for i in range(0,21):
    print(str(i) + "\t" + str(round((i *1.8 + 32))))