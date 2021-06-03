#! /usr/bin/python3

# This is the Python script for Class Exercise 27
team = 'Red Sox'
name = 'Glenn'
digits = '0123456789'
user = 'alpha26'
league = 'NFL'
noun = 'leaf'

print("team:             ", team)
print("'Sox' in team:    ", 'Sox' in team)
print("'Sox' not in team:", 'Sox' not in team)
print()

print("name :", name)
print("digits:", digits)
print("user :", user)
print("league:", league)
print("noun :", noun)
print()

print("name.isalnum() :", name.isalnum())
print("user.isalnum() :", user.isalnum())
print("digits.isalnum():", digits.isalnum())
print("league.isalnum():", league.isalnum())
print("noun.isalnum() :", noun.isalnum())
print()

print("name.isalpha() :", name.isalpha())
print("user.isalpha() :", user.isalpha())
print("digits.isalpha():", digits.isalpha())
print("league.isalpha():", league.isalpha())
print("noun.isalpha() :", noun.isalpha())
print()

print("name.isdigit(): ", name.isdigit())
print("user.isdigit(): ", user.isdigit())
print("digits.isdigit():", digits.isdigit())
print("league.isdigit():", league.isdigit())
print("noun.isdigit(): ", noun.isdigit())
print()

print("name.islower(): ", name.islower())
print("league.islower():", league.islower())
print("noun.islower(): ", noun.islower())
print()

print("name.isupper(): ", name.isupper())
print("league.isupper():", league.isupper())
print("noun.isupper(): ", noun.isupper())
print()
