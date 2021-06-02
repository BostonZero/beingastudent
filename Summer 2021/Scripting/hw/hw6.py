import sys
    
def print_table_line(celsius):
    print(str(celsius) + "\t" + str(round((celsius *1.8 + 32))))

def print_conversion_table(min, max):
    print("Celsius\tFahrenheit\n------------------")
    for celsius in range(min,max+1):
        print_table_line(celsius)

min = int(input("Please enter the starting temperature for the table: "))
max = int(input("Please enter the ending temperature for the table: "))
print()
print_conversion_table(min, max)

