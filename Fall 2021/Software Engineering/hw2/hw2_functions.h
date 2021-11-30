//declarations. this is just the return type, name, and params

#ifndef HW2_FUNCTIONS_H
#define HW2_FUNCTIONS_H

#include <iostream>
#include <fstream>
#include <string>
using namespace std;

//put them under here


void testFoo(string thing);
void genericGreet();
int countFile();
int getPathLength();
int validate(int y1, int n1, int v1, int y2, int n2, int v2);
int askBreak();




#endif/*
	int i = 0;
	string raw;
	//i have no idea why the code from slides throws garbage compiler 
	//errors so i had to do a bunch of string manipulation instead. 
	//memory management is luxury anyway
	while(getline(fin, raw)){
		courses[i].name = raw.substr(0, raw.find('\t')); //gets all the chars until the first tab
		raw.erase(0,raw.find('.')-1); //erases everything up to the year
		courses[i].year = int(raw[0])-48; //get the year (this can only be 1 char, also need to cast it and offset ascii)
		courses[i].num = int(raw[2])-48; //again assuming that no num could be greater than 9, thats a really large number for classes.
		courses[i].ver = int(raw[4])-48; //thank god i paid attention to string manipulation in programming in C
		// cout << courses[i].ver << int(raw[4]) << endl;
		i++;
	}
	for(int i=0; i<catalogSize; i++){
		cout << courses[i].name << '\t' << courses[i].year << '.' << courses[i].num << '.' << courses[i].ver << endl;
	}*/