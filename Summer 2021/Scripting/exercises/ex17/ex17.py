# returns data specified by the prompt
def get_data(prompt):
	return input(prompt + ": ")

teams_file = open("teams.txt", "w")

teams_file.write("Boston Red Sox\n")
teams_file.write("Baltimore Orioles\n")
teams_file.write("Toronto Blue Jays\n")
teams_file.write("Tampa Bay Rays\n")
teams_file.write("New York Yankees\n")

teams_file.close()

teams_file = open("teams.txt", "r")

teams = teams_file.read()
print(teams)
teams_file.close()

info_file = open("info.txt", "w")

for data in ["Name", "Address", "Phone"]:
	result = get_data(data)
	info_file.write(result + "\n")
info_file.close()

print()

info_file = open("info.txt", "r")
result = info_file.read()
print(result)
info_file.close()
