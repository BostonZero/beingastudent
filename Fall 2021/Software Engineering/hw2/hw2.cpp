//main file
#include <iostream>
#include <fstream>
#include <string>
#include "hw2_functions.h"
using namespace std;


struct course{
	string name;
	int year,num,ver;
};
int catalogSize;


int main(){
	testFoo("stringsent");
//read in file
	ifstream fin;
   	fin.open("course_catalog.txt");
/*
//count lines in file
	int linesCount = 0;
	string temp;
	while(getline(fin,temp)){
		linesCount++;#include <fstream>
	}
	fin.close()
	fin.open("course_catalog.txt");
	//reset file cursor
	*/
	cout << "Enter number of possible courses: ";
	cin >> catalogSize;
	cout << "generating catalog..." <<endl;
	struct course courses[catalogSize];
	int i = 0;
	while(i<catalogSize){
		string code;
		getline(fin, courses[i].name, '\t');
		getline(fin, code, '\n');
		code.erase(0,code.find('.')-1); //erases everything up to the year
		courses[i].year = code[0]-48; //x.x.x is an easy format to parse. no class would have more than 9 levels in a sequence so this works. also needs ascii offset
		courses[i].num = code[2]-48; //i would have preferred not to use string manipulation but its 1:00 am and i want to go to bed
		courses[i].ver = code[4]-48;
		i++;
	}
	for(int i=0;i<catalogSize;i++){
		cout << courses[i].name << '\t' << courses[i].year << '.' << courses[i].num << '.' << courses[i].ver <<endl;
	}
 













    return 0;
}

